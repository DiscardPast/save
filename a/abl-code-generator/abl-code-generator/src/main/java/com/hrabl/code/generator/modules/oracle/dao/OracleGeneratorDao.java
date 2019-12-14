package com.hrabl.code.generator.modules.oracle.dao;


import com.hrabl.code.generator.modules.common.dao.GeneratorDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author baohua.yin@qq.com
 * @apiNote Oracle相关查询持久层
 * @since 2019/3/25 16:24
 */
@Mapper
public interface OracleGeneratorDao extends GeneratorDao {

    /**
     * 根据表名查询表主键
     *
     * @param tableName 表名
     * @return 主键列名
     */
    String getPrimaryKey(String tableName);
}
