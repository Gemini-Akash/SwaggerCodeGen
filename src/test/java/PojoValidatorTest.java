import org.codegen.ApiCodeGen.Validator.pojoValidator;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;


public class PojoValidatorTest {

    private static final Logger log =  LoggerFactory.getLogger(PojoValidatorTest.class);
    @Test
    public void testCountClasses(){

        int expectedPojosCount = pojoValidator.countClasses();
        int actualPojosCount = 5;
//        Assertions.assertTrue(expectedPojoCount == actualPojosCount,"Equal Number of pojos are not generated");
        Assertions.assertEquals(expectedPojosCount,actualPojosCount,"Equal No of Pojos are not generated");

    }
    @Test
    public void testValidatePojoClasses(){

        File file = new File("C:\\Users\\ad.shrivastava\\Desktop\\POJOS\\entity\\tables\\pojos");
        Assertions.assertTrue(file.isDirectory(),"Directory Path is not valid ");

    }

    @Test
    public void testValidatePojoClassContent(){

        Boolean expectedResult = true;
        File[] files = new File("C:\\Users\\ad.shrivastava\\Desktop\\POJOS\\entity\\tables\\pojos").listFiles();
        for(File filePath: files){
            Boolean actualResult = pojoValidator.validatePojoClassContent(filePath);
            Assertions.assertEquals(expectedResult,actualResult,"file is not written properly");
        }
    }



}