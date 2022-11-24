package Handler;

import org.gemini.codegen.apicodegen.loader.CustomClassLoader;
import org.gemini.codegen.handler.DirectoryHandler;
import org.junit.After;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;
import java.util.Arrays;
import java.util.List;

public class DirectoryHandlerTests {

    CustomClassLoader customClassLoader = new CustomClassLoader();
    DirectoryHandler directoryHandler = new DirectoryHandler();

    @After
    public void cleanUpFiles() {
        File file = new File("src/test/resources/renamedXYZ");
        if (file.isDirectory()) {
            file.delete();
        }
    }

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
    public void negTestRenameDirectory() {
        directoryHandler.renameDirectory(new File("src/test/resources/Handler/xyz"), new File("src/test/resources/renamedXYZ"));
        File file = new File("src/test/resources/Handler/renamedXYZ");
        Assertions.assertFalse(file.isDirectory());
    }

    @Test
    public void testDeleteDirectory() {
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
}
