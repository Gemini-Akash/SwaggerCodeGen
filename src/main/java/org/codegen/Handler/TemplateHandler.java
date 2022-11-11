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


public class TemplateHandler {
    private static final Logger log = LoggerFactory.getLogger(TemplateHandler.class);

    /**
     *generateClassFromTemplates() method is used for generating class from templates.
     *
     * @param filePath
     * @param jsonPath
     * @param templatePath
     */
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
            fileReader.close();
        }
        catch (Exception e)
        {
            log.error("Exception in generateClassFromTemplates() :{}", e.getMessage());
        }
    }

    /**
     *generateFileFromTemplate() method is used for generating file from templates.
     *
     * @param filePath
     * @param templatePath
     */
    public static void generateFileFromTemplate(String templatePath,String filePath)
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
            log.error("Exception in generateFileFromTemplate() :{}", e.getMessage());
        }
    }

    /**
     *generateSpringBootProject() method is used for generating output in outerDirectoryPath.
     *
     * @param classNames
     */
    public static void generateSpringBootProject(List<String> classNames) {
        DirectoryHandler.createDirectory(DirectoryHandler.generateDirectoryPath()+"/service");
        DirectoryHandler.createDirectory(DirectoryHandler.generateDirectoryPath()+"/controller");
        DirectoryHandler.createDirectory(DirectoryHandler.generateDirectoryPath()+"/model");
        DirectoryHandler.createDirectory(DirectoryHandler.generateDirectoryPath()+"/Exception");
        DirectoryHandler.createDirectory(DirectoryHandler.outerDirectoryPath+"/"+DirectoryHandler.getScriptName()+"SpringBootApp/src/main/resources");

        for (String className:classNames) {
            generateClassFromTemplates("HandlebarTemplates/mainClassTemplate", DirectoryHandler.generateDirectoryPath()+"/"+ DirectoryHandler.getScriptName()+".java", DirectoryHandler.generateDirectoryPath()+"/jsonFiles/"+className+".json");
            generateClassFromTemplates("HandlebarTemplates/pomTemplate", DirectoryHandler.outerDirectoryPath+"/"+DirectoryHandler.getScriptName()+"SpringBootApp/pom.xml", DirectoryHandler.generateDirectoryPath()+"/jsonFiles/"+className+".json");
            generateClassFromTemplates("HandlebarTemplates/ServiceExceptionTemplate", DirectoryHandler.generateDirectoryPath()+"/Exception/ServiceException.java", DirectoryHandler.generateDirectoryPath()+"/jsonFiles/"+className+".json");
            generateClassFromTemplates("HandlebarTemplates/ErrorMessageTemplate", DirectoryHandler.generateDirectoryPath()+"/Exception/ErrorMessage.java", DirectoryHandler.generateDirectoryPath()+"/jsonFiles/"+className+".json");
            generateClassFromTemplates("HandlebarTemplates/controllerExceptionHandlerTemplate", DirectoryHandler.generateDirectoryPath()+"/Exception/ControllerExceptionHandler.java", DirectoryHandler.generateDirectoryPath()+"/jsonFiles/"+className+".json");
            break;
        }
        for (String classname:classNames) {
            generateClassFromTemplates("HandlebarTemplates/servicesTemplate", DirectoryHandler.generateDirectoryPath()+"/service/"+classname+"Service.java", DirectoryHandler.generateDirectoryPath()+"/jsonFiles/"+classname+".json");
            generateClassFromTemplates("HandlebarTemplates/ControllerTemplate", DirectoryHandler.generateDirectoryPath()+"/controller/"+classname+"Controller.java", DirectoryHandler.generateDirectoryPath()+"/jsonFiles/"+classname+".json");
            generateClassFromTemplates("HandlebarTemplates/modelTemplate", DirectoryHandler.generateDirectoryPath()+"/model/"+classname+".java", DirectoryHandler.generateDirectoryPath()+"/jsonFiles/"+classname+".json");
        }
        generateFileFromTemplate("HandlebarTemplates/controllerExceptionHandlerJsonTemplate", DirectoryHandler.outerDirectoryPath+"/"+DirectoryHandler.getScriptName()+"SpringBootApp/src/main/resources/controllerExceptionHandlerJson.json");
        generateFileFromTemplate("HandlebarTemplates/applicationPropertiesTemplate",DirectoryHandler.outerDirectoryPath+"/"+DirectoryHandler.getScriptName()+"SpringBootApp/src/main/resources/application.properties");

    }

}
