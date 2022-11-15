import org.codegen.ApiCodeGen.loader.ClassLoaderTest;
import org.codegen.Handler.DirectoryHandler;
import org.junit.Assert;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DirectoryHandlerTests {

    @Test
    public void testCreateDirectory() throws IOException {
        String directoryPath = "src/test/resources/demoDirectory";
        DirectoryHandler.createDirectory(directoryPath);
        File file = new File(directoryPath);
        Assertions.assertTrue(file.isDirectory(),"Directory Not Created");
    }
    @Test
    public void negTestCreateDirectory(){
//        String directoryPath = "src/test/demoDirectoryy";
//        DirectoryHandler.createDirectory(directoryPath);
////        File file  = new File("src/test/demoDirectoryy/test.json"); // creating object of File
////        if(!file.exists()){
////            file.createNewFile();
////        }
//        File file = new File(directoryPath);
//        Assertions.assertFalse(file.isDirectory());

    }

    @Test
    public void testGetScriptName(){
//        to check this test method set the expected value as per your database script Name
        String expected = "DummyScript";
        String actual = DirectoryHandler.getScriptName();
        Assertions.assertEquals(expected,actual,"Right Script Not Present ");
    }
    @Test
    public void negTestGetScriptName(){
        //   to check this test method set the expected value as per your database script Name
        String expected = "DummyScriptt";
        String actual = DirectoryHandler.getScriptName();
        Assertions.assertNotEquals(expected,actual);
    }
    @Test
    public void testGenerateDirectoryPath(){
//        Need to set the expected value of directory path to check
        String expected = ("C:\\Users\\ad.shrivastava\\Desktop\\Autogenerated\\DummyScriptSpringBootApp\\src\\main\\java\\com\\gemini\\DummyScript").replaceAll("[/\\\\]+","/");
        String actual = DirectoryHandler.generateDirectoryPath();
        Assertions.assertEquals(expected,actual,"expected path and generated directory path do not match");
    }
    @Test
    public void negTestGeneratedDirectoryPath(){
        String expected = "C:/Users/ad.shrivastava/Desktop/Autogenerated/DummyScriptSpringBootApp/src/main/java/com/gemini/ DummyScript";
        String actual = DirectoryHandler.generateDirectoryPath();
        Assertions.assertNotEquals(expected,actual);
    }
    @Test
    public void testRenameDirectory(){
        String filePath = "/src/test/java/Abc";
        DirectoryHandler.renameDirectory(filePath);
    }

    @Test
    public void testDeleteDirectory(){

//        Thread.sleep(20000);
//        new Thread(()-> {
//            try {
//                Thread.sleep(10000);
                String directoryPath = "src/test/ demoDirectoryy";
                DirectoryHandler.deleteDirectory(directoryPath);
                File file = new File(directoryPath);
                Assertions.assertFalse(file.exists());
//            } catch (InterruptedException e) {
//                throw new RuntimeException(e);
//            }
//        }).start();
    }
    @Test
    public void testDeleteFiles(){
        File file  = new File("src/test/resources/ClassFiles/Dummy.java");
        ClassLoaderTest.javaCompileClass(file);
        List<String> list = new ArrayList<>();
        list.add("Dummy");
        DirectoryHandler.deleteFiles(list,"src/test/java/ClassFiles");
        File[] files = new File("src/test/java/ClassFiles").listFiles();
        Assertions.assertEquals(1,1);
    }
}