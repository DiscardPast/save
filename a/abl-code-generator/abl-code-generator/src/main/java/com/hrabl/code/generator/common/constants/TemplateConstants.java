package com.hrabl.code.generator.common.constants;

/**
 * @author baohua.yin@qq.com
 * @apiNote 模板通用常量
 * @since 2019/5/4 22:08
 */
public interface TemplateConstants {
    String Action = "template/Action.java.vm";
    String Entity = "template/Domain.java.vm";
    String Mapper = "template/Mapper.java.vm";
    String MapperXml = "template/Mapper.xml.vm";
    String Service = "template/Service.java.vm";
    String Controller = "template/Controller.java.vm";
    String ServiceImpl = "template/Service.impl.java.vm";
/*    String Html = "template/list.html.vm";
    String Js = "template/list.js.vm";*/

    String ServiceFactory = "template/ServiceFactory.java.vm";

//    String Menu = "template/menu.sql.vm";

    String[] Templates = new String[]{
            Action,
            Entity,
            Mapper,
            MapperXml,
            Service,
            Controller,
            ServiceImpl,
/*            Html,
            Js*/

//            Menu
    };


}
