package Loader;

import entity.demo.tables.pojos.Language;
import org.gemini.codegen.apicodegen.loader.CustomClassLoader;
import org.gemini.codegen.handler.DirectoryHandler;
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
    static MockedStatic<CodeGenUtils> theMock;
    CustomClassLoader customClassLoader = new CustomClassLoader();
    DirectoryHandler directoryHandler = new DirectoryHandler();

    @Before
    public void setUp() {
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

    }

    @After
    public void close() {
        theMock.close();
    }

    @After
    public void cleanUpFiles() {
        List<String> list = Arrays.asList("Dummy");
        directoryHandler.deleteFiles(list, "src/test/resources/CustomClassLoader/ClassFiles");
        new File("src/test/resources/jsonFiles/Language.json").delete();
        new File("src/test/java/com/gemini/testScript/entity/demo/tables/pojos/Language.class").delete();
        new File("src/test/java/jsonFiles").delete();
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
        customClassLoader.createAPIJson("Author", primaryKeyObject, variableKeyObject, "src/test/resources");
        File file = new File("src/test/resources/jsonFiles/Author.json");
        Assertions.assertTrue(file.exists());
    }

    @Test
    public void testLoadClass() {
        new File("src/test/java/com/gemini/testScript/entity/demo/tables/pojos/Language.class").delete();
        Set<Class> classes = new HashSet<>();
        classes.add(Language.class);
        List<String> expectedClassNames = Arrays.asList("Language");
        List<String> actualClassNames = customClassLoader.loadClass(customClassLoader.getFullyQualifiedClasses(new File("src/test/java/com/gemini/testScript/entity/demo/tables/pojos")),
                "src/test/resources/");
        Assertions.assertEquals(expectedClassNames, actualClassNames);
    }


    @Test
    public void testForJavaCompileClass() {
        customClassLoader.compileJavaClasses(new File("src/test/resources/CustomClassLoader/ClassFiles/Dummy.java"));
        File file = new File("src/test/resources/CustomClassLoader/ClassFiles/Dummy.class");
        Assertions.assertTrue(file.exists());
    }

    @Test
    public void testGetJsonBody() {
        customClassLoader.getJsonBody(Language.class, "src/test/resources");
        File file = new File("src/test/resources/jsonFiles/Book.json");
        Assertions.assertTrue(file.exists());
    }


    @Test
    public void testGetFullyQualifiedClasses() {
        Class cl = com.gemini.testScript.entity.demo.tables.pojos.Language.class;
        Set<Class> expected = new HashSet<>();
        expected.add(cl);
        Set<Class> actualClasses = customClassLoader.getFullyQualifiedClasses(new File("src/test/java/com/gemini/testScript/entity/demo/tables/pojos"));
        Assertions.assertEquals(expected, actualClasses);
    }
    @Test
    public void testGetFullyQualifiedClassName() {
        Class expected = com.gemini.testScript.entity.demo.tables.pojos.Language.class;
        Class actual = customClassLoader.getFullyQualifiedClassName(new File("src/test/java/com/gemini/testScript/entity/demo/tables/pojos/Language.java"));
        Assertions.assertEquals(expected, actual);

    }


}
