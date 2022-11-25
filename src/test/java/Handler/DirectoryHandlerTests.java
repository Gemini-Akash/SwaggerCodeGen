package Handler;

import org.gemini.codegen.apicodegen.loader.CustomClassLoader;
import org.gemini.codegen.handler.DirectoryHandler;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;
import java.util.Arrays;
import java.util.List;

public class DirectoryHandlerTests {

    CustomClassLoader customClassLoader = new CustomClassLoader();
    DirectoryHandler directoryHandler = new DirectoryHandler();



    @Test
    public void testRenameDirectory() {
        if (new File("src/test/resources/Handler/Abc").mkdir()) {
            directoryHandler.renameDirectory(new File("src/test/resources/Handler/Abc"), new File("src/test/resources/Handler/xyz"));
            File file = new File("src/test/resources/Handler/xyz");
            Assertions.assertTrue(file.isDirectory());
        } else {
            System.out.println("Abc directory exists.");
        }
    }
    @Test
    public void testDeleteDirectory() {
        new File("src/test/resources/Handler/xyz").mkdir();
        directoryHandler.deleteDirectory("src/test/resources/Handler/xyz");
        File file = new File("src/test/resources/Handler/xyz");
        Assertions.assertFalse(file.exists());
    }

    @Test
    public void negTestRenameDirectory() {
        directoryHandler.renameDirectory(new File("src/test/resources/Handler/xyz"), new File(""));
        File file = new File("");
        Assertions.assertFalse(file.isDirectory());
    }

    @Test
    public void negTestDeleteDirectory() {
        directoryHandler.deleteDirectory("src/test/resources/Handler/xyz");
        File file = new File("src/test/resources/Handler/xyz");
        Assertions.assertFalse(file.exists());
    }

    @Test
    public void testDeleteFiles() {
        customClassLoader.compileJavaClasses(new File("src/test/resources/Handler/DemoClassFiles/Dummy.java"));
        List<String> list = Arrays.asList("Dummy");
        directoryHandler.deleteFiles(list, "src/test/resources/Handler/DemoClassFiles/");
        File classFile = new File("src/test/resources/Handler/DemoClassFiles/Dummy.class");
        Assertions.assertFalse(classFile.exists());
    }
    @Test
    public void negTestDeleteFiles() {
        List<String> list = Arrays.asList("Dummy");
        try {
            directoryHandler.deleteFiles(list, "src/test/resources/Handler/DemoClassFiles/");
        }catch (Exception e){
            Assertions.assertEquals("Dummy.class does not exist",e.getMessage());
        }
    }
}
