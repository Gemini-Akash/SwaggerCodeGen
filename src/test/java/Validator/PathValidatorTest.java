package Validator;

import org.gemini.codegen.ApiCodeGen.Validator.PathValidator;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import static org.junit.Assert.assertFalse;

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
        assertFalse(pathValidator.isValidPath("src/test/java1/abc"));
    }
}
