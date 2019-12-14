package com.hrabl.code.generator.modules.mysql.service;

import com.hrabl.code.generator.common.exception.ServiceException;
import com.hrabl.code.generator.common.utils.GeneratorTypeUtils;
import com.hrabl.code.generator.common.utils.NameUtils;
import com.hrabl.code.generator.modules.common.domain.ColumnDO;
import com.hrabl.code.generator.modules.common.domain.TableDO;
import com.hrabl.code.generator.modules.common.service.GeneratorService;
import com.hrabl.code.generator.modules.mysql.dao.MysqlGeneratorDao;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;


/**
 * @author baohua.yin@qq.com
 * @apiNote Mysql 数据库代码生成器服务层
 * @date 22019-4-9 17:12:11
 */
@Service
public class MysqlGeneratorService extends GeneratorService<MysqlGeneratorDao> {

    /**
     * 处理数据库列信息
     * @param table         数据库表
     * @param columns       数据库列集合
     * @param hasBigDecimal 是否有bigDecimal数据格式
     */
    @Override
    protected void disposeColumns(TableDO table, List<ColumnDO> columns, AtomicBoolean hasBigDecimal) {
        columns.forEach(column -> {
            column.setUpperAttrName(NameUtils.convertName(column.getColumnName(), StringUtils.split(defaultConfig.getColumnPrefix(), ",")));
            column.setLowerAttrName(StringUtils.uncapitalize(column.getUpperAttrName()));
            String attrType;
            // 我比较喜欢用tinyint(1)作为boolean类型，然后根据配置文件查找对应数据类型
            if ("tinyint(1)".equals(column.getColumnType())) {
                attrType = "Boolean";
            } else {
                attrType = GeneratorTypeUtils.Mysql.get(column.getDataType());
                attrType = attrType == null ? "String" : attrType;
            }
            if (!hasBigDecimal.get() && "BigDecimal".equals(attrType)) {
                hasBigDecimal.set(true);
            }
            //是否主键
            if ("PRI".equalsIgnoreCase(column.getColumnKey()) && table.getPk() == null) {
                table.setPk(column);
            }
            column.setAttrType(attrType);
            String jdbcType="";
            if("varchar".equals(column.getDataType())){
                jdbcType="VARCHAR";
            }
            else if("int".equals(column.getDataType())){
                jdbcType="INTEGER";
            }
            else if("bigint".equals(column.getDataType())){
                jdbcType="BIGINT";
            }
            else if("tinyint".equals(column.getDataType())){
                if ("tinyint(1)".equals(column.getColumnType())) {
                    jdbcType = "Boolean";
                } else {
                    jdbcType="TINYINT";
                }
            }
            else if("datetime".equals(column.getDataType())){
                jdbcType="TIMESTAMP";
            }
            else if("date".equals(column.getDataType())){
                jdbcType="DATA";
            }
            else if("bit".equals(column.getDataType())){
                jdbcType="BIT";
            }
            else if("decimal".equals(column.getDataType())){
                jdbcType="DECIMAL";
            }
            else {
                throw new ServiceException("没有指定jdbcType，请指定");
            }
            column.setJdbcType(jdbcType);
        });
        table.setColumns(columns);
    }
}
