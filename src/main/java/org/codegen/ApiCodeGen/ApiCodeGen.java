package org.codegen.ApiCodeGen;

import org.codegen.ApiCodeGen.loader.Classloader;
import org.codegen.ApiCodeGen.templateHandler.Handlebar;

import static org.codegen.ApiCodeGen.loader.Classloader.readClassName;

public class ApiCodeGen {
    static Classloader cl=new Classloader();
    static Handlebar hl=new Handlebar();
    public static void main(String[] args) {
      cl.loadClass(readClassName());
      cl.convertIntoAPIJson();
      hl.SwaggerYaml();


    }
}
