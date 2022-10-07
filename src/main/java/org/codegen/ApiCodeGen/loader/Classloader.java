//package org.codegen.ApiCodeGen.loader;
//
//
//import org.json.JSONArray;
//import org.json.simple.JSONObject;
//import org.json.simple.parser.JSONParser;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//import javax.persistence.Id;
//import javax.tools.JavaCompiler;
//import javax.tools.ToolProvider;
//import java.io.File;
//import java.io.FileReader;
//import java.io.FileWriter;
//import java.io.IOException;
//import java.lang.reflect.Field;
//import java.net.URL;
//import java.net.URLClassLoader;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.util.*;
//import java.util.stream.Collectors;
//
//import static org.codegen.ApiCodeGen.Validator.pojoValidator.validatePojoClasses;
//
//
//public class Classloader {
//
//
//    private static final Logger log = LoggerFactory.getLogger(Classloader.class);
//
//    /**
//     * service method to convert into json file for creating swaggerApi yaml file
//     *
//     * @param
//     * @return
//     */
//    public static void convertIntoAPIJson() {
//
//        JSONObject json1 = new JSONObject();
//        JSONArray jsonArray1 = new JSONArray();
//
//        HashMap<String, String> formatMap = new HashMap<>();
//        HashMap<String, String> dataTypeMap = new HashMap<>();
//
//        formatMap.put("String", "int64");
//        formatMap.put("LocalDateTime", "int64");
//        formatMap.put("Double", "int64");
//        formatMap.put("Integer", "int64");
//        formatMap.put("Boolean", "int64");
//        formatMap.put("Short", "int32");
//        formatMap.put("Byte", "int64");
//        formatMap.put("Long", "int64");
//        formatMap.put("BigDecimal", "int64");
//        formatMap.put("Float", "int32");
//        formatMap.put("LocalDate", "int64");
//        formatMap.put("LocalTime", "int32");
//        formatMap.put("byte[]", "int64");
//
//        dataTypeMap.put("String", "string");
//        dataTypeMap.put("LocalDateTime", "string");
//        dataTypeMap.put("Double", "number");
//        dataTypeMap.put("Integer", "integer");
//        dataTypeMap.put("Boolean", "boolean");
//        dataTypeMap.put("Short", "integer");
//        dataTypeMap.put("Byte", "string");
//        dataTypeMap.put("Long", "integer");
//        dataTypeMap.put("BigDecimal", "number");
//        dataTypeMap.put("Float", "number");
//        dataTypeMap.put("LocalDate", "string");
//        dataTypeMap.put("LocalTime", "string");
//        dataTypeMap.put("byte[]", "array");
//
//
//        try {
//            JSONObject jsonObject = (JSONObject) new JSONParser().parse(new FileReader("src/main/java/org/codegen/ApiCodeGen/jsonFiles/Loader.json"));
//
//            for (Object classname : jsonObject.keySet()) {
//                JSONObject json2 = new JSONObject();
//                JSONArray jsonArray2 = new JSONArray();
//                ArrayList<Object> fields = new ArrayList<>();
//                ArrayList<Object> fieldTypes = new ArrayList<>();
//                ArrayList<Object> formats = new ArrayList<>();
//
//                JSONObject jsonBody = (JSONObject) new JSONParser().parse(jsonObject.get(classname).toString());
//
//                for (Object fieldType : jsonBody.values()) {
//                    formats.add(formatMap.get(fieldType));
//                    fieldTypes.add(dataTypeMap.get(fieldType));
//                }
//
//
//                fields.addAll(jsonBody.keySet());
//
//
//                json2.put("className", classname);
//
//                int count = 0;
//
//                while (count != fields.size()) {
//                    JSONObject json3 = new JSONObject();
//
//                    json3.put("fieldName", fields.get(count));
//                    json3.put("datatype", fieldTypes.get(count));
//                    json3.put("format", formats.get(count));
//
//                    json2.put("variable", jsonArray2.put(json3));
//
//                    count++;
//
//                }
//
//                json1.put("classes", jsonArray1.put(json2));
//
//            }
//        } catch (Exception e) {
//            log.error("Exception in convertIntoApiJson() : {}", e.getMessage());
//        }
//
//        try {
//            FileWriter fileWriter = new FileWriter("src/main/java/org/codegen/ApiCodeGen/jsonFiles/SwaggerJson.json");
//            fileWriter.write(json1.toJSONString());
//            fileWriter.close();
//        } catch (IOException e) {
//            log.error("Exception in writing into JSON file" + e.getMessage());
//        }
//        System.out.println("JSON file created for SwaggerAPI Yaml File: " + json1);
//    }
//
//    /**
//     * service method is used to load class from fully qualified classname
//     *
//     * @param classObject
//     */
//
//    public static void loadClass(Set<Class> classObject) {
//
//        JSONObject jsonBody = null;
//        try {
//            jsonBody = new JSONObject();
//
//            for (Class classContent : classObject) {
//                String classname = classContent.getSimpleName();
//                System.out.println(classname);
//                JSONObject object = getJsonBody(classContent);
//                jsonBody.put(classname, object);
//            }
//
//            System.out.println(jsonBody);
//        } catch (Exception e) {
//            log.error("Exception in loadClass():{}" + e.getMessage());
//        }
//
//        try {
//            FileWriter fileWriter = new FileWriter("src/main/java/org/codegen/ApiCodeGen/jsonFiles/Loader.json");
//            fileWriter.write(jsonBody.toJSONString());
//            fileWriter.close();
//        } catch (IOException e) {
//            log.error("Exception in writing into JSON file" + e.getMessage());
//        }
//    }
//
//    /**
//     * service method to get json object
//     *
//     * @param classContent
//     * @return
//     */
//    public static JSONObject getJsonBody(Class classContent) {
//
//        JSONObject object = null;
//        try {
//            object = new JSONObject();
//            Field[] fields = classContent.getDeclaredFields();
//            List<Field> fieldlist = Arrays.stream(fields).filter(field -> field.getAnnotation(Id.class) != null).collect(Collectors.toList());
//            for (Field field : Arrays.stream(fields).skip(1).collect(Collectors.toList())) {
//                if (!fieldlist.contains(field)) {
//                    fieldlist.add(field);
//                }
//            }
//            for (Field field : fieldlist) {
//                String fieldName = field.getName();
//                String fieldType = field.getType().getSimpleName();
//                object.put(fieldName, fieldType);
//            }
//        } catch (Exception e) {
//
//            log.error("Exception in getJsonBody():{}" + e.getMessage());
//        }
//        return object;
//    }
//
//    public static void javaCompileClass(File filePath) {
//        JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
//        int compilationResult = compiler.run(null, null, null, filePath.getAbsolutePath());
//        if (compilationResult == 0) {
//            log.info("Compilation is successful");
//        } else {
//            log.info("Compilation Failed at " + filePath.getName());
//        }
//    }
//
//    public static Class fullyQualifiedClassName(File filePath) {
//        File directoryPath = new File("C:\\Users\\di.garg1\\Desktop\\POJOS\\");
//        Class cls = null;
//        try {
//            String s = "entity.tables.pojos." + filePath.getName().replaceAll(".java", "");
//            URL url = directoryPath.toURI().toURL();
//            URL[] urls = new URL[]{url};
//            ClassLoader cl = new URLClassLoader(urls);
//            cls = cl.loadClass(s);
//        } catch (Exception e) {
//            log.error("Exception in fullyQualifiedClassName {}", e.getMessage());
//        }
//        return cls;
//    }
//
//    public static Set<Class> readClass() {
//        File[] files = new File("C:\\Users\\di.garg1\\Desktop\\POJOS\\entity\\tables\\pojos").listFiles();
//        Set<Class> classes = new HashSet<>();
//        try {
//            if (validatePojoClasses() == true) {
//                for (File file : files) {
//                    javaCompileClass(file);
//                    classes.add(fullyQualifiedClassName(file));
//                }
//            } else
//                log.info("Any of your pojoClass is Empty");
//        } catch (Exception e) {
//            log.error("Exception in ClassLoader Method {}", e.getMessage());
//        }
//        return classes;
//    }
//}
//
