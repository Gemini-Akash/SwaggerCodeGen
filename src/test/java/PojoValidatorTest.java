import org.codegen.ApiCodeGen.Validator.PojoValidator;
//import org.codegen.ApiCodeGen.Validator.pojoValidator;
import org.codegen.Handler.DirectoryHandler;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileNotFoundException;


public class PojoValidatorTest {

    private static final Logger log =  LoggerFactory.getLogger(PojoValidatorTest.class);
    @Test
    public void testCountClasses(){

        int expectedPojosCount = PojoValidator.countClasses();
        int actualPojosCount = 5;
//        Assertions.assertTrue(expectedPojoCount == actualPojosCount,"Equal Number of pojos are not generated");
        Assertions.assertEquals(expectedPojosCount,actualPojosCount,"Equal No of pojos are not generated");
    }
    @Test
    public void testValidatePojoClasses(){
//        File file = new File("C:\\Users\\ad.shrivastava\\Desktop\\POJOS\\entity\\tables\\pojos");
        File file = new File(DirectoryHandler.generateDirectoryPath()+"\\entity\\tables\\pojos");
        Assertions.assertTrue(file.isDirectory(),"Directory Path is not valid ");
    }
    @Test(expected = FileNotFoundException.class)
   public void testCaseIfDirectoryNotFound() throws FileNotFoundException {
       File file = new File("C:\\Users\\ad.shrivastava\\Desktop\\POJOS\\entity\\tables\\pojoss");
       if (file.isDirectory() == false) {
           throw new FileNotFoundException();
       }
   }
    @Test
    public void testValidatePojoClassContent(){
        Boolean expectedResult = true;
//        File[] files = new File("C:\\Users\\ad.shrivastava\\Desktop\\POJOS\\entity\\tables\\pojos").listFiles();
        File[] files = new File(DirectoryHandler.generateDirectoryPath()+"\\entity\\tables\\pojos").listFiles();
        for(File filePath: files){
            Boolean actualResult = PojoValidator.validatePojoClassContent(filePath);
            Assertions.assertEquals(expectedResult,actualResult,"file is not written properly");
        }
    }



}
