package org.codegen.Handler;

import com.github.jknack.handlebars.Handlebars;
import com.github.jknack.handlebars.Template;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;


public class templateHandler {
    private static final Logger log = LoggerFactory.getLogger(templateHandler.class);
//    public static void SwaggerYaml()
//    {
//        try
//        {
//            Handlebars handlebars = new Handlebars();
//            Template template = handlebars.compile("\\HandlebarTemplates\\swaggerTemplate");
//            Path path1 = Paths.get("D:\\Intellj Projects\\SwaggerCodeGen\\src\\main\\resources\\SwaggerYaml.yml");
////            String filename = "SwaggerYaml.yml";
////            String path = path1 + File.separator + filename;
//            FileReader fileReader = new FileReader("D:\\Intellj Projects\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\jsonFiles\\SwaggerJson.json");
//            JSONParser jsonParser = new JSONParser();
//            Object obj = jsonParser.parse(fileReader);
//            FileWriter fileWriter =new FileWriter(String.valueOf(path1));
//            fileWriter.write(template.apply(obj));
//            fileWriter.close();
//        }
//        catch (Exception e)
//        {
//            log.error("Exception in SwaggerYaml() :{}", e.getMessage());
//        }
//    }

    public static void generateClassFromTemplates(String templatePath, String filePath, String jsonPath)
    {
        try
        {
            Handlebars handlebars = new Handlebars();
            Template template = handlebars.compile(templatePath);
            Path path1 = Paths.get(filePath);
            FileReader fileReader = new FileReader(jsonPath);
            JSONParser jsonParser = new JSONParser();
            Object obj = jsonParser.parse(fileReader);
            FileWriter fileWriter =new FileWriter(String.valueOf(path1));
            fileWriter.write(template.apply(obj));
            fileWriter.close();
        }
        catch (Exception e)
        {
            log.error("Exception in SwaggerYaml1() :{}", e.getMessage());
        }
    }
    public static void SwaggerYaml2(String templatePath,String filePath)
    {
        try {

            Handlebars handlebars = new Handlebars();
            Template template = handlebars.compile(templatePath);
            FileWriter fileWriter = new FileWriter(filePath);
            fileWriter.write(template.text());
            fileWriter.close();
        }
        catch (Exception e)
        {
            log.error("Exception in SwaggerYaml2() :{}", e.getMessage());
        }
    }

    public static void generateSpringBootProject(List<String> classNames) {
        directoryHandler.directoryCreation(directoryHandler.generatedDirectoryPath()+"\\service");
        directoryHandler.directoryCreation(directoryHandler.generatedDirectoryPath()+"\\controller");
        directoryHandler.directoryCreation(directoryHandler.generatedDirectoryPath()+"\\model");
        directoryHandler.directoryCreation(directoryHandler.generatedDirectoryPath()+"\\Exception");
        directoryHandler.directoryCreation(directoryHandler.outerDirectoryPath+"\\src\\main\\resources");

        try{
            File file =new File(directoryHandler.outerDirectoryPath+"\\src\\main\\resources\\application.properties");
            file.createNewFile();
        }
        catch (Exception e){
            log.info(e.getMessage(),e.getCause());
        }
        for (String className:classNames) {
            generateClassFromTemplates("HandlebarTemplates/mainClassTemplate",directoryHandler.generatedDirectoryPath()+"\\"+directoryHandler.getScriptName()+".java",directoryHandler.generatedDirectoryPath()+"\\jsonFiles\\"+className+".json");
            generateClassFromTemplates("HandlebarTemplates/pomTemplate",directoryHandler.outerDirectoryPath+"\\pom.xml",directoryHandler.generatedDirectoryPath()+"\\jsonFiles\\"+className+".json");
            generateClassFromTemplates("HandlebarTemplates/ServiceExceptionTemplate",directoryHandler.generatedDirectoryPath()+"\\Exception\\ServiceException.java",directoryHandler.generatedDirectoryPath()+"\\jsonFiles\\"+className+".json");
            generateClassFromTemplates("HandlebarTemplates/ErrorMessageTemplate",directoryHandler.generatedDirectoryPath()+"\\Exception\\ErrorMessage.java",directoryHandler.generatedDirectoryPath()+"\\jsonFiles\\"+className+".json");
            break;
        }
        for (String classname:classNames) {
            generateClassFromTemplates("HandlebarTemplates/servicesTemplate",directoryHandler.generatedDirectoryPath()+"\\service\\"+classname+"Service.java",directoryHandler.generatedDirectoryPath()+"\\jsonFiles\\"+classname+".json");
            generateClassFromTemplates("HandlebarTemplates/ControllerTemplate",directoryHandler.generatedDirectoryPath()+"\\controller\\"+classname+"Controller.java",directoryHandler.generatedDirectoryPath()+"\\jsonFiles\\"+classname+".json");
            generateClassFromTemplates("HandlebarTemplates/modelTemplate",directoryHandler.generatedDirectoryPath()+"\\model\\"+classname+".java",directoryHandler.generatedDirectoryPath()+"\\jsonFiles\\"+classname+".json");
        }

        generateClassFromTemplates("HandlebarTemplates/ControllerExceptionHandlerTemplate",directoryHandler.generatedDirectoryPath()+"\\Exception\\ControllerExceptionHandler.java","src/main/java/org/codegen/ApiCodeGen/jsonFiles/controllerExceptionHandlerJsonTemplate.json");

    }
//    public static void main(String[] args) {
//        SwaggerYaml();
//
//    }
}
