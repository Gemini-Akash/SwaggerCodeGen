package Handler;

import org.gemini.codegen.Handler.TemplateHandler;
import org.junit.After;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;

public class TemplateHandlerTests {
        @Test
        public void testGenerateClassFromTemplates(){
            TemplateHandler.generateClassFromTemplates("Handler/demoTemplateTest/DummyClassTemplate","src/test/resources/Handler/GeneratedTestTemplates/DummyClass.java","src/test/resources/Handler/DummyJsonForClass.json");
            File file = new File("src/test/resources/Handler/GeneratedTestTemplates/DummyClass.java");
            Assertions.assertTrue(file.exists(),"Class Template Not Generated");
        }
        @Test
        public void testGenerateFileFromTemplate(){
        TemplateHandler.generateFileFromTemplate("Handler/demoTemplateTest/DummyFileTemplate","src/test/resources/Handler/GeneratedTestTemplates/DummyFileTemplate.txt");
        File file = new File("src/test/resources/Handler/GeneratedTestTemplates/DummyFileTemplate.txt");
            Assertions.assertTrue(file.exists(),"File Template Not Generated");
        }
//        @After
//        public static void cleanUp(){
//            cleanUpFiles("src/test/resources/Handler/GeneratedTestTemplates/DummyClass.java");
//            cleanUpFiles("src/test/resources/Handler/GeneratedTestTemplates/DummyFileTemplate.txt");
//        }
        @After
        public  void cleanUpGeneratedClassTemplate(){
            String path = "src/test/resources/Handler/GeneratedTestTemplates/DummyClass.java";
            File file = new File(path);
            if(file.isDirectory() || file.isFile()){
                file.delete();
            }
        }
        @After
        public void cleanUpGeneratedFileTemplate(){
            String path = "src/test/resources/Handler/GeneratedTestTemplates/DummyFileTemplate.txt";
            File file = new File(path);
            if(file.isDirectory() || file.isFile()){
                file.delete();
            }
        }

}