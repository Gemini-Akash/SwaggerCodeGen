import org.apache.commons.io.FileUtils;
import org.codegen.ApiCodeGen.loader.ClassLoaderTest;
import org.codegen.Handler.DirectoryHandler;
import org.json.simple.JSONObject;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.HashSet;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.assertThrows;

public class ClassLoaderTests {

    private static final Logger log = LoggerFactory.getLogger(ClassLoaderTests.class);

    ClassLoaderTest classloader = new ClassLoaderTest();

    @Test
    public void testConvertIntoApiJson() throws IOException {
        File file = new File("src/main/java/org/codegen/ApiCodeGen/jsonFiles/SwaggerJson.json");
        Assertions.assertTrue(!(FileUtils.readFileToString(file, Charset.defaultCharset()).isEmpty()),"Swagger.json do not exists");
    }
    @Test
    public void testLoaderJsonFileIsEmpty() throws IOException {
        File file = new File("src/main/java/org/codegen/ApiCodeGen/jsonFiles/Loader.json");
        Assertions.assertTrue(file.exists()  && !(FileUtils.readFileToString(file, Charset.defaultCharset()).isEmpty()),"Loader.json file do not exists");
    }

    @Test (expected = NullPointerException.class)
    public void testToLoadClassWithoutArgument() throws Exception{
        Set<Class> actualClasses = new HashSet<>();
//        try {
            ClassLoaderTest.loadClass(actualClasses);
//        }
//        catch (Exception e){
//            e.printStackTrace();
//        }
    }



//    @Test
//    public void testForEmptyJsonObjectFromJsonBody() throws ClassNotFoundException {
//        Class classContent = Class.forName("test.entity.Author");
//        JSONObject expectedJSONObject = ClassLoaderTest.getJsonBody(classContent);
////        System.out.println(expectedJSONObject);
//        Assertions.assertFalse(expectedJSONObject.isEmpty(), "JSONObject is  empty");
//
//    }


    @Test
    public void testForJavaCompileClass(){
        ClassLoaderTest.javaCompileClass(new File("src/test/java/test/entity/Author.java"));
        File file = new File("src/test/java/test/entity/Author.class");
        Assertions.assertTrue(file.exists(),"File is not compiled by compiler");

    }

    @Test
    public void testForFullyQualifiedName(){

        String actual = "entity.tables.pojos.Author";

//        Class cls = ClassLoaderTest.fullyQualifiedClassName(new File("C:/Users/ad.shrivastava/Desktop/POJOS/entity/tables/pojos/Author.java"));
        Class cls = ClassLoaderTest.fullyQualifiedClassName(new File(DirectoryHandler.generateDirectoryPath()+"entity/tables/pojos/Author.java"));
        Assertions.assertEquals(cls.getName(),actual,"wrong");
    }

    @Test
    public void testReadClassName(){
        Set<Class> actualClasses = ClassLoaderTest.readClass();
//        System.out.println(actualClasses);
        Assertions.assertNotNull(actualClasses,"Set of classes are returned empty ");
    }


    @Test(expected = NullPointerException.class)
    public void testExceptionReadClassName(){

        Set<Class> actualClasses = null;
//        ClassLoaderTest.loadClass(actualClasses);

        assertThrows(NullPointerException.class, () -> {
            ClassLoaderTest.loadClass(actualClasses);
        });


    }




}
