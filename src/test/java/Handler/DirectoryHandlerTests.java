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
    }

    @Test
    public void testCreateDirectory(){
        String directoryPath = "src/test/resources/Handler/demoDirectory";
        DirectoryHandler.createDirectory(directoryPath);
        File file = new File(directoryPath);
        Assertions.assertTrue(file.exists(),"Directory Not Created");
    }
    @Test
    public void testGetScriptName(){
        try (MockedStatic<DirectoryHandler> theMock = Mockito.mockStatic(DirectoryHandler.class)) {
            theMock.when(() -> DirectoryHandler.getScriptName())
                    .thenReturn("DummyScript");
            System.out.println(DirectoryHandler.getScriptName());
            Assertions.assertEquals("DummyScript", DirectoryHandler.getScriptName());
        }

    }

    @Test
    public void negTestGetScriptName(){
//    try {
//        EntityClassGenerator.EntityGenerator("src/test/resources/CustomClassLoader/testScript.sql","entity","src/test/resources/CustomClassLoader/");
//    } catch (Exception e) {
//        throw new RuntimeException("Exception in testLoadClass() :{}",e);
//    }
//        //   to check this test method set the expected value as per your database script Name
//        String expected = "DummyScriptt";
//        String actual = DirectoryHandler.getScriptName();
//        Assertions.assertNotEquals(expected,actual);

        DirectoryHandler d = new DirectoryHandler();
        d.se


    }

//    @Test
//    public void testGetSchemaName(){}

//    @Test
//    public void testGenerateDirectoryPath(){
////        Need to set the expected value of directory path to check
//        String expected = ("C:\\Users\\ad.shrivastava\\Desktop\\Autogenerated\\DummyScriptSpringBootApp\\src\\main\\java\\com\\gemini\\DummyScript").replaceAll("[/\\\\]+","/");
//        String actual = DirectoryHandler.generateDirectoryPath();
//        Assertions.assertEquals(expected,actual,"expected path and generated directory path do not match");
//    }

//    @Test
//    public void negTestGeneratedDirectoryPath(){
//        String expected = "C:/Users/ad.shrivastava/Desktop/Autogenerated/DummyScriptSpringBootApp/src/main/java/com/gemini/ DummyScript";
//        String actual = DirectoryHandler.generateDirectoryPath();
//        Assertions.assertNotEquals(expected,actual);
//    }

    @Test
    public void testRenameDirectory(){
        DirectoryHandler.renameDirectory(new File("src/test/resources/Handler/Abc"), new File("src/test/resources/Handler/xyz"));
        File file = new File("src/test/resources/Handler/xyz");
        Assertions.assertTrue(file.isDirectory());
    }

//    @Test
//    public void testNegRenameDirectory(){
//        DirectoryHandler.renameDirectory(new File("src/test/resources/Handler/demoDirectory"), new File("src/test/resources/renamedDemoDirectory"));
//        File file = new File("src/test/resources/Handler/renamedDemoDirectory");
//        Assertions.assertFalse(file.isDirectory());
//    }

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

//    @After
//    public static void cleanUp(){
//        cleanUpFiles("src/test/resources/Handler/demoDirectory");
//    }
    @After
    public  void cleanUpFiles(){
        String path = "src/test/resources/Handler/demoDirectory";
        File file = new File(path);
        if(file.isDirectory() || file.isFile()){
            file.delete();
        }
    }

}
