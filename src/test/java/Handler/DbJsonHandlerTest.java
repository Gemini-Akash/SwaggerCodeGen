package Handler;

import org.gemini.codegen.handler.DbJsonHandler;
import org.junit.After;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;

public class DbJsonHandlerTest {

    DbJsonHandler dbJsonHandler = new DbJsonHandler();

    @After
    public void cleanUpFiles() {
        String path = "src/test/resources/jsonFiles/DemoApplicationProperties.json";
        File file = new File(path);
        if (file.isDirectory() || file.isFile()) {
            file.delete();
        }
    }

    @Test
    public void createDbJson() {
        File filePath = new File("src/test/resources/jsonFiles/DemoApplicationProperties.json");
        dbJsonHandler.createDbJson(filePath, "jdbc:mysql://localhost:3306/", "xyz", "root", "gemini", "com.mysql.cj.jdbc.Driver");
        Assertions.assertTrue(filePath.exists());
    }

    @Test
    public void negCreateDbJson() {
        File filePath = new File("src/test/resources/jsonFiles/");
        try {
            dbJsonHandler.createDbJson(filePath, "jdbc:mysql://localhost:3306/", "xyz", "root", "gemini", "com.mysql.cj.jdbc.Driver");
        } catch (Exception e) {
            Assertions.assertEquals("Exception in  writing JSON file / createDbJson(): src/test/resources/jsonFiles ", e.getMessage());
        }
    }
}
