import org.codegen.ApiCodeGen.loader.ClassLoaderTest;
import org.codegen.Handler.DirectoryHandler;
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
        String directoryPath = "D:\\Internal\\SwaggerCodeGen\\src\\test\\demoDirectoryy";
        DirectoryHandler.createDirectory(directoryPath);
//        File f = new File("D:\\Internal\\SwaggerCodeGen\\src\\test\\demoDirectoryy\\test.json");
        File file  = new File("D:\\Internal\\SwaggerCodeGen\\src\\test\\demoDirectoryy\\test.json"); // creating object of File
        if(!file.exists()){
            file.createNewFile();
        }
        String str = file.getPath().replace(".json", ".txt"); // replacing extension to another
        file.renameTo(new File(str));
        File fileDirectory = new File(directoryPath);
        Assertions.assertTrue(fileDirectory.exists(),"Directory Do not exists");
    }

    @Test
    public void testGetScriptName(){

//        to check this test method set the expected value as per your database script Name
        String expected = "DummyScript";
        String actual = DirectoryHandler.getScriptName();
        Assertions.assertEquals(expected,actual);
    }

    @Test
    public void testGenerateDirectoryPath(){

//        Need to set the
        String expected = "C:\\Users\\ad.shrivastava\\Desktop\\Autogenerated\\src\\main\\java\\com\\gemini\\DummyScript";
        String actual = DirectoryHandler.generateDirectoryPath();
        Assertions.assertEquals(expected,actual,"expected path and generated directory path do not match");
    }

    @Test
    public void testRenameDirectory(){

        String filePath = "D:\\Internal\\SwaggerCodeGen\\src\\test\\java\\abc";
    }

    @Test
    public void testDeleteDirectory() throws InterruptedException {

//        Thread.sleep(20000);
//        new Thread(()-> {
//            try {
//                Thread.sleep(10000);
                String directoryPath = "D:\\Internal\\SwaggerCodeGen\\src\\test\\demoDirectoryy";
                DirectoryHandler.deleteDirectory(directoryPath);
                File file = new File(directoryPath);
                Assertions.assertFalse(file.exists(), "Directory Still exists ");
//            } catch (InterruptedException e) {
//                throw new RuntimeException(e);
//            }
//        }).start();
    }

//    @Test(expected = FileNotFoundException.class)
    @Test
    public void testDeleteDirectoryNotDeleted(){
        String directoryPath = "D:\\Internal\\SwaggerCodeGen\\src\\test\\testDirectoryyy";
        File file = new File(directoryPath);
        if (directoryPath != null && file.isDirectory()) {
            DirectoryHandler.deleteDirectory(directoryPath);
        }
        else{
            throw new NullPointerException();
        }
    }

    @Test
    public void testDeleteFiles(){

        List<String> listClassNames = new ArrayList<>();
//        List<String> testclassNames= ClassLoaderTest.loadClass(ClassLoaderTest.readClass());
//        System.out.println(testclassNames);
        listClassNames.add("demo1.class");

    }
}
