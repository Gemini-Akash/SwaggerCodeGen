package Handler;

import org.gemini.codegen.handler.TemplateHandler;
import org.junit.After;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;

public class TemplateHandlerTests {
    TemplateHandler templateHandler=new TemplateHandler();

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

    @Test
    public void testGenerateClassFromTemplates() {
        templateHandler.generateClassFromTemplates("Handler/demoTemplateTest/DummyClassTemplate", "src/test/resources/Handler/GeneratedTestTemplates/DummyClass.java", "src/test/resources/Handler/DummyJsonForClass.json");
        File file = new File("src/test/resources/Handler/GeneratedTestTemplates/DummyClass.java");
        Assertions.assertTrue(file.exists());
    }

    @Test
    public void testGenerateFileFromTemplate() {
        templateHandler.generateFileFromTemplate("Handler/demoTemplateTest/DummyFileTemplate", "src/test/resources/Handler/GeneratedTestTemplates/DummyFileTemplate.txt");
        File file = new File("src/test/resources/Handler/GeneratedTestTemplates/DummyFileTemplate.txt");
        Assertions.assertTrue(file.exists());
    }


}