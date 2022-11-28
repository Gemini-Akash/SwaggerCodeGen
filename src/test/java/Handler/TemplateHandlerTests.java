package Handler;

import org.apache.commons.io.FileUtils;
import org.gemini.codegen.apicodegen.utiltiy.CodeGenUtils;
import org.gemini.codegen.handler.TemplateHandler;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.mockito.MockedStatic;
import org.mockito.Mockito;
import org.mockito.invocation.InvocationOnMock;

import java.io.File;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TemplateHandlerTests {
    TemplateHandler templateHandler = new TemplateHandler();
    static MockedStatic<CodeGenUtils> theMock;
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
        theMock.when(() -> CodeGenUtils.generateDirectoryPath()).thenReturn("src/test/resources/testScriptSpringBootApp/src/main/java/com/gemini/testScript/");
    }
    @After
    public void close() {
        theMock.close();
    }

    @After
    public void cleanUpGeneratedClassTemplate() {
        String path = "src/test/resources/Handler/GeneratedTestTemplates/DummyClass.java";
        File file = new File(path);
        if (file.isDirectory() || file.isFile()) {
            file.delete();
        }
    }

    @After
    public void cleanUpGeneratedFileTemplate() {
        String path = "src/test/resources/Handler/GeneratedTestTemplates/DummyFileTemplate.txt";
        File file = new File(path);
        if (file.isDirectory() || file.isFile()) {
            file.delete();
        }
    }
    @After
    public void cleanUpGeneratedSpringBootProject() {

        String controllerDirectory = "src/test/resources/testScriptSpringBootApp/src/main/java/com/gemini/testScript/controller";
        String exceptionDirectory = "src/test/resources/testScriptSpringBootApp/src/main/java/com/gemini/testScript/Exception";
        String modelDirectory = "src/test/resources/testScriptSpringBootApp/src/main/java/com/gemini/testScript/model";
        String serviceDirectory = "src/test/resources/testScriptSpringBootApp/src/main/java/com/gemini/testScript/service";
        String mainFile = "src/test/resources/testScriptSpringBootApp/src/main/java/com/gemini/testScript/testScript.java";
        String resourcesDirectory = "src/test/resources/testScriptSpringBootApp/src/main/resources";
        String xmlFile = "src/test/resources/testScriptSpringBootApp/pom.xml";

        List<String> directoryList = Arrays.asList(controllerDirectory, exceptionDirectory, modelDirectory, serviceDirectory, resourcesDirectory, mainFile, xmlFile);

        for (String path : directoryList) {
            if (new File(path).exists()) {
                FileUtils.deleteQuietly(new File(path));
            }
        }
    }
    @Test
    public void testGenerateClassFromTemplates() {
        try {
            Method method = TemplateHandler.class.getDeclaredMethod("generateClassFromTemplates", String.class, String.class, String.class);
            method.setAccessible(true);
            method.invoke(templateHandler,"Handler/demoTemplateTest/DummyClassTemplate", "src/test/resources/Handler/GeneratedTestTemplates/DummyClass.java", "src/test/resources/Handler/jsonFiles/DummyJsonForClass.json");
        } catch (Exception e) {
            e.printStackTrace();
        }
        File file = new File("src/test/resources/Handler/GeneratedTestTemplates/DummyClass.java");
        Assertions.assertTrue(file.exists());
    }
    @Test
    public void negTestGenerateClassFromTemplates() {
        try {
            Method method = TemplateHandler.class.getDeclaredMethod("generateClassFromTemplates", String.class, String.class, String.class);
            method.setAccessible(true);
            method.invoke(templateHandler,"", "", "");
        } catch (Exception e) {
            Assertions.assertEquals("Exception in generateClassFromTemplates() : (The system cannot find the path specified)",e.getMessage());
        }
    }
//    @Test
//    public void testGenerateClassFromTemplates() {
//        templateHandler.generateClassFromTemplates("Handler/demoTemplateTest/DummyClassTemplate", "src/test/resources/Handler/GeneratedTestTemplates/DummyClass.java", "src/test/resources/Handler/jsonFiles/DummyJsonForClass.json");
//        File file = new File("src/test/resources/Handler/GeneratedTestTemplates/DummyClass.java");
//        Assertions.assertTrue(file.exists());
//    }
//    @Test
//    public void negTestGenerateClassFromTemplates() {
//        try {
//            templateHandler.generateClassFromTemplates("", "", "");
//        } catch (Exception e) {
//            Assertions.assertEquals("Exception in generateClassFromTemplates() : (The system cannot find the path specified)",e.getMessage());
//        }
//    }
    @Test
    public void testGenerateFileFromTemplate() {
        try {
            Method method = TemplateHandler.class.getDeclaredMethod("generateFileFromTemplate", String.class, String.class);
            method.setAccessible(true);
            method.invoke(templateHandler,"Handler/demoTemplateTest/DummyFileTemplate", "src/test/resources/Handler/GeneratedTestTemplates/DummyFileTemplate.txt");
        } catch (Exception e) {
            e.printStackTrace();
        }
        File file = new File("src/test/resources/Handler/GeneratedTestTemplates/DummyFileTemplate.txt");
        Assertions.assertTrue(file.exists());
    }
    @Test
    public void negTestGenerateFileFromTemplate() {
        try {
            Method method = TemplateHandler.class.getDeclaredMethod("generateFileFromTemplate", String.class, String.class);
            method.setAccessible(true);
            method.invoke(templateHandler,"","");
        } catch (Exception e) {
            Assertions.assertEquals("Exception in generateFileFromTemplate() : (The system cannot find the path specified)",e.getMessage());
        }
    }

//    @Test
//    public void testGenerateFileFromTemplate() {
//        templateHandler.generateFileFromTemplate("Handler/demoTemplateTest/DummyFileTemplate", "src/test/resources/Handler/GeneratedTestTemplates/DummyFileTemplate.txt");
//        File file = new File("src/test/resources/Handler/GeneratedTestTemplates/DummyFileTemplate.txt");
//        Assertions.assertTrue(file.exists());
//    }
//    @Test
//    public void negTestGenerateFileFromTemplate() {
//        try {
//            templateHandler.generateFileFromTemplate("", "");
//        } catch (Exception e) {
//            Assertions.assertEquals("Exception in generateFileFromTemplate() : (The system cannot find the path specified)",e.getMessage());
//        }
//    }
    @Test
    public void testGenerateSpringBootProject() {
        templateHandler.generateSpringBootProject(Arrays.asList("Author"));
        File directory = new File("src/test/resources/testScriptSpringBootApp/src/main/java/com/gemini/testScript/service");
        File file = new File("src/test/resources/testScriptSpringBootApp/src/main/java/com/gemini/testScript/service/AuthorService.java");
        Assertions.assertTrue(directory.exists() && file.exists());
    }
}