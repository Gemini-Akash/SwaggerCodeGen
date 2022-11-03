package org.codegen;

//import org.apache.log4j.BasicConfigurator;
import org.codegen.ApiCodeGen.loader.ClassLoaderTest;
import org.codegen.Handler.DirectoryHandler;
import org.codegen.Handler.TemplateHandler;
import org.codegen.JOOQ.PojosGen.EntityClassGen;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.persistence.UniqueConstraint;

import java.io.IOException;
import java.util.List;

import static java.nio.file.Paths.get;

public class Main {

    private static final Logger log = LoggerFactory.getLogger(Main.class);


    public static void main(String[] args) throws IOException {


        DirectoryHandler.createDirectory(DirectoryHandler.generateDirectoryPath());
        log.info("<------ CodeGen FrameWork Started ------>");
        try {
            EntityClassGen.EntityGenerator(DirectoryHandler.outerScriptDirectoryPath, "com.gemini."+ DirectoryHandler.getScriptName()+".entity", DirectoryHandler.generateDirectoryPath());
        } catch (Exception e) {
            log.error("Exception in generating POJO classes {}", e.getMessage());
        }

        DirectoryHandler.renameDirectory(DirectoryHandler.generateDirectoryPath()+"\\com\\gemini\\"+ DirectoryHandler.getScriptName()+"\\entity");

        List<String> classNames= ClassLoaderTest.loadClass(ClassLoaderTest.readClass());
        System.out.println(classNames);
//        ClassLoaderTest.convertIntoAPIJson();
        TemplateHandler.generateSpringBootProject(classNames);

        DirectoryHandler.deleteDirectory(DirectoryHandler.generateDirectoryPath()+"\\com");
        DirectoryHandler.deleteDirectory(DirectoryHandler.generateDirectoryPath()+"\\jsonFiles");
        DirectoryHandler.deleteFiles(classNames, DirectoryHandler.generateDirectoryPath()+"\\entity\\"+DirectoryHandler.getSchemaName()+"\\tables\\pojos");


//        Handlebar.SwaggerYaml();
//        try {
//           GenerateSpringBootProject.generateProject("src/main/resources/SwaggerYaml.yml", "spring", "io.codejournal.maven.swagger2java.api", "io.codejournal.maven.swagger2java.model", "io.codejournal.maven.swagger2java.handler", "src/main/java/org/Autogenerated");
//        } catch (Exception e) {
//            log.error("Exception in generating SpringBoot Project {}", e.getMessage());
//        }




    }

}
