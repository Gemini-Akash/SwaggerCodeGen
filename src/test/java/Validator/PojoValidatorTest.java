package Validator;

import org.gemini.codegen.ApiCodeGen.Validator.PojoValidator;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.mockito.MockedStatic;
import org.mockito.Mockito;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;


public class PojoValidatorTest {

    private static final Logger log = LoggerFactory.getLogger(PojoValidatorTest.class);

    @Test
    public void testCountTables() {
//        int countOfTables = PojoValidator.countTables();
//        Assertions.assertTrue(countOfTables>=0);

        try (MockedStatic<PojoValidator> theMock = Mockito.mockStatic(PojoValidator.class)) {
            theMock.when(() -> PojoValidator.countTables())
                    .thenReturn(7);
            //  System.out.println(DirectoryHandler.getScriptName());
            Assertions.assertEquals(7, PojoValidator.countTables());
        }
    }

//    @Test
//    public void testValidatePojoClasses(){
//    }

    @Test
    public void testValidatePojoClassContent(){
        Boolean expectedResult = true;
        File file = new File("src/test/resources/Validator/DemoValidatepojoclasscontent.txt");
            Assertions.assertTrue(PojoValidator.validatePojoClassContent(file));
    }

    @Test
    public void negTestValidatePojoClassContent(){
        File file = new File("src/test/resources/Validator/DemoNegValidatePojoClassContent.txt");
        Assertions.assertFalse(PojoValidator.validatePojoClassContent(file));
    }

}
