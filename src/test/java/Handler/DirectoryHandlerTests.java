package Handler;

import org.gemini.codegen.apicodegen.loader.CustomClassLoader;
import org.gemini.codegen.handler.DirectoryHandler;
import org.gemini.codegen.utiltiy.CodeGenUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.mockito.MockedStatic;
import org.mockito.Mockito;
import org.mockito.invocation.InvocationOnMock;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DirectoryHandlerTests {

    CustomClassLoader customClassLoader = new CustomClassLoader();
    DirectoryHandler directoryHandler=new DirectoryHandler();

    @Before
    public void setUp() {
        File file = new File("src/test/resources/Handler/Abc");
        if (!file.exists()) {
            file.mkdir();
        }
    }


    @After
    public void cleanUpFiles() {

        String path = "src/test/resources/Handler/demoDirectory";
        File file = new File(path);
        if (file.isDirectory() || file.isFile()) {
            file.delete();
        }
        String path1 = "src/test/resources/renamedXYZ";
        File file1 = new File(path1);
        if (file1.isDirectory() || file1.isFile()) {
            file1.delete();
        }

    }

    @Test
    public void testRenameDirectory() {
        directoryHandler.renameDirectory(new File("src/test/resources/Handler/Abc"), new File("src/test/resources/Handler/xyz"));
        File file = new File("src/test/resources/Handler/xyz");
        Assertions.assertTrue(file.isDirectory());
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
