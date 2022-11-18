package Handler;

import org.gemini.codegen.ApiCodeGen.Loader.CustomClassLoader;
import org.gemini.codegen.Handler.DirectoryHandler;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.mockito.MockedStatic;
import org.mockito.Mockito;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.Arrays;
import java.util.List;

public class DirectoryHandlerTests {
    private static final Logger LOG = LoggerFactory.getLogger(DirectoryHandlerTests.class);

    @Before
    public void setUp(){
        File file = new File("src/test/resources/Handler/Abc");
        if(!file.exists()){
            file.mkdir();
        }
        DirectoryHandler.setOuterScriptDirectoryPath("src/test/resources/Handler/testScript.sql");
        DirectoryHandler.setOuterDirectoryPath("src/test/resources/Handler");
    }
    @After
    public  void cleanUpFiles(){
        String path = "src/test/resources/Handler/demoDirectory";
        File file = new File(path);
        if(file.isDirectory() || file.isFile()){
            file.delete();
        }
        String path1 = "src/test/resources/Handler/renamedXYZ";
        File file1 = new File(path1);
        if(file1.isDirectory() || file1.isFile()){
            file1.delete();
        }
    }


    @Test
    public void testCreateDirectory(){
        String directoryPath = "src/test/resources/Handler/demoDirectory";
        DirectoryHandler.createDirectory(directoryPath);
        File file = new File(directoryPath);
        Assertions.assertTrue(file.exists());
    }
    @Test
    public void testGetScriptName(){
        String expected="testScript";
        String actual=DirectoryHandler.getScriptName();
        Assertions.assertEquals(expected,actual);
    }

    @Test
    public void negTestGetScriptName(){
        String expected = "DummyScriptt";
        String actual = DirectoryHandler.getScriptName();
        Assertions.assertNotEquals(expected,actual);
    }

    @Test
    public void testGetSchemaName(){
        try (MockedStatic<DirectoryHandler> theMock = Mockito.mockStatic(DirectoryHandler.class)) {
            theMock.when(() -> DirectoryHandler.generateDirectoryPath())
                    .thenReturn("src/test/resources/Handler");
            String expected = DirectoryHandler.getSchemaName();
            System.out.println(expected);
            String actual = "ims";
            Assertions.assertEquals(expected, actual);
        }
    }

    @Test
    public void negTestGetSchemaName(){
        try (MockedStatic<DirectoryHandler> theMock = Mockito.mockStatic(DirectoryHandler.class)) {
            theMock.when(() -> DirectoryHandler.generateDirectoryPath())
                    .thenReturn("src/test/resources/Handler");
            String expected = DirectoryHandler.getSchemaName();
            String actual = "ims1";
            Assertions.assertNotEquals(expected, actual);
        }
    }


    @Test
    public void testGenerateDirectoryPath(){
        StringBuilder path=new StringBuilder();
        path.setLength(0);
        path.append(DirectoryHandler.outerDirectoryPath);
        path.append("/");
        path.append(DirectoryHandler.getScriptName());
        path.append("SpringBootApp/src/main/java/com/gemini/");
        path.append(DirectoryHandler.getScriptName());
        String expected = path.toString();
        String actual = DirectoryHandler.generateDirectoryPath();
        Assertions.assertEquals(expected,actual);
    }


    @Test
    public void testRenameDirectory(){
        DirectoryHandler.renameDirectory(new File("src/test/resources/Handler/Abc"), new File("src/test/resources/Handler/xyz"));
        File file = new File("src/test/resources/Handler/xyz");
        Assertions.assertTrue(file.isDirectory());
    }

    @Test
    public void negTestRenameDirectory(){
        DirectoryHandler.renameDirectory(new File("src/test/resources/Handler/xyz"), new File("src/test/resources/renamedXYZ"));
        File file = new File("src/test/resources/Handler/renamedXYZ");
        Assertions.assertFalse(file.isDirectory());
    }

    @Test
    public void testDeleteDirectory(){
        DirectoryHandler.deleteDirectory("src/test/resources/Handler/xyz");
        File file = new File("src/test/resources/Handler/xyz");
        Assertions.assertFalse(file.exists());
    }

    @Test
    public void testDeleteFiles(){
        CustomClassLoader.compileJavaClasses(new File("src/test/resources/Handler/DemoClassFiles/Dummy.java"));
        List<String> list = Arrays.asList("Dummy");
        DirectoryHandler.deleteFiles(list,"src/test/resources/Handler/DemoClassFiles/");
        File classFile = new File("src/test/resources/Handler/DemoClassFiles/Dummy.class");
        Assertions.assertFalse(classFile.exists());
    }
}
