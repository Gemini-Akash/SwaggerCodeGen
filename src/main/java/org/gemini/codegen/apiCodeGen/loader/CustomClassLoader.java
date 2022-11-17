package org.gemini.codegen.apiCodeGen.loader;

import org.gemini.codegen.handler.DirectoryHandler;
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

import static org.gemini.codegen.apiCodeGen.validator.PojoValidator.validatePojoClasses;


public class CustomClassLoader {


    private static final Logger LOG = LoggerFactory.getLogger(CustomClassLoader.class);


    /**
     * createAPIJson() method to convert into json file for creating multiple json.
     *
     * @param className
     * @param primaryKeysObject
     * @param variableFieldsObject
     * @param filePath
     */
    public static void createAPIJson(final String className, final JSONArray primaryKeysObject, final JSONArray variableFieldsObject, final String filePath) {
        FileWriter fileWriter = null;
        StringBuilder path = new StringBuilder();
        try {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("className", className);
            jsonObject.put("scriptName", DirectoryHandler.getScriptName());
            jsonObject.put("schemaName", DirectoryHandler.getSchemaName());
            jsonObject.put("variable", variableFieldsObject);
            jsonObject.put("primaryKeys", primaryKeysObject);
            LOG.info("Required json: {}", jsonObject);
            path.setLength(0);
            path.append(filePath);
            path.append("/jsonFiles/");
            path.append(className);
            path.append(".json");
            fileWriter = new FileWriter(path.toString());
            fileWriter.write(jsonObject.toJSONString());
        } catch (Exception e) {
            LOG.error("Exception in  writing JSON file / createApiJson(): {}", e.getMessage());
        } finally {
            if (fileWriter != null) {
                try {
                    fileWriter.close();
                } catch (IOException e) {
                    LOG.error("Exception in closing the fileWriter of createApiJson(): {}", e.getMessage());
                }
            }
        }
    }

    /**
     * loadClass() method is used to load class from fully qualified classname
     *
     * @param classObject
     * @param filePath
     * @return classNames
     */
    public static List<String> loadClass(final Set<Class> classObject, final String filePath) {
        StringBuilder path = new StringBuilder();
        List<String> classNames = new ArrayList<>();
        path.setLength(0);
        path.append(DirectoryHandler.generateDirectoryPath());
        path.append("/jsonFiles");
        DirectoryHandler.createDirectory(path.toString());
        try {
            for (Class classContent : classObject) {
                String className = classContent.getSimpleName();
                classNames.add(className);
                LOG.info("Pojo ClassName : {}", className);
                getJsonBody(classContent, filePath);
            }
        } catch (Exception e) {
            LOG.error("Exception in loadClass(): {}", e.getMessage());
        }
        return classNames;
    }

    /**
     * getJsonBody() method is used to get json object.
     *
     * @param classContent
     * @param filePath
     */
    public static void getJsonBody(final Class classContent, final String filePath) {

        JSONArray primaryKeysObject = null;
        JSONArray variableFieldsObject = null;
        try {
            primaryKeysObject = new JSONArray();
            variableFieldsObject = new JSONArray();
            JSONObject jsonObject = new JSONObject();
            Field[] fields = classContent.getDeclaredFields();

            List<Field> primaryKeysList = Arrays.stream(fields).filter(field -> field.getAnnotation(Id.class) != null).collect(Collectors.toList());
            List<Field> variableFieldsList = Arrays.stream(fields).filter(field -> field.getAnnotation(Id.class) == null).skip(1).collect(Collectors.toList());
            for (Field field : variableFieldsList) {
                String fieldName = field.getName();
                String fieldType = field.getType().getSimpleName();
                jsonObject.put("fieldName", fieldName);
                jsonObject.put("datatype", fieldType);
                variableFieldsObject.put(jsonObject);
            }
            for (Field field : primaryKeysList) {
                String fieldName = field.getName();
                String fieldType = field.getType().getSimpleName();
                jsonObject.put("fieldName", fieldName);
                jsonObject.put("datatype", fieldType);
                primaryKeysObject.put(jsonObject);
            }
        } catch (Exception e) {
            LOG.error("Exception in getJsonBody(): {}", e.getMessage());
        }
        createAPIJson(classContent.getSimpleName(), primaryKeysObject, variableFieldsObject, filePath);
    }

    /**
     * javaCompileClass() method is used for loading class file into JVM.
     *
     * @param filePath
     */
    public static void compileJavaClasses(final File filePath) {
        int compilationResult = 0;
        try {
            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            compilationResult = compiler.run(null, null, null, filePath.getAbsolutePath());
        } catch (Exception e) {
            LOG.info("Exception in compileJavaClasses(): {}", e.getMessage());
        }
        if (compilationResult == 0) {
            LOG.info("Compilation is successful");
        } else {
            LOG.info("Compilation Failed at: {} ", filePath.getName());
        }
    }

    /**
     * getFullyQualifiedClassName() method is used to get fullyQualifiedClassName.
     *
     * @param filePath
     */

    public static Class getFullyQualifiedClassName(final File filePath) {
        StringBuilder path = new StringBuilder();
        path.setLength(0);
        path.append(DirectoryHandler.outerDirectoryPath);
        path.append("/");
        path.append(DirectoryHandler.getScriptName());
        path.append("SpringBootApp/src/main/java");
        File directoryPath = new File(path.toString());
        Class cls = null;
        URLClassLoader urlClassLoader=null;
        try {
            path.setLength(0);
            path.append("com.gemini.");
            path.append(DirectoryHandler.getScriptName());
            path.append(".entity.");
            path.append(DirectoryHandler.getSchemaName());
            path.append(".tables.pojos.");
            path.append(filePath.getName().replaceAll(".java", ""));
            URL url = directoryPath.toURI().toURL();
            URL[] urls = new URL[]{url};
            urlClassLoader= new URLClassLoader(urls);
            ClassLoader cl = urlClassLoader;
            cls = cl.loadClass(path.toString());
        } catch (Exception e) {
            LOG.error("Exception in getFullyQualifiedClassName: {}", e.getMessage());
        }finally {
            if (urlClassLoader != null) {
                try {
                    urlClassLoader.close();
                } catch (IOException e) {
                    LOG.error("Exception in closing the urlClassLoader of getFullyQualifiedClassName(): {}", e.getMessage());
                }
            }
        }

        LOG.info("getFullyQualifiedClassName----->{}", cls);
        return cls;
    }

    /**
     * getFullyQualifiedClasses() method is used to read all pojo classes.
     *
     * @param filePath
     * @return set of classes
     */
    public static Set<Class> getFullyQualifiedClasses(final File filePath) {
        File[] files = filePath.listFiles();
        Set<Class> classes = new HashSet<>();
        try {
            if (validatePojoClasses(files)) {
                for (File file : files) {
                    compileJavaClasses(file);
                    classes.add(getFullyQualifiedClassName(file));
                }
            } else {
                LOG.info("Any of your pojoClass is Empty");
            }
        } catch (Exception e) {
            LOG.error("Exception in getFullyQualifiedClasses(): {}", e.getMessage());
        }
        return classes;
    }


}


