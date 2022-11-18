package Validator;

import org.apache.commons.io.FileUtils;

import org.gemini.codegen.apicodegen.validator.PojoValidator;
import org.gemini.codegen.handler.DirectoryHandler;
import org.gemini.codegen.jooqpojogen.EntityClassGenerator;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;


public class PojoValidatorTest {


    @Before
    public void setUp() {
        DirectoryHandler.setOuterScriptDirectoryPath("src/test/resources/testScript.sql");
        DirectoryHandler.setOuterDirectoryPath("src/test/resources/Handler");
        try {
            EntityClassGenerator.EntityGenerator("src/test/resources/testScript.sql", "entity", "src/test/resources/");
        } catch (Exception e) {
            throw new RuntimeException("Exception in testLoadClass() :{}", e);
        }
    }

    @After
    public void cleanUpFiles() {
        String path = "src/test/resources/entity";
        File file = new File(path);
        try {
            if (file.isDirectory()) {
                FileUtils.deleteDirectory(file);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Test
    public void testCountTables() {
        int actual = PojoValidator.countTables();
        int expected = 3;
        Assertions.assertEquals(expected, actual);
    }


    @Test
    public void testValidatePojoClassContent() {
        File file = new File("src/test/resources/Validator/DemoValidatepojoclasscontent.txt");
        Assertions.assertTrue(PojoValidator.validatePojoClassContent(file));
    }

    @Test
    public void negTestValidatePojoClassContent() {
        File file = new File("src/test/resources/Validator/DemoNegValidatePojoClassContent.txt");
        Assertions.assertFalse(PojoValidator.validatePojoClassContent(file));
    }

    /**
     * To Do getSchemaName() is left for congi
     */
    @Test
    public void testValidatePojoClasses() {
        boolean actual = PojoValidator.validatePojoClasses(new File("src/test/resources/entity/demo/tables/pojos").listFiles());
        Assertions.assertTrue(actual);
    }

    @Test
    public void negTestValidatePojoClasses() {
        File file = new File("src/test/resources/entity/demo/tables/pojos/Author.java");
        file.delete();
        boolean actual = PojoValidator.validatePojoClasses(new File("src/test/resources/entity/demo/tables/pojos").listFiles());
        Assertions.assertFalse(actual);
    }


}
