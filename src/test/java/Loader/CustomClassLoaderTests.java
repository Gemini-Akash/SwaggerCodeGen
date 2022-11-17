package Loader;

import org.gemini.codegen.ApiCodeGen.Loader.CustomClassLoader;
//import org.junit.Test;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;

public class CustomClassLoaderTests {

    private static final Logger log = LoggerFactory.getLogger(CustomClassLoaderTests.class);
    CustomClassLoader customClassLoader = new CustomClassLoader();

//    @Test
//    public void testCreateApiJson() throws IOException {
//        File file = new File("src/main/java/org/codegen/ApiCodeGen/jsonFiles/SwaggerJson.json");
//        Assertions.assertTrue(!(FileUtils.readFileToString(file, Charset.defaultCharset()).isEmpty()),"Swagger.json do not exists");
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
    public void testForJavaCompileClass(){
        CustomClassLoader.compileJavaClasses(new File("src/test/resources/CustomClassLoader/ClassFiles/Dummy.java"));
        File file = new File("src/test/resources/CustomClassLoader/ClassFiles/Dummy.class");
        Assertions.assertTrue(file.exists(),"File is not compiled by compiler");
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
    @AfterAll
    public static void cleanUp(){
        String path = "src/test/resources/CustomClassLoader/ClassFiles/Dummy.class";
        File file = new File(path);
        if(file.exists()){
            file.delete();
        }
    }


}
