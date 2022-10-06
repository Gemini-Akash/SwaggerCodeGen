package org.codegen;

import org.codegen.ApiCodeGen.loader.ClassLoaderTest;
import org.codegen.Handler.directoryHandler;
import org.codegen.Handler.templateHandler;
import org.codegen.JOOQ.PojosGen.EntityClassGen;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import static java.nio.file.Paths.get;

public class Main extends ClassLoader {
    private static final Logger log = LoggerFactory.getLogger(Main.class);


    public static void main(String[] args) throws IOException {

        directoryHandler.directoryCreation(directoryHandler.generatedDirectoryPath());
        log.info("<------ CodeGen FrameWork Started ------>");
        try {
            EntityClassGen.EntityGenerator(directoryHandler.outerScriptDirectoryPath, "com.gemini."+directoryHandler.getScriptName()+".entity",directoryHandler.generatedDirectoryPath());
        } catch (Exception e) {
            log.error("Exception in generating POJO classes {}", e.getMessage());
        }

        directoryHandler.renameDirectory(directoryHandler.generatedDirectoryPath()+"\\com\\gemini\\"+directoryHandler.getScriptName()+"\\entity");

        List<String> classNames= ClassLoaderTest.loadClass(ClassLoaderTest.readClass());
        System.out.println(classNames);
        ClassLoaderTest.convertIntoAPIJson();
        templateHandler.generateSpringBootProject(classNames);

        directoryHandler.deleteDirectory(directoryHandler.generatedDirectoryPath()+"\\com");
        directoryHandler.deleteDirectory(directoryHandler.generatedDirectoryPath()+"\\jsonFiles");
        directoryHandler.deleteFiles(classNames,directoryHandler.generatedDirectoryPath()+"\\entity\\tables\\pojos");


//        Handlebar.SwaggerYaml();
//        try {
//           GenerateSpringBootProject.generateProject("src/main/resources/SwaggerYaml.yml", "spring", "io.codejournal.maven.swagger2java.api", "io.codejournal.maven.swagger2java.model", "io.codejournal.maven.swagger2java.handler", "src/main/java/org/Autogenerated");
//        } catch (Exception e) {
//            log.error("Exception in generating SpringBoot Project {}", e.getMessage());
//        }




    }

}
