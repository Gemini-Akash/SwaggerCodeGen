package org.gemini.codegen.handler;

import com.github.jknack.handlebars.Handlebars;
import com.github.jknack.handlebars.Template;
import org.gemini.codegen.apicodegen.utiltiy.CodeGenUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sonarsource.scanner.api.internal.shaded.minimaljson.JsonObject;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;


public final class TemplateHandler {
    private static final Logger LOG = LoggerFactory.getLogger(TemplateHandler.class);

    /**
     * generateClassFromTemplates() method is used for generating class from templates.
     *
     * @param filePath
     * @param jsonObject
     * @param templatePath
     */

    private void generateClassFromTemplates(final String templatePath, final String filePath, final JSONObject jsonObject) {
        try (FileWriter fileWriter = new FileWriter(filePath)) {
            Handlebars handlebars = new Handlebars();
            Template template = handlebars.compile(templatePath);
            JSONParser jsonParser = new JSONParser();
            fileWriter.write(template.apply(jsonParser.parse(String.valueOf(jsonObject))));
        } catch (Exception e) {
            LOG.error("Exception in generateClassFromTemplates() :{}", e.getMessage());
        }
    }

    /**
     * generateFileFromTemplate() method is used for generating file from templates.
     *
     * @param filePath
     * @param templatePath
     */
    private void generateFileFromTemplate(final String templatePath, final String filePath) {
        try (FileWriter fileWriter = new FileWriter(filePath)) {
            Handlebars handlebars = new Handlebars();
            Template template = handlebars.compile(templatePath);
            fileWriter.write(template.text());
        } catch (Exception e) {
            LOG.error("Exception in generateFileFromTemplate() :{}", e.getMessage());
        }
    }

    /**
     * generateSpringBootProject() method is used for generating output in outerDirectoryPath.
     */
    public void generateSpringBootProject() {
        StringBuilder path = new StringBuilder();
        StringBuilder jsonPath = new StringBuilder();
        path.setLength(0);
        path.append(CodeGenUtils.generateDirectoryPath());
        path.append("/service");
        CodeGenUtils.createDirectory(path.toString());
        path.setLength(0);
        path.append(CodeGenUtils.generateDirectoryPath());
        path.append("/controller");
        CodeGenUtils.createDirectory(path.toString());
        path.setLength(0);
        path.append(CodeGenUtils.generateDirectoryPath());
        path.append("/model");
        CodeGenUtils.createDirectory(path.toString());
        path.setLength(0);
        path.append(CodeGenUtils.generateDirectoryPath());
        path.append("/exception");
        CodeGenUtils.createDirectory(path.toString());
        path.setLength(0);
        path.append(CodeGenUtils.generateDirectoryPath());
        path.append("/configuration");
        CodeGenUtils.createDirectory(path.toString());
        path.setLength(0);
        path.append(CodeGenUtils.createMap().get("outerDirectoryPath"));
        path.append("/");
        path.append(CodeGenUtils.getScriptName());
        path.append("SpringBootApp/src/main/resources");
        CodeGenUtils.createDirectory(path.toString());
        jsonPath.setLength(0);
        jsonPath.append(CodeGenUtils.generateDirectoryPath());
        jsonPath.append("/jsonFiles/Loader.json");
        try (FileReader fileReader = new FileReader(jsonPath.toString())) {
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = new JSONObject(jsonParser.parse(fileReader).toString());
            JSONArray jsonArray = jsonObject.getJSONArray("classes");
            jsonObject = (JSONObject) jsonArray.get(0);
            path.setLength(0);
            path.append(CodeGenUtils.generateDirectoryPath());
            path.append("/");
            path.append(CodeGenUtils.getScriptName());
            path.append(".java");
            generateClassFromTemplates("HandlebarTemplates/mainClassTemplate", path.toString(), jsonObject);
            path.setLength(0);
            path.append(CodeGenUtils.createMap().get("outerDirectoryPath"));
            path.append("/");
            path.append(CodeGenUtils.getScriptName());
            path.append("SpringBootApp/pom.xml");
            generateClassFromTemplates("HandlebarTemplates/pomTemplate", path.toString(), jsonObject);
            path.setLength(0);
            path.append(CodeGenUtils.generateDirectoryPath());
            path.append("/exception/ErrorMessage.java");
            generateClassFromTemplates("HandlebarTemplates/ErrorMessageTemplate", path.toString(), jsonObject);
            path.setLength(0);
            path.append(CodeGenUtils.generateDirectoryPath());
            path.append("/exception/ControllerExceptionHandler.java");
            generateClassFromTemplates("HandlebarTemplates/controllerExceptionHandlerTemplate", path.toString(), jsonObject);
            path.setLength(0);
            path.append(CodeGenUtils.generateDirectoryPath());
            path.append("/configuration/MetricConfiguration.java");
            generateClassFromTemplates("HandlebarTemplates/MetricConfigurationTemplate", path.toString(), jsonObject);
            for (Object obj : jsonArray) {
                jsonObject = (JSONObject) obj;
                path.setLength(0);
                path.append(CodeGenUtils.generateDirectoryPath());
                path.append("/service/");
                path.append(jsonObject.get("className"));
                path.append("Service.java");
                generateClassFromTemplates("HandlebarTemplates/servicesTemplate", path.toString(), jsonObject);
                path.setLength(0);
                path.append(CodeGenUtils.generateDirectoryPath());
                path.append("/controller/");
                path.append(jsonObject.get("className"));
                path.append("Controller.java");
                generateClassFromTemplates("HandlebarTemplates/ControllerTemplate", path.toString(), jsonObject);
                path.setLength(0);
                path.append(CodeGenUtils.generateDirectoryPath());
                path.append("/model/");
                path.append(jsonObject.get("className"));
                path.append(".java");
                generateClassFromTemplates("HandlebarTemplates/modelTemplate", path.toString(), jsonObject);
            }
        } catch (IOException | ParseException e) {
            LOG.info("Exception in generateSpringBootProject(): {}", e.getMessage());
        }

        path.setLength(0);
        path.append(CodeGenUtils.createMap().get("outerDirectoryPath"));
        path.append("/");
        path.append(CodeGenUtils.getScriptName());
        path.append("SpringBootApp/src/main/resources/controllerExceptionHandlerJson.json");
        generateFileFromTemplate("HandlebarTemplates/controllerExceptionHandlerJsonTemplate", path.toString());
        jsonPath.setLength(0);
        jsonPath.append(CodeGenUtils.generateDirectoryPath());
        jsonPath.append("/jsonFiles/applicationProperties.json");
        path.setLength(0);
        path.append(CodeGenUtils.createMap().get("outerDirectoryPath"));
        path.append("/");
        path.append(CodeGenUtils.getScriptName());
        path.append("SpringBootApp/src/main/resources/application.properties");
        try (FileReader fileReader = new FileReader(jsonPath.toString())){
            JSONParser jsonParser = new JSONParser();
            Object obj = jsonParser.parse(fileReader);
            JSONObject jsonObject=new JSONObject(obj.toString());
            generateClassFromTemplates("HandlebarTemplates/applicationPropertiesTemplate", path.toString(),jsonObject);
        } catch (IOException | ParseException e) {
            LOG.info("Exception in generateSpringBootProject(): {}", e.getMessage());
        }
    }

}
