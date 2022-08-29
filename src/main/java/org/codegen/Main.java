package org.codegen;

import org.codegen.ApiCodeGen.loader.Classloader;
import org.codegen.ApiCodeGen.templateHandler.Handlebar;
import org.codegen.JOOQ.PojosGen.EntityClassGen;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.codegen.ApiCodeGen.loader.Classloader.readClassName;

public class Main {
    private static final Logger log = LoggerFactory.getLogger(Main.class);
    static Classloader cl=new Classloader();
    static Handlebar hl=new Handlebar();
    static EntityClassGen entityClassGen =new EntityClassGen();
    public static void main(String[] args) {

        log.info("<------ CodeGen FrameWork Started ------>");
        entityClassGen.EntityGenerator();
        cl.loadClass(readClassName());
        cl.convertIntoAPIJson();
        hl.SwaggerYaml();


    }
}