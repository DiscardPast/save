package com.hrabl.code.generator.common.vo;

import lombok.Data;

/**
 * @author baohua.yin@qq.com
 * @apiNote 常用的框架使用
 * @since 2019/5/4 16:41
 */
@Data
public class UsualFrameConfigVo {
    /**
     * 是否使用swagger注解，默认为true，会在Domain以及Controller层加上swagger相关注解
     */
    private boolean useSwagger = true;
    /**
     * 是否使用shiro安全校验注解，默认为true，会在controller层上加上shiro相关注解
     */
    private boolean useShiro = true;
}
