package Loader;

import org.gemini.codegen.apicodegen.loader.CustomClassLoader;
import org.junit.After;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;

public class CustomClassLoaderTest {
    CustomClassLoader customClassLoader=new CustomClassLoader();

    private static final Logger log = LoggerFactory.getLogger(CustomClassLoaderTest.class);

//    @Test
//    public void testCreateApiJson()  {
//        JSONObject jsonObject=new JSONObject();
//        jsonObject.put("fieldName", "Id");
//        jsonObject.put("datatype", "String");
//        JSONArray primaryKeyObject= new JSONArray();
//        primaryKeyObject.put(jsonObject);
//
//        JSONArray variableKeyObject= new JSONArray();
//        primaryKeyObject.put(jsonObject);
//
//        CustomClassLoader.createAPIJson("Author",primaryKeyObject,variableKeyObject,"src/test/resources/jsonFiles");
//        File file = new File("src/test/resources/jsonFiles/Author.json");
//        Assertions.assertTrue(file.exists());
//    }

//    @Test
//    public void testLoadClass() {
//        try {
//            EntityClassGenerator.EntityGenerator("src/test/resources/CustomClassLoader/testScript.sql","entity","src/test/resources/CustomClassLoader/");
//        } catch (Exception e) {
//            throw new RuntimeException("Exception in testLoadClass() :{}",e);
//        }
//        List<String> expectedClassNames = Arrays.asList("Author","Book");
//
//        List<String> actualClassNames = CustomClassLoader.loadClass(CustomClassLoader.getFullyQualifiedClasses(new File("src/test/resources/entity/" + DirectoryHandler.getSchemaName() + "/tables/pojos/")),"src/test/resources/entity/" + DirectoryHandler.getSchemaName() + "/tables/pojos/");
//
//        Assertions.assertEquals(expectedClassNames,actualClassNames,"ClassNames not Similar");
//    }

    //    @Test
//    public void testGetJsonBody(){
//
//    }
    @Test
    public void testForJavaCompileClass() {
        customClassLoader.compileJavaClasses(new File("src/test/resources/CustomClassLoader/ClassFiles/Dummy.java"));
        File file = new File("src/test/resources/CustomClassLoader/ClassFiles/Dummy.class");
        Assertions.assertTrue(file.exists(), "File is not compiled by compiler");
    }

//    @Test
//    public void testGetFullyQualifiedClassName(){
//
//        String actual = "entity.tables.pojos.Author";
//
////        Class cls = CustomClassLoader
////       .fullyQualifiedClassName(new File("C:/Users/ad.shrivastava/Desktop/POJOS/entity/tables/pojos/Author.java"));
//        Class cls = CustomClassLoader.getFullyQualifiedClassName(new File(DirectoryHandler.generateDirectoryPath()+ "Handler/DemoClassFiles/tables/pojos/Author.java"));
//        Assertions.assertEquals(cls.getName(),actual,"wrong");
//    }

    //    @Test
//    public void testGetFullyQualifiedClasses(){
//        try {
//            EntityClassGenerator.EntityGenerator("src/test/resources/CustomClassLoader/testScript.sql","entity","src/test/resources/CustomClassLoader/");
//        } catch (Exception e) {
//            throw new RuntimeException("Exception in testLoadClass() :{}",e);
//        }
//        Set<Class> actualClasses = CustomClassLoader.getFullyQualifiedClasses(new File("src/test/resources/CustomClassLoader/entity/" + DirectoryHandler.getSchemaName() + "/tables/pojos/"));
//
//        Assertions.assertTrue(!actualClasses.isEmpty());
//
//    }
    @After
    public void cleanUpClassFiles() {
        String path = "src/test/resources/CustomClassLoader/ClassFiles/Dummy.class";
        File file = new File(path);
        if (file.exists()) {
            file.delete();
        }
    }


}
