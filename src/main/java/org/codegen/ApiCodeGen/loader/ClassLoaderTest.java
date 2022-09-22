package org.codegen.ApiCodeGen.loader;


import org.json.JSONArray;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
//import org.reflections.scanners.Scanners;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import javax.persistence.Id;
import javax.tools.JavaCompiler;
import javax.tools.ToolProvider;
import java.io.*;
import java.lang.reflect.Field;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.*;
//import java.util.logging.Logger;
import java.util.stream.Collectors;

import static org.codegen.ApiCodeGen.Validator.pojoValidator.validatePojoClasses;


public class ClassLoaderTest {


    private static final Logger log = LoggerFactory.getLogger(ClassLoaderTest.class);

    /**
     * service method to convert into json file for creating swaggerApi yaml file
     *
     * @param
     * @return
     */
    public static void convertIntoAPIJson() {







        try {
            JSONObject jsonObject = (JSONObject) new JSONParser().parse(new FileReader("src/main/java/org/codegen/ApiCodeGen/jsonFiles/Loader.json"));
            System.out.println("to convert json file is found"+jsonObject);

            for (Object classname : jsonObject.keySet()) {
                JSONObject json1 = new JSONObject();
                JSONArray jsonArray1 = new JSONArray();
                JSONObject json2 = new JSONObject();
                JSONArray jsonArray2 = new JSONArray();
                ArrayList<Object> fields = new ArrayList<>();
                ArrayList<Object> fieldTypes = new ArrayList<>();


                JSONObject jsonBody = (JSONObject) new JSONParser().parse(jsonObject.get(classname).toString());


                fieldTypes.addAll(jsonBody.values());


                fields.addAll(jsonBody.keySet());



                json2.put("className", classname);

                int count = 0;

                while (count != fields.size()) {
                    JSONObject json3 = new JSONObject();

                    json3.put("fieldName", fields.get(count));
                    json3.put("datatype", fieldTypes.get(count));


                    json2.put("variable", jsonArray2.put(json3));

                    count++;

                }

                json1.put("classes", jsonArray1.put(json2));

                System.out.println("Required json"+json1);

                try {
                    FileWriter file = new FileWriter("src/main/java/org/codegen/ApiCodeGen/jsonFiles/"+classname+".json");
                    file.write(json1.toJSONString());
                    file.close();
                } catch (IOException e) {
                    log.error("Exception in writing into JSON file" + e.getMessage());
                }

            }

        } catch (Exception e) {
            log.error("Exception in convertIntoApiJson() : {}", e.getMessage());
        }

    }

    /**
     * service method is used to load class from fully qualified classname
     *
     * @param classObject
     */

    public static void loadClass(Set<Class> classObject) {

        JSONObject jsonBody = null;
        try {
            jsonBody = new JSONObject();

            for (Class classContent : classObject) {
                String classname = classContent.getSimpleName();
                System.out.println(classname);
                JSONObject object = getJsonBody(classContent);
                jsonBody.put(classname, object);
            }

            System.out.println("load class json body"+jsonBody);
        } catch (Exception e) {
            log.error("Exception in loadClass():{}" + e.getMessage());
        }

        try {
            FileWriter file = new FileWriter("src/main/java/org/codegen/ApiCodeGen/jsonFiles/Loader.json");
            file.write(jsonBody.toJSONString());
            file.close();
        } catch (IOException e) {
            log.error("Exception in writing into JSON file" + e.getMessage());
        }
    }

    /**
     * service method to get json object
     *
     * @param classContent
     * @return
     */
    public static JSONObject getJsonBody(Class classContent) {

        JSONObject object = null;
        try {
            object = new JSONObject();
            Field[] fields = classContent.getDeclaredFields();

            List<Field> fieldlist = Arrays.stream(fields).filter(field -> field.getAnnotation(Id.class) != null).collect(Collectors.toList());

            for (Field field : Arrays.stream(fields).skip(1).collect(Collectors.toList())) {
                if (!fieldlist.contains(field)) {
                    fieldlist.add(field);
                }
            }
            for (Field field : fieldlist) {
                String fieldName = field.getName();
                String fieldType = field.getType().getSimpleName();
                object.put(fieldName, fieldType);
            }
        } catch (Exception e) {

            log.error("Exception in getJsonBody():{}" + e.getMessage());
        }
        return object;
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
        File directoryPath = new File("C:\\Users\\di.garg1\\Desktop\\POJOS\\");
        Class cls = null;
        try {
            String s = "entity.tables.pojos." + filePath.getName().replaceAll(".java", "");
            URL url = directoryPath.toURI().toURL();
            URL[] urls = new URL[]{url};
            ClassLoader cl = new URLClassLoader(urls);
            cls = cl.loadClass(s);
        } catch (Exception e) {
            log.error("Exception in fullyQualifiedClassName {}", e.getMessage());
        }
        return cls;
    }

    public static Set<Class> readClass() {
        File[] files = new File("C:\\Users\\di.garg1\\Desktop\\POJOS\\entity\\tables\\pojos").listFiles();
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


