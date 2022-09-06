package org.codegen;

import org.codegen.ApiCodeGen.loader.Classloader;
import org.codegen.ApiCodeGen.templateHandler.Handlebar;
import org.codegen.JOOQ.PojosGen.EntityClassGen;
import org.codegen.SwaggerCodeGen.GenerateSpringBootProject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.tools.JavaCompiler;
import javax.tools.ToolProvider;
import java.io.File;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.HashSet;
import java.util.Set;

import static org.codegen.ApiCodeGen.Validator.pojoValidator.validatePojoClasses;

public class Main extends ClassLoader {
    private static final Logger log = LoggerFactory.getLogger(Main.class);
    static GenerateSpringBootProject generateSpringBootProject = new GenerateSpringBootProject();


    public static void main(String[] args) {


        log.info("<------ CodeGen FrameWork Started ------>");
        try {
            System.out.println("Start Time" + System.currentTimeMillis());
            EntityClassGen.EntityGenerator("src/main/resources/DummyScript.sql", "C:\\Users\\di.garg1\\Desktop\\POJOS\\entity", "C:\\Users\\di.garg1\\Desktop\\POJOS");
            System.out.println("End Time" + System.currentTimeMillis());
        } catch (Exception e) {
            log.error("Exception in generating POJO classes {}", e.getMessage());
        }

        File[] files = new File("C:\\Users\\di.garg1\\Desktop\\POJOS\\C_3a_5cUsers_5cdi\\garg1_5cDesktop_5cPOJOS_5centity\\tables\\pojos").listFiles();
        Set<Class> classes = new HashSet<>();
        File directoryPath = new File("C:\\Users\\di.garg1\\Desktop\\POJOS\\");
        try {
            if (validatePojoClasses() == true) {
                for (File file : files) {
                    String s = "C_3a_5cUsers_5cdi.garg1_5cDesktop_5cPOJOS_5centity.tables.pojos." + file.getName().replaceAll(".java", "");
                    log.info("Full qualified name" + s);
                    JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
                    int compilationResult = compiler.run(null, null, null, file.getAbsolutePath());
                    if (compilationResult == 0) {
                        log.info("Compilation is successful");
                    } else {
                        log.info("Compilation Failed at " + file.getName());
                        break;
                    }
                    URL url = directoryPath.toURI().toURL();
                    URL[] urls = new URL[]{url};
                    ClassLoader cl = new URLClassLoader(urls);
                    Class cls = cl.loadClass(s);
                    classes.add(cls);
                }
            } else
                System.out.println("Any of your pojoClass is Empty");
        } catch (Exception e) {
            log.error("Exception in ClassLoader Method {}", e.getMessage());
        }

        Classloader.loadClass(classes);
        Classloader.convertIntoAPIJson();
        Handlebar.SwaggerYaml();
        try {
            generateSpringBootProject.generateProject("src/main/resources/SwaggerYaml.yml",
                    "spring",
                    "io.codejournal.maven.swagger2java.api",
                    "io.codejournal.maven.swagger2java.model",
                    "io.codejournal.maven.swagger2java.handler",
                    "src/main/java/org/Autogenerated");
        } catch (Exception e) {
            log.error("Exception in generating SpringBoot Project {}", e.getMessage());
        }


    }

}
