package Loader;

import org.gemini.codegen.apicodegen.loader.CustomClassLoader;
import org.gemini.codegen.handler.DirectoryHandler;
import org.gemini.codegen.jooqpojogen.EntityClassGenerator;
import org.gemini.codegen.utiltiy.CodeGenUtils;


import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.mockito.MockedStatic;
import org.mockito.Mockito;
import org.mockito.invocation.InvocationOnMock;

import java.io.File;
import java.util.*;

public class CustomClassLoaderTest {
    CustomClassLoader customClassLoader = new CustomClassLoader();
    DirectoryHandler directoryHandler=new DirectoryHandler();
    static MockedStatic<CodeGenUtils> theMock;
    static MockedStatic<CustomClassLoader> theClassLoaderMock;


    @Before
    public void setUp() {
//        try {
//            EntityClassGenerator.EntityGenerator("src/test/resources/CustomClassLoader/testScript.sql", "CustomClassLoader/entity", "src/test/resources/");
//        } catch (Exception e) {
//            throw new RuntimeException("Exception in testLoadClass() :{}", e);
//        }

        Map<String, String> result = new HashMap<>();
        result.put("outerDirectoryPath", "src/test/resources");
        result.put("outerScriptDirectoryPath", "src/test/resources/testScript.sql");
        result.put("dialect", "");
        result.put("driverClassName", "");
        result.put("username", "");
        result.put("password", "");
        result.put("url", "");

        theMock = Mockito.mockStatic(CodeGenUtils.class, InvocationOnMock::callRealMethod);
        theMock.when(() -> CodeGenUtils.createMap()).thenReturn(result);
        theMock.when(() -> CodeGenUtils.generateDirectoryPath()).thenReturn("src/test/resources/");
        theClassLoaderMock = Mockito.mockStatic(CustomClassLoader.class, InvocationOnMock::callRealMethod);

    }
    @After
    public void close() {
        theMock.close();
    }
    @After
    public void cleanUpFiles() {
//        String path = "src/test/resources/entity";
//        File file = new File(path);
//        try {
//            if (file.isDirectory()) {
//                FileUtils.deleteDirectory(file);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        List<String> list=Arrays.asList("Dummy");
        directoryHandler.deleteFiles(list,"src/test/resources/CustomClassLoader/ClassFiles");
    }


    @Test
    public void testCreateApiJson()  {
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("fieldName", "Id");
        jsonObject.put("datatype", "String");
        JSONArray primaryKeyObject= new JSONArray();
        primaryKeyObject.put(jsonObject);
        JSONArray variableKeyObject= new JSONArray();
        primaryKeyObject.put(jsonObject);
        customClassLoader.createAPIJson("Author",primaryKeyObject,variableKeyObject,"src/test/resources/jsonFiles");
        File file = new File("src/test/resources/jsonFiles/Author.json");
        Assertions.assertTrue(file.exists());
    }

    @Test
    public void testLoadClass() {

        Set<Class> classes=new HashSet<>();
        classes.add(Language.class);

        theClassLoaderMock.when(() -> customClassLoader.getFullyQualifiedClassName(new File("src/test/resources/entity/demo/tables/pojos/"))).thenReturn("Language");

        List<String> expectedClassNames = Arrays.asList("Author","Book","Language");

        List<String> actualClassNames = customClassLoader.loadClass(customClassLoader.getFullyQualifiedClasses(new File("src/test/resources/entity/demo/tables/pojos/")),"src/test/resources/entity/demo/tables/pojos/");

        Assertions.assertEquals(expectedClassNames,actualClassNames,"ClassNames not Similar");
    }

    //    @Test
//    public void testGetJsonBody(){
//
//    }
    @Test
    public void testForJavaCompileClass() {
        customClassLoader.compileJavaClasses(new File("src/test/resources/CustomClassLoader/ClassFiles/Dummy.java"));
        File file = new File("src/test/resources/CustomClassLoader/ClassFiles/Dummy.class");
        Assertions.assertTrue(file.exists());

    }

    @Test
    public void testGetFullyQualifiedClassName(){

//        String actual = "entity.tables.pojos.Author";
//
//        Class cls = CustomClassLoader
//       .fullyQualifiedClassName(new File("C:/Users/ad.shrivastava/Desktop/POJOS/entity/tables/pojos/Author.java"));
//        Class cls = customClassLoader.getFullyQualifiedClassName(new File(DirectoryHandler.generateDirectoryPath()+ "Handler/DemoClassFiles/tables/pojos/Author.java"));
//        Assertions.assertEquals(cls.getName(),actual,"wrong");
    }

    @Test
    public void testGetFullyQualifiedClasses(){
        theClassLoaderMock.when(() -> customClassLoader.getFullyQualifiedClassName(new File("src/test/resources/entity/demo/tables/pojos/"))).thenReturn("Language");
        Set<Class> expectedClasses=new HashSet<>();
        expectedClasses.add(Language.class);

        Set<Class> actualClasses = customClassLoader.getFullyQualifiedClasses(new File("src/test/resources/CustomClassLoader/entity/demo/tables/pojos/"));

        Assertions.assertEquals(expectedClasses,actualClasses);


    }



}
