package com.hrabl.code.generator.modules.common.domain;

import lombok.Data;

/**
 * 列的属性
 *
 * @author baohua.yin@qq.com
 * @date 2016年12月20日 上午12:01:45
 */
@Data
public class ColumnDO {
    /**
     * 列名
     */
    private String columnName;
    /**
     * 列名类型
     */
    private String dataType;
    /**
     * 列名备注
     */
    private String comments;
    /**
     * 属性名称(第一个字母大写)，如：user_name => UserName
     */
    private String upperAttrName;
    /**
     * 属性名称(第一个字母小写)，如：user_name => userName
     */
    private String lowerAttrName;
    /**
     * 属性类型
     */
    private String attrType;
    /**
     * 字段长度
     */
    private Integer characterOctetLength;
    /**
     * 字段列类型以及长度
     */
    private String columnType;
    /**
     * 该字段是否允许为空 YES or NO
     */
    private String isNullable;
    /**
     * auto_increment
     */
    private String extra;
    /**
     * 列键
     */
    private String columnKey;
    /**
     * 是否是版本控制器
     */
    private boolean version;

    private String jdbcType;
}
