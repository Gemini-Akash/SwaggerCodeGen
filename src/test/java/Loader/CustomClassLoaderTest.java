package Loader;

import entity.demo.tables.pojos.Language;
import org.gemini.codegen.apicodegen.loader.CustomClassLoader;
import org.gemini.codegen.apicodegen.validator.PojoValidator;
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
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class CustomClassLoaderTest {
    static MockedStatic<CodeGenUtils> theMock;
    CustomClassLoader customClassLoader = new CustomClassLoader();
    DirectoryHandler directoryHandler = new DirectoryHandler();
    PojoValidator pojoValidator = new PojoValidator();
//    static MockedStatic<CustomClassLoader> theClassLoaderMock;
//    static MockedStatic<PojoValidator> thePojoValidatorMock;

    @Before
    public void setUp() {
//        try {
//            EntityClassGenerator.EntityGenerator("src/test/resources/CustomClassLoader/testScript.sql", "entity", "src/test/resources/");
//        } catch (Exception e) {
//            throw new RuntimeException("Exception in testLoadClass() :{}", e);
//        }

        Map<String, String> result = new HashMap<>();
        result.put("outerDirectoryPath", "src/test/resources");
        result.put("outerScriptDirectoryPath", "src/test/resources/CustomClassLoader/testScript.sql");
        result.put("dialect", "");
        result.put("driverClassName", "");
        result.put("username", "");
        result.put("password", "");
        result.put("url", "");

        theMock = Mockito.mockStatic(CodeGenUtils.class, InvocationOnMock::callRealMethod);
        theMock.when(() -> CodeGenUtils.createMap()).thenReturn(result);
        theMock.when(() -> CodeGenUtils.generateDirectoryPath()).thenReturn("src/test/java");

//        theClassLoaderMock = Mockito.mockStatic(CustomClassLoader.class, InvocationOnMock::callRealMethod);

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

    }


    @Test
    public void testCreateApiJson() {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("fieldName", "Id");
        jsonObject.put("datatype", "String");
        JSONArray primaryKeyObject = new JSONArray();
        primaryKeyObject.put(jsonObject);
        JSONArray variableKeyObject = new JSONArray();
        primaryKeyObject.put(jsonObject);
        customClassLoader.createAPIJson("Author", primaryKeyObject, variableKeyObject, "src/test/resources/jsonFiles");
        File file = new File("src/test/resources/jsonFiles/Author.json");
        Assertions.assertTrue(file.exists());
    }

    @Test
    public void testLoadClass() {


//        Set<Class> classes=new HashSet<>();
//        classes.add(Language.class);
//
//        theClassLoaderMock.when(() -> customClassLoader.getFullyQualifiedClassName(new File("src/test/resources/entity/demo/tables/pojos/"))).thenReturn(Language.class);
//
//        List<String> expectedClassNames = Arrays.asList("Language");
//
//        List<String> actualClassNames = customClassLoader.loadClass(customClassLoader.getFullyQualifiedClasses(new File("src/test/resources/entity/demo/tables/pojos/")),"src/test/resources/entity/demo/tables/pojos/");
//
//        Assertions.assertEquals(expectedClassNames,actualClassNames,"ClassNames not Similar");
    }

    //    @Test
//    public void testGetJsonBody(){
//
//    }
    @Test
    public void testForJavaCompileClass() {
//        customClassLoader.compileJavaClasses(new File("src/test/resources/CustomClassLoader/ClassFiles/Dummy.java"));
//        File file = new File("src/test/resources/CustomClassLoader/ClassFiles/Dummy.class");
//        Assertions.assertTrue(file.exists());
        customClassLoader.compileJavaClasses(new File("src/test/java/com/gemini/testScript/entity/demo/tables/pojos/Language.java"));

    }

    @Test
    public void testGetFullyQualifiedClassName() {

//        String actual = "entity.tables.pojos.Author";
//
//        Class cls = CustomClassLoader
//       .fullyQualifiedClassName(new File("C:/Users/ad.shrivastava/Desktop/POJOS/entity/tables/pojos/Author.java"));
//        Class cls = customClassLoader.getFullyQualifiedClassName(new File(DirectoryHandler.generateDirectoryPath()+ "Handler/DemoClassFiles/tables/pojos/Author.java"));
//        Assertions.assertEquals(cls.getName(),actual,"wrong");
    }

    @Test
    public void testGetFullyQualifiedClasses() {
        PojoValidator thePojoValidatorMock = Mockito.spy(PojoValidator.class);
        Mockito.doReturn(true).when(thePojoValidatorMock).validatePojoClasses(new File("src/test/java/entity/demo/tables/pojos/").listFiles());
        Mockito.doReturn(1).when(thePojoValidatorMock).countTables();
        Mockito.doReturn(true).when(thePojoValidatorMock).validatePojoClassContent(new File("src/test/java/entity/demo/tables/pojos/Language.java"));
        CustomClassLoader theClassLoaderMock = Mockito.spy(CustomClassLoader.class);

        Mockito.doReturn(Language.class).when(theClassLoaderMock).getFullyQualifiedClassName(new File("src/test/java/entity/demo/tables/pojos/"));


//        PojoValidator thePojoValidatorMock= mock(PojoValidator.class);
//        when(thePojoValidatorMock.validatePojoClasses(new File("src/test/java/entity/demo/tables/pojos/").listFiles())).thenReturn(true);
//        CustomClassLoader theClassLoaderMock = mock(CustomClassLoader.class,InvocationOnMock::callRealMethod);
//        when(theClassLoaderMock.getFullyQualifiedClassName(new File("src/test/java/entity/demo/tables/pojos/"))).thenReturn(Language.class);


        System.out.println(thePojoValidatorMock.validatePojoClasses(new File("src/test/java/entity/demo/tables/pojos/").listFiles()));
        System.out.println(theClassLoaderMock.getFullyQualifiedClassName(new File("src/test/java/entity/demo/tables/pojos/")));
        Set<Class> expectedClasses = new HashSet<>();
        expectedClasses.add(Language.class);

        Set<Class> actualClasses = theClassLoaderMock.getFullyQualifiedClasses(new File("src/test/java/entity/demo/tables/pojos/"));

        Assertions.assertEquals(expectedClasses, actualClasses);


    }


}
