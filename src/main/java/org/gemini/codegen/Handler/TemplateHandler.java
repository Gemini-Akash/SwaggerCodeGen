package org.gemini.codegen.Handler;

import com.github.jknack.handlebars.Handlebars;
import com.github.jknack.handlebars.Template;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;


public class TemplateHandler {
    private static final Logger LOG = LoggerFactory.getLogger(TemplateHandler.class);


    /**
     * generateClassFromTemplates() method is used for generating class from templates.
     *
     * @param filePath
     * @param jsonPath
     * @param templatePath
     */
    public static void generateClassFromTemplates(final String templatePath, final String filePath, final String jsonPath) {
        FileReader fileReader = null;
        FileWriter fileWriter = null;
        try {
            Handlebars handlebars = new Handlebars();
            Template template = handlebars.compile(templatePath);
            fileReader = new FileReader(jsonPath);
            JSONParser jsonParser = new JSONParser();
            Object obj = jsonParser.parse(fileReader);
            fileWriter = new FileWriter(filePath);
            fileWriter.write(template.apply(obj));
        } catch (Exception e) {
            LOG.error("Exception in generateClassFromTemplates() :{}", e.getMessage());
        } finally {
            try {
                fileReader.close();
                fileWriter.close();
            } catch (IOException e) {
                LOG.error("Exception in closing the file of generateClassFromTemplates() :{}", e.getMessage());
            }
        }

    }

    /**
     * generateFileFromTemplate() method is used for generating file from templates.
     *
     * @param filePath
     * @param templatePath
     */
    public static void generateFileFromTemplate(final String templatePath, final String filePath) {
        FileWriter fileWriter = null;
        try {
            Handlebars handlebars = new Handlebars();
            Template template = handlebars.compile(templatePath);
            fileWriter = new FileWriter(filePath);
            fileWriter.write(template.text());
        } catch (Exception e) {
            LOG.error("Exception in generateFileFromTemplate() :{}", e.getMessage());
        } finally {
            try {
                fileWriter.close();
            } catch (IOException e) {
                LOG.error("Exception in closing the file of generateFileFromTemplate(): {}", e.getMessage());
            }
        }
    }

    /**
     * generateSpringBootProject() method is used for generating output in outerDirectoryPath.
     *
     * @param classNames
     */
    public static void generateSpringBootProject(final List<String> classNames) {
        StringBuilder path = new StringBuilder();
        StringBuilder jsonPath = new StringBuilder();
        path.setLength(0);
        path.append(DirectoryHandler.generateDirectoryPath());
        path.append("/service");
        DirectoryHandler.createDirectory(path.toString());
        path.setLength(0);
        path.append(DirectoryHandler.generateDirectoryPath());
        path.append("/controller");
        DirectoryHandler.createDirectory(path.toString());
        path.setLength(0);
        path.append(DirectoryHandler.generateDirectoryPath());
        path.append("/model");
        DirectoryHandler.createDirectory(path.toString());
        path.setLength(0);
        path.append(DirectoryHandler.generateDirectoryPath());
        path.append("/Exception");
        DirectoryHandler.createDirectory(path.toString());
        path.setLength(0);
        path.append(DirectoryHandler.outerDirectoryPath);
        path.append("/");
        path.append(DirectoryHandler.getScriptName());
        path.append("SpringBootApp/src/main/resources");
        DirectoryHandler.createDirectory(path.toString());

        String classname = classNames.get(0);
        jsonPath.setLength(0);
        jsonPath.append(DirectoryHandler.generateDirectoryPath());
        jsonPath.append("/jsonFiles/");
        jsonPath.append(classname);
        jsonPath.append(".json");
        path.setLength(0);
        path.append(DirectoryHandler.generateDirectoryPath());
        path.append("/");
        path.append(DirectoryHandler.getScriptName());
        path.append(".java");
        generateClassFromTemplates("HandlebarTemplates/mainClassTemplate", path.toString(), jsonPath.toString());
        path.setLength(0);
        path.append(DirectoryHandler.outerDirectoryPath);
        path.append("/");
        path.append(DirectoryHandler.getScriptName());
        path.append("SpringBootApp/pom.xml");
        generateClassFromTemplates("HandlebarTemplates/pomTemplate", path.toString(), jsonPath.toString());
        path.setLength(0);
        path.append(DirectoryHandler.generateDirectoryPath());
        path.append("/Exception/ServiceException.java");
        generateClassFromTemplates("HandlebarTemplates/ServiceExceptionTemplate", path.toString(), jsonPath.toString());
        path.setLength(0);
        path.append(DirectoryHandler.generateDirectoryPath());
        path.append("/Exception/ErrorMessage.java");
        generateClassFromTemplates("HandlebarTemplates/ErrorMessageTemplate", path.toString(), jsonPath.toString());
        path.setLength(0);
        path.append(DirectoryHandler.generateDirectoryPath());
        path.append("/Exception/ControllerExceptionHandler.java");
        generateClassFromTemplates("HandlebarTemplates/controllerExceptionHandlerTemplate", path.toString(), jsonPath.toString());

        for (String className : classNames) {
            jsonPath.setLength(0);
            jsonPath.append(DirectoryHandler.generateDirectoryPath());
            jsonPath.append("/jsonFiles/");
            jsonPath.append(className);
            jsonPath.append(".json");
            path.setLength(0);
            path.append(DirectoryHandler.generateDirectoryPath());
            path.append("/service/");
            path.append(className);
            path.append("Service.java");
            generateClassFromTemplates("HandlebarTemplates/servicesTemplate", path.toString(), jsonPath.toString());
            path.setLength(0);
            path.append(DirectoryHandler.generateDirectoryPath());
            path.append("/controller/");
            path.append(className);
            path.append("Controller.java");
            generateClassFromTemplates("HandlebarTemplates/ControllerTemplate", path.toString(), jsonPath.toString());
            path.setLength(0);
            path.append(DirectoryHandler.generateDirectoryPath());
            path.append("/model/");
            path.append(className);
            path.append(".java");
            generateClassFromTemplates("HandlebarTemplates/modelTemplate", path.toString(), jsonPath.toString());
        }
        path.setLength(0);
        path.append(DirectoryHandler.outerDirectoryPath);
        path.append("/");
        path.append(DirectoryHandler.getScriptName());
        path.append("SpringBootApp/src/main/resources/controllerExceptionHandlerJson.json");
        generateFileFromTemplate("HandlebarTemplates/controllerExceptionHandlerJsonTemplate", path.toString());
        jsonPath.setLength(0);
        jsonPath.append(DirectoryHandler.generateDirectoryPath());
        jsonPath.append("/jsonFiles/applicationProperties.json");
        path.setLength(0);
        path.append(DirectoryHandler.outerDirectoryPath);
        path.append("/");
        path.append(DirectoryHandler.getScriptName());
        path.append("SpringBootApp/src/main/resources/application.properties");
        generateClassFromTemplates("HandlebarTemplates/applicationPropertiesTemplate", path.toString(), jsonPath.toString());

    }

}
