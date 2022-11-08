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


public class ClassLoaderTest {


    private static final Logger log = LoggerFactory.getLogger(ClassLoaderTest.class);

    /**
     * service method to convert into json file for creating swaggerApi yaml file
     *
     * @param
     * @return
     */
    public static void convertIntoAPIJson(String className, JSONArray primaryKeyObject,JSONArray nonPrimaryKeyObject ) {


        try {

//            JSONObject jsonObject = (JSONObject) new JSONParser().parse(new FileReader(DirectoryHandler.generateDirectoryPath()+"\\jsonFiles\\Loader.json"));
//            for (Object classname : jsonObject.keySet()) {
//                JSONObject json1 = new JSONObject();
//                JSONArray jsonArray1 = new JSONArray();
//                JSONObject json2 = new JSONObject();
//                JSONArray jsonArray2 = new JSONArray();
//                ArrayList<Object> fields = new ArrayList<>();
//                ArrayList<Object> fieldTypes = new ArrayList<>();


//                JSONObject jsonBody = (JSONObject) new JSONParser().parse(jsonObject.get(classname).toString());
//
//                fieldTypes.addAll(jsonBody.values());
//
//
//                fields.addAll(jsonBody.keySet());

                JSONObject jsonObject1=new JSONObject();
                jsonObject1.put("className", className);
                jsonObject1.put("scriptName", DirectoryHandler.getScriptName());
                jsonObject1.put("schemaName",DirectoryHandler.getSchemaName());
                jsonObject1.put("variable",nonPrimaryKeyObject);
                jsonObject1.put("primaryKeys",primaryKeyObject);



//                int count = 0;
//
//                while (count != fields.size()) {
//                    JSONObject json3 = new JSONObject();
//                    json3.put("fieldName", fields.get(count));
//                    json3.put("datatype", fieldTypes.get(count));
//                    json2.put("variable", jsonArray2.put(json3));
//                    count++;
//                }
//                json1.put("classes", jsonArray1.put(json2));
                log.info("Required json :{}", jsonObject1);
                try {
                    FileWriter file = new FileWriter(DirectoryHandler.generateDirectoryPath()+"\\jsonFiles\\"+ className + ".json");
                    file.write(jsonObject1.toJSONString());
                    file.close();
                } catch (IOException e) {
                    log.error("Exception in writing into JSON file" + e.getMessage());
                }
//            }

        } catch (Exception e) {
            log.error("Exception in convertIntoApiJson() : {}", e.getMessage());
        }
    }

    /**
     * service method is used to load class from fully qualified classname
     *
     * @param classObject
     */

    public static List<String> loadClass(Set<Class> classObject) {
//        JSONObject jsonBody = null;
        List<String> classNames = new ArrayList<>();
        try {
//            jsonBody = new JSONObject();
            for (Class classContent : classObject) {
                String className = classContent.getSimpleName();
                classNames.add(className);
                log.info("Pojo ClassName : {}", className);
                getJsonBody(classContent);
//                JSONObject object = getJsonBody(classContent);
//                jsonBody.put(className, object);
            }
//            log.info("load class json body : {}", jsonBody);
        } catch (Exception e) {
            log.error("Exception in loadClass():{}" + e.getMessage());
        }

//        try {
//            DirectoryHandler.createDirectory(DirectoryHandler.generateDirectoryPath()+"\\jsonFiles");
//            FileWriter file = new FileWriter(DirectoryHandler.generateDirectoryPath()+"\\jsonFiles\\Loader.json");
//            file.write(jsonBody.toJSONString());
//            file.close();
//        } catch (IOException e) {
//            log.error("Exception in writing into JSON file" + e.getMessage());
//        }
        return classNames;
    }

    /**
     * service method to get json object
     *
     * @param classContent
     * @return
     */
    public static void getJsonBody(Class classContent) {

        JSONArray primaryKeyObject = null;
        JSONArray nonPrimaryKeyObject = null;
        try {
            primaryKeyObject = new JSONArray();
            nonPrimaryKeyObject = new JSONArray();
            JSONObject jsonObject1=new JSONObject();
            Field[] fields = classContent.getDeclaredFields();

            List<Field> primaryKeyFieldlist = Arrays.stream(fields).filter(field -> field.getAnnotation(Id.class) != null).collect(Collectors.toList());
            List<Field> nonPrimaryKeyFieldlist = Arrays.stream(fields).filter(field -> field.getAnnotation(Id.class) == null).skip(1).collect(Collectors.toList());
            for (Field field : nonPrimaryKeyFieldlist) {
                String fieldName = field.getName();
                String fieldType = field.getType().getSimpleName();
                jsonObject1.put("fieldName",fieldName);
                jsonObject1.put("datatype",fieldType);
                nonPrimaryKeyObject.put(jsonObject1);
            }
            for (Field field : primaryKeyFieldlist) {
                String fieldName = field.getName();
                String fieldType = field.getType().getSimpleName();
                jsonObject1.put("fieldName",fieldName);
                jsonObject1.put("datatype",fieldType);
                primaryKeyObject.put(jsonObject1);
            }


//            for (Field field : Arrays.stream(fields).skip(1).collect(Collectors.toList())) {
//                if (!fieldlist.contains(field)) {
//                    fieldlist.add(field);
//                }
//            }
        } catch (Exception e) {
            log.error("Exception in getJsonBody():{}" + e.getMessage());
        }
        DirectoryHandler.createDirectory(DirectoryHandler.generateDirectoryPath()+"\\jsonFiles");
        convertIntoAPIJson(classContent.getSimpleName(),primaryKeyObject,nonPrimaryKeyObject);
    }

    public static void javaCompileClass(File filePath) {
        JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
        int compilationResult = compiler.run(null, null, null, filePath.getAbsolutePath());
        if (compilationResult == 0) {
            log.info("Compilation is successful");
        } else {
            log.info("Compilation Failed at " + filePath.getName());
        }
    }

    public static Class fullyQualifiedClassName(File filePath) {
        File directoryPath = new File(DirectoryHandler.outerDirectoryPath+"\\"+DirectoryHandler.getScriptName()+"SpringBootApp\\src\\main\\java");
        Class cls = null;
        try {
            String s =  "com.gemini."+ DirectoryHandler.getScriptName()+".entity."+DirectoryHandler.getSchemaName()+".tables.pojos." + filePath.getName().replaceAll(".java", "");
            URL url = directoryPath.toURI().toURL();
            URL[] urls = new URL[]{url};
            ClassLoader cl = new URLClassLoader(urls);
            cls = cl.loadClass(s);
        } catch (Exception e) {
            log.error("Exception in fullyQualifiedClassName {}", e.getMessage());
        }
        log.info("fullyQualifiedClassName----->{}",cls);
        return cls;
    }

    public static Set<Class> readClass() {
        File[] files = new File(DirectoryHandler.generateDirectoryPath()+"\\entity\\"+DirectoryHandler.getSchemaName()+"\\tables\\pojos").listFiles();
        Set<Class> classes = new HashSet<>();
        try {
            if (validatePojoClasses() == true) {
                for (File file : files) {
                    javaCompileClass(file);
                    classes.add(fullyQualifiedClassName(file));
                }
            } else
                log.info("Any of your pojoClass is Empty");
        } catch (Exception e) {
            log.error("Exception in ClassLoader Method {}", e.getMessage());
        }
        return classes;
    }


}


