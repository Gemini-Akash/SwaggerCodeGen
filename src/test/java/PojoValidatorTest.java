import org.codegen.ApiCodeGen.Validator.PojoValidator;
//import org.codegen.ApiCodeGen.Validator.pojoValidator;
import org.codegen.Handler.DirectoryHandler;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PipedOutputStream;


public class PojoValidatorTest {

    private static final Logger log =  LoggerFactory.getLogger(PojoValidatorTest.class);
    @Test
    public void testCountClasses(){
        int expectedPojosCount = 3;
        int actualPojosCount = PojoValidator.countClasses();
        Assertions.assertEquals(expectedPojosCount,actualPojosCount,"Equal No of pojos are not generated");
    }
    @Test
    public void testValidatePojoClasses(){
//        File file = new File("C:\\Users\\ad.shrivastava\\Desktop\\POJOS\\entity\\tables\\pojos");
        File[] file = new File("src/test/resources/validatePojo").listFiles();
        Assertions.assertTrue(PojoValidator.validatePojoClasses(file));
    }
    @Test
    public void testValidatePojoClassContent(){
        Boolean expectedResult = true;
        File file = new File("src/test/resources/validatepojoclasscontent.txt");
            Assertions.assertTrue(PojoValidator.validatePojoClassContent(file));
    }
    @Test
    public void negTestValidatePojoClassContent(){
        File file = new File("src/test/resources/NegValidatePojoClassContent.txt");
        Assertions.assertFalse(PojoValidator.validatePojoClassContent(file));
    }



}
