//package org.codegen.SwaggerCodeGen;
//
//import io.swagger.codegen.ClientOptInput;
//import io.swagger.codegen.DefaultGenerator;
//import io.swagger.codegen.config.CodegenConfigurator;
//
//public class GenerateSpringBootProject  {
//
//    public static void generateProject(String YamlPath, String lang, String ApiPackage, String ModelPackage, String InvokerPackage, String OutputDir) throws SwaggerCodeGenException {
//
//        DefaultGenerator defaultGenerator =new DefaultGenerator();
//
//        CodegenConfigurator codegenConfigurator= new CodegenConfigurator();
//
//        codegenConfigurator.setInputSpec(YamlPath)
//                .setLang(lang)
//                .setApiPackage(ApiPackage)
//                .setModelPackage(ModelPackage)
//                .setInvokerPackage(InvokerPackage)
//                .setOutputDir(OutputDir);
//
//        ClientOptInput input = codegenConfigurator.toClientOptInput();
//
//        try {
//            defaultGenerator.opts(input).generate();
//        }catch(Exception e){
//            throw  new SwaggerCodeGenException("Code generation failed. Due to some error");
//        }
//    }
//}
