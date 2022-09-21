import com.fasterxml.jackson.annotation.JsonTypeInfo;
import org.apache.commons.io.FileUtils;
import org.codegen.ApiCodeGen.loader.Classloader;
import org.json.simple.JSONObject;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.tools.JavaCompiler;
import javax.tools.ToolProvider;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.charset.Charset;
import java.util.HashSet;
import java.util.Set;

import static org.codegen.ApiCodeGen.Validator.pojoValidator.validatePojoClasses;
import static org.codegen.ApiCodeGen.loader.Classloader.readClass;
import static org.junit.Assert.assertEquals;

public class ClassLoaderTests {

    private static final Logger log = LoggerFactory.getLogger(Classloader.class);

    Classloader classloader = new Classloader();

//    @Test
//    public void testForLoaderJsonFile(){
//        File file = new File("src/main/java/org/codegen/ApiCodeGen/jsonFiles/Loader.json");
//        Assertions.assertTrue(file.exists());
//    }
    @Test (expected = IllegalArgumentException.class)
    public void testToLoadClassWithoutArgument() {

        Set<Class> actualClasses = new HashSet<>();
//        try {
            Classloader.loadClass(actualClasses);
//        }
//        catch (Exception e){
//            e.printStackTrace();
//        }
    }

    @Test
    public void testToLoaderJsonFileIsEmpty() throws IOException {
        File file = new File("src/main/java/org/codegen/ApiCodeGen/jsonFiles/Loader.json");
        Assertions.assertTrue(file.exists()  && !(FileUtils.readFileToString(file, Charset.defaultCharset()).isEmpty()),"Loader.json file do not exists");
    }
    @Test
    public void testForLoaderJsonNotFound()  {
        File file = new File("src/main/java/org/codegen/ApiCodeGen/jsonFiles/Loaderr.json");
        boolean expected = false;
        boolean actual = file.exists();
        Assertions.assertEquals(expected,actual);
    }

    @Test
    public void testForJsonBody() throws ClassNotFoundException {
        JSONObject realjsonObject = new JSONObject();

        realjsonObject.put("ID","Integer");
        realjsonObject.put("FIRST_NAME","String");
        realjsonObject.put("LAST_NAME","String");
        realjsonObject.put("DATE_OF_BIRTH","LocalDate");
        realjsonObject.put("YEAR_OF_BIRTH","Integer");
        realjsonObject.put("DISTINGUISHED","Byte");

        Class classContent = Class.forName("test.entity.Author");

        JSONObject expectedJSONObject = Classloader.getJsonBody(classContent);
        System.out.println(expectedJSONObject);
        Assertions.assertEquals(expectedJSONObject,realjsonObject,"mapping not done correctly");

    }
    @Test
    public void testForEmptyJsonObjectFromJsonBody() throws ClassNotFoundException {
        Class classContent = Class.forName("test.entity.Author");
        JSONObject expectedJSONObject = Classloader.getJsonBody(classContent);
//        System.out.println(expectedJSONObject);
        Assertions.assertFalse(expectedJSONObject.isEmpty(), "JSONObject is  empty");

    }
    @Test
    public void readClassNameTest(){

        Set<Class> actualClasses = Classloader.readClass();
        System.out.println(actualClasses);
        Assertions.assertNotNull(actualClasses,"Set of classes are returned empty ");
    }
    @Test
    public void testConvertIntoApiJson() throws IOException {

        File file = new File("src/main/java/org/codegen/ApiCodeGen/jsonFiles/SwaggerJson.json");
        Assertions.assertTrue(!(FileUtils.readFileToString(file, Charset.defaultCharset()).isEmpty()),"Swagger.json do not exists");
    }

    @Test
    public void testForFullyQualifiedName(){

        String actual = "entity.tables.pojos.Author";

        Class cls = Classloader.fullyQualifiedClassName(new File("C:\\Users\\ad.shrivastava\\Desktop\\POJOS\\entity\\tables\\pojos\\Author.java"));
        Assertions.assertEquals(cls.getName(),actual,"wrong");

    }

    @Test
    public void testForJavaCompileClass(){

        Classloader.javaCompileClass(new File("D:\\Internal\\SwaggerCodeGen\\src\\test\\java\\test\\entity\\Author.java"));
        File file = new File("D:\\Internal\\SwaggerCodeGen\\src\\test\\java\\test\\entity\\Author.class");
        Assertions.assertTrue(file.exists(),"File is not compiled by compiler");

    }

}
