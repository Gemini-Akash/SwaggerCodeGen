package Handler;

import org.gemini.codegen.Handler.DbJsonHandler;
import org.junit.After;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;

public class DbJsonHandlerTest {
    @After
    public  void cleanUpFiles(){
        String path = "src/test/resources/Handler/jsonFiles/DemoApplicationProperties.json";
        File file = new File(path);
        if(file.isDirectory() || file.isFile()){
            file.delete();
        }
    }
    @Test
    public void createDbJson(){
        File filePath = new File("src/test/resources/Handler/jsonFiles/DemoApplicationProperties.json");
        DbJsonHandler.createDbJson(filePath,"jdbc:mysql://localhost:3306/","xyz","root","gemini","com.mysql.cj.jdbc.Driver");
        Assertions.assertTrue(filePath.exists());
    }
}
