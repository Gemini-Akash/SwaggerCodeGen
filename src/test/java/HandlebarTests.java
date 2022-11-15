import org.codegen.Handler.TemplateHandler;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;
import java.io.FileNotFoundException;

import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class HandlebarTests {
        @Test
        public void testGenerateClassFromTemplates(){
            TemplateHandler.generateClassFromTemplates("demoTemplateTest\\DummyClassTemplate","src\\test\\DummyClass.java","src/test/resources/DummyJsonForClass.json");
            File file = new File("src\\test\\DummyClass.java");
            Assertions.assertTrue(file.exists(),"Class Template Not Generated");
        }
        @Test
        public void testGenerateFileFromTemplate(){
        TemplateHandler.generateFileFromTemplate("demoTemplateTest\\DummyFileTemplate","src\\test\\DummyFileTemplate.txt");
        File file = new File("src\\test\\DummyFileTemplate.txt");
            Assertions.assertTrue(file.exists(),"File Template Not Generated");
        }

}