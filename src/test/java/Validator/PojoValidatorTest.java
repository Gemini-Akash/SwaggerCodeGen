package Validator;

import org.apache.commons.io.FileUtils;
import org.gemini.codegen.apicodegen.validator.PojoValidator;
import org.gemini.codegen.jooqpojogen.EntityClassGenerator;
import org.gemini.codegen.utiltiy.CodeGenUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.mockito.MockedStatic;
import org.mockito.Mockito;
import org.mockito.invocation.InvocationOnMock;

import java.io.File;
import java.util.HashMap;
import java.util.Map;


public class PojoValidatorTest {

    PojoValidator pojoValidator = new PojoValidator();
    static MockedStatic<CodeGenUtils> theMock;

    Map<String, String> result = new HashMap<>();

    @Before
    public void setUp() {
        try {
            EntityClassGenerator.EntityGenerator("src/test/resources/testScript.sql", "entity", "src/test/resources/");
        } catch (Exception e) {
            throw new RuntimeException("Exception in PojoValidatorTestClass() :{}", e);
        }
        result.put("outerDirectoryPath", "src/test/resources");
        result.put("outerScriptDirectoryPath", "src/test/resources/testScript.sql");
        result.put("dialect", "");
        result.put("driverClassName", "");
        result.put("username", "");
        result.put("password", "");
        result.put("url", "");
        theMock = Mockito.mockStatic(CodeGenUtils.class, InvocationOnMock::callRealMethod);
    }


    @After
    public void close() {
        theMock.close();
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

        theMock.when(() -> CodeGenUtils.createMap()).thenReturn(result);
        int actual = pojoValidator.countTables();
        int expected = 3;
        Assertions.assertEquals(expected, actual);
    }
    @Test
    public void negTestCountTables() {
        result.put("outerScriptDirectoryPath", "src/test/resources/testScript1.sql");
        theMock.when(() -> CodeGenUtils.createMap()).thenReturn(result);
        try {
            pojoValidator.countTables();
        } catch (Exception e) {
            Assertions.assertEquals(e.getMessage(), "Exception in validateJsonFiles method: src/test/resources/Handler/jsonFiles/Book.json");
        }
    }


    @Test
    public void testValidatePojoClassContent() {
        File file = new File("src/test/resources/Validator/DemoValidatepojoclasscontent.txt");
        Assertions.assertTrue(pojoValidator.validatePojoClassContent(file));
    }

    @Test
    public void negTestValidatePojoClassContent() {
        File file = new File("src/test/resources/Validator/DemoNegValidatePojoClassContent.txt");
        Assertions.assertFalse(pojoValidator.validatePojoClassContent(file));
    }


    @Test
    public void testValidatePojoClasses() {
        theMock.when(() -> CodeGenUtils.createMap()).thenReturn(result);
        boolean actual = pojoValidator.validatePojoClasses(new File("src/test/resources/entity/demo/tables/pojos").listFiles());
        Assertions.assertTrue(actual);
    }

    @Test
    public void negTestValidatePojoClasses() {
        File file = new File("src/test/resources/entity/demo/tables/pojos/Author.java");
        file.delete();
        boolean actual = pojoValidator.validatePojoClasses(new File("src/test/resources/entity/demo/tables/pojos").listFiles());
        Assertions.assertFalse(actual);
    }


}
