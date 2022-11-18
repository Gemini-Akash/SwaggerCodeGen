package Validator;

import org.gemini.codegen.ApiCodeGen.Validator.PathValidator;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;


public class PathValidatorTest {

    @Test
    public void isValidPath(){
        boolean expectedValue = true;
        boolean actualValue =  PathValidator.isValidPath("src/test/resources/Validator/DemoNegValidatePojoClassContent.txt");
        Assertions.assertEquals(expectedValue,actualValue,"Invalid File Path");
    }

    @Test
    public void testCaseForIsValidateNeg(){
        PathValidator pathValidator =new PathValidator();
        Assertions.assertFalse(pathValidator.isValidPath("src/test/java1/abc"));
    }
}
