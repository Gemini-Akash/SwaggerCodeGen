package org.codegen.ApiCodeGen.loader;


import org.codegen.Handler.DirectoryHandler;
import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.persistence.Id;
import javax.tools.JavaCompiler;
import javax.tools.ToolProvider;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.*;
import java.util.stream.Collectors;

import static org.codegen.ApiCodeGen.Validator.PojoValidator.validatePojoClasses;


public class Classloader {


    private static final Logger log = LoggerFactory.getLogger(Classloader.class);

    /**
     * convertIntoAPIJson() method to convert into json file for creating multiple json.
     *
     * @param className
     * @param primaryKeyObject
     * @param nonPrimaryKeyObject
     */
    public static void convertIntoAPIJson(String className, JSONArray primaryKeyObject, JSONArray nonPrimaryKeyObject) {
        try {
            JSONObject jsonObject1 = new JSONObject();
            jsonObject1.put("className", className);
            jsonObject1.put("scriptName", DirectoryHandler.getScriptName());
            jsonObject1.put("schemaName", DirectoryHandler.getSchemaName());
            jsonObject1.put("variable", nonPrimaryKeyObject);
            jsonObject1.put("primaryKeys", primaryKeyObject);
            log.info("Required json :{}", jsonObject1);
            try {
                FileWriter file = new FileWriter(DirectoryHandler.generateDirectoryPath() + "/jsonFiles/" + className + ".json");
                file.write(jsonObject1.toJSONString());
                file.close();
            } catch (IOException e) {
                log.error("Exception in writing into JSON file" + e.getMessage());
            }

        } catch (Exception e) {
            log.error("Exception in convertIntoApiJson() : {}", e.getMessage());
        }
    }

    /**
     * loadClass() method is used to load class from fully qualified classname
     *
     * @param classObject
     * @return classNames
     */
    public static List<String> loadClass(Set<Class> classObject) {
        List<String> classNames = new ArrayList<>();
        try {
            for (Class classContent : classObject) {
                String className = classContent.getSimpleName();
                classNames.add(className);
                log.info("Pojo ClassName : {}", className);
                getJsonBody(classContent);
            }
        } catch (Exception e) {
            log.error("Exception in loadClass():{}" + e.getMessage());
        }
        return classNames;
    }

    /**
     * getJsonBody() method is used to get json object.
     *
     * @param classContent
     */
    public static void getJsonBody(Class classContent) {

        JSONArray primaryKeyObject = null;
        JSONArray nonPrimaryKeyObject = null;
        try {
            primaryKeyObject = new JSONArray();
            nonPrimaryKeyObject = new JSONArray();
            JSONObject jsonObject1 = new JSONObject();
            Field[] fields = classContent.getDeclaredFields();

            List<Field> primaryKeyFieldlist = Arrays.stream(fields).filter(field -> field.getAnnotation(Id.class) != null).collect(Collectors.toList());
            List<Field> nonPrimaryKeyFieldlist = Arrays.stream(fields).filter(field -> field.getAnnotation(Id.class) == null).skip(1).collect(Collectors.toList());
            for (Field field : nonPrimaryKeyFieldlist) {
                String fieldName = field.getName();
                String fieldType = field.getType().getSimpleName();
                jsonObject1.put("fieldName", fieldName);
                jsonObject1.put("datatype", fieldType);
                nonPrimaryKeyObject.put(jsonObject1);
            }
            for (Field field : primaryKeyFieldlist) {
                String fieldName = field.getName();
                String fieldType = field.getType().getSimpleName();
                jsonObject1.put("fieldName", fieldName);
                jsonObject1.put("datatype", fieldType);
                primaryKeyObject.put(jsonObject1);
            }
        } catch (Exception e) {
            log.error("Exception in getJsonBody():{}" + e.getMessage());
        }
        DirectoryHandler.createDirectory(DirectoryHandler.generateDirectoryPath() + "/jsonFiles");
        convertIntoAPIJson(classContent.getSimpleName(), primaryKeyObject, nonPrimaryKeyObject);
    }

    /**
     * javaCompileClass() method is used for loading class file into JVM.
     *
     * @param filePath
     */
    public static void javaCompileClass(File filePath) {
        JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
        int compilationResult = compiler.run(null, null, null, filePath.getAbsolutePath());
        if (compilationResult == 0) {
            log.info("Compilation is successful");
        } else {
            log.info("Compilation Failed at " + filePath.getName());
        }
    }

    /**
     * fullyQualifiedClassName() method is used to get fullyQualifiedClassName.
     *
     * @param filePath
     */

    public static Class fullyQualifiedClassName(File filePath) {
        File directoryPath = new File(DirectoryHandler.outerDirectoryPath + "/" + DirectoryHandler.getScriptName() + "SpringBootApp/src/main/java");
        Class cls = null;
        try {
            String s = "com.gemini." + DirectoryHandler.getScriptName() + ".entity." + DirectoryHandler.getSchemaName() + ".tables.pojos." + filePath.getName().replaceAll(".java", "");
            URL url = directoryPath.toURI().toURL();
            URL[] urls = new URL[]{url};
            java.lang.ClassLoader cl = new URLClassLoader(urls);
            cls = cl.loadClass(s);
        } catch (Exception e) {
            log.error("Exception in fullyQualifiedClassName {}", e.getMessage());
        }
        log.info("fullyQualifiedClassName----->{}", cls);
        return cls;
    }

    /**
     * readClass() method is used to read all pojo classes.
     *
     * @return set of classes
     */
    public static Set<Class> readClass() {
        File[] files = new File(DirectoryHandler.generateDirectoryPath() + "/entity/" + DirectoryHandler.getSchemaName() + "/tables/pojos").listFiles();
        Set<Class> classes = new HashSet<>();
        try {
            if (validatePojoClasses(files)) {
                for (File file : files) {
                    javaCompileClass(file);
                    classes.add(fullyQualifiedClassName(file));
                }
            } else
                log.info("Any of your pojoClass is Empty");
        } catch (Exception e) {
            log.error("Exception in Classloader Method {}", e.getMessage());
        }
        return classes;
    }


}


