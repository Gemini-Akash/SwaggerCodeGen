package org.gemini.codegen;

import org.gemini.codegen.apicodegen.loader.CustomClassLoader;
import org.gemini.codegen.apicodegen.utiltiy.CodeGenUtils;
import org.gemini.codegen.apicodegen.validator.DialectValidator;
import org.gemini.codegen.apicodegen.validator.JsonValidator;
import org.gemini.codegen.handler.DbJsonHandler;
import org.gemini.codegen.handler.DirectoryHandler;
import org.gemini.codegen.handler.TemplateHandler;
import org.gemini.codegen.jooqpojogen.EntityClassGenerator;
import org.gemini.codegen.jooqpojogen.FileNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.List;

public class CodeGeneratorApp {

    private static final Logger LOG = LoggerFactory.getLogger(CodeGeneratorApp.class);

    public static void main(String[] args) {
        DbJsonHandler dbJsonHandler = new DbJsonHandler();
        TemplateHandler templateHandler = new TemplateHandler();
        CustomClassLoader customClassLoader = new CustomClassLoader();
        DialectValidator dialectValidator = new DialectValidator();
        JsonValidator jsonValidator = new JsonValidator();
        DirectoryHandler directoryHandler = new DirectoryHandler();
        StringBuilder path = new StringBuilder();


        LOG.info("<------ CodeGen FrameWork Started ------>");
        dialectValidator.validateDialect(CodeGenUtils.createMap().get("dialect"));
        CodeGenUtils.createDirectory(CodeGenUtils.generateDirectoryPath());
        try {
            path.setLength(0);
            path.append("com.gemini.");
            path.append(CodeGenUtils.getScriptName());
            path.append(".entity");
            EntityClassGenerator.EntityGenerator(CodeGenUtils.createMap().get("outerScriptDirectoryPath"), path.toString(), CodeGenUtils.generateDirectoryPath());
        } catch (FileNotFoundException e) {
            LOG.error("Exception in generating POJO classes: {}", e.message);
        } catch (Exception e) {
            LOG.error("Exception in generating POJO classes: {}", e.getMessage());
        }
        path.setLength(0);
        path.append(CodeGenUtils.generateDirectoryPath());
        path.append("/com/gemini/");
        path.append(CodeGenUtils.getScriptName());
        path.append("/entity");
        directoryHandler.renameDirectory(new File(path.toString()), new File(CodeGenUtils.generateDirectoryPath() + "/entity"));

        path.setLength(0);
        path.append(CodeGenUtils.generateDirectoryPath());
        path.append("/entity/");
        path.append(CodeGenUtils.getSchemaName());
        path.append("/tables/pojos/");
        List<String> classNames = customClassLoader.loadClass(customClassLoader.getFullyQualifiedClasses(new File(path.toString())), CodeGenUtils.generateDirectoryPath());
        LOG.info(" ClassNames------>{}", classNames);
        jsonValidator.validateJsonFiles(classNames);
        dbJsonHandler.createDbJson(new File(CodeGenUtils.generateDirectoryPath() + "/jsonFiles/applicationProperties.json"), CodeGenUtils.createMap().get("url"), CodeGenUtils.createMap().get("dialect"), CodeGenUtils.createMap().get("username"), CodeGenUtils.createMap().get("password"), CodeGenUtils.createMap().get("driverClassName"));
        templateHandler.generateSpringBootProject(classNames);

        path.setLength(0);
        path.append(CodeGenUtils.generateDirectoryPath());
        path.append("/com");
        directoryHandler.deleteDirectory(path.toString());
        path.setLength(0);
        path.append(CodeGenUtils.generateDirectoryPath());
        path.append("/jsonFiles");
        directoryHandler.deleteDirectory(path.toString());
        path.setLength(0);
        path.append(CodeGenUtils.generateDirectoryPath());
        path.append("/entity/");
        path.append(CodeGenUtils.getSchemaName());
        path.append("/tables/pojos/");
        directoryHandler.deleteFiles(classNames, path.toString());
        LOG.info("<------ CodeGen FrameWork Successfully Generated------>");

        /**
         *To Do
         *
         * This generateProject() method was used earlier during generation of project from SwaggerYaml.
         */

//        Handlebar.SwaggerYaml();
//        try {
//           GenerateSpringBootProject.generateProject("src/main/resources/SwaggerYaml.yml", "spring", "io.codejournal.maven.swagger2java.api", "io.codejournal.maven.swagger2java.model", "io.codejournal.maven.swagger2java.handler", "src/main/java/org/Autogenerated");
//        } catch (Exception e) {
//            log.error("Exception in generating SpringBoot Project {}", e.getMessage());
//        }


    }

}