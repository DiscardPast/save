package com.hrabl.code.generator.common.utils;


import com.hrabl.code.generator.common.constants.ExceptionConstants;
import com.hrabl.code.generator.common.exception.ServiceException;
import lombok.extern.slf4j.Slf4j;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * @author baohua.yin@qq.com
 * @apiNote java bean 工具包
 * @since 2019/4/9 0:31
 */
@Slf4j
public class BeanUtils {

    /**
     * javabean 转化为 map对象
     *
     * @param obj the object
     * @return 对象转化后的map结果
     */
    public static Map<String, Object> bean2Map(Object obj) {
        if (obj == null) {
            return null;
        }
        Map<String, Object> data = new HashMap<>(1 << 4);
        try {
            BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            for (PropertyDescriptor property : propertyDescriptors) {
                // 属性名作为键
                String key = property.getName();
                // 过滤掉class属性
                if ("class".equals(key)) {
                    continue;
                }
                // 通过get方法获取值
                Method getMethod = property.getReadMethod();
                Object value = getMethod.invoke(obj);
                data.put(key, value);
            }
        } catch (Exception e) {
            throw new ServiceException(ExceptionConstants.Bean2Map);
        }
        return data;
    }
}
