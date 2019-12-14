package com.hrabl.code.generator;


import com.hrabl.code.generator.common.utils.GenUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author baohua.yin@qq.com
 * @apiNote generator sever start
 * @since 2019/4/9 15:42
 */
@SpringBootApplication
public class CodeGeneratorApplication {
    public static void main(String[] args) {
        SpringApplication.run(CodeGeneratorApplication.class, args);
        GenUtils.generatorCode();
    }
}
