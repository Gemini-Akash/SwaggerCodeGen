package org.gemini.codegen;

import org.gemini.codegen.ApiCodeGen.Validator.JsonValidator;
import org.gemini.codegen.ApiCodeGen.Loader.CustomClassLoader;
import org.gemini.codegen.Handler.DirectoryHandler;
import org.gemini.codegen.Handler.TemplateHandler;

import org.gemini.codegen.JOOQ.PojosGen.EntityClassGenerator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.List;

public class CodeGeneratorApp {

    private static final Logger LOG = LoggerFactory.getLogger(CodeGeneratorApp.class);



    public static void main(String[] args) {


        DirectoryHandler.createDirectory(DirectoryHandler.generateDirectoryPath());
        LOG.info("<------ CodeGen FrameWork Started ------>");
        try {
            EntityClassGenerator.EntityGenerator(DirectoryHandler.outerScriptDirectoryPath, "com.gemini."+ DirectoryHandler.getScriptName()+".entity", DirectoryHandler.generateDirectoryPath());
        } catch (Exception e) {
            LOG.error("Exception in generating POJO classes {}", e.getMessage());
        }

        DirectoryHandler.renameDirectory(new File(DirectoryHandler.generateDirectoryPath() + "/com/gemini/" + DirectoryHandler.getScriptName() + "/entity"), new File(DirectoryHandler.generateDirectoryPath() + "/entity"));

        List<String> classNames= CustomClassLoader.loadClass(CustomClassLoader.getFullyQualifiedClasses(new File(DirectoryHandler.generateDirectoryPath() + "/entity/" + DirectoryHandler.getSchemaName() + "/tables/pojos/")),DirectoryHandler.generateDirectoryPath());
        LOG.info(" ClassNames------>{}",classNames);
        JsonValidator.validateJsonFiles(classNames);
        TemplateHandler.generateSpringBootProject(classNames);

        DirectoryHandler.deleteDirectory(DirectoryHandler.generateDirectoryPath()+"/com");
        DirectoryHandler.deleteDirectory(DirectoryHandler.generateDirectoryPath()+"/jsonFiles");
        DirectoryHandler.deleteFiles(classNames, DirectoryHandler.generateDirectoryPath()+"/entity/"+DirectoryHandler.getSchemaName()+"/tables/pojos");
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