package Validator;


import org.gemini.codegen.apicodegen.validator.PathValidator;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;


public class PathValidatorTest {

    PathValidator pathValidator=new PathValidator();
    @Test
    public void isValidPath() {
        boolean expectedValue = true;
        boolean actualValue = pathValidator.isValidPath("src/test/resources/Validator/DemoNegValidatePojoClassContent.txt");
        Assertions.assertEquals(expectedValue, actualValue, "Invalid File Path");
    }

    @Test
    public void testCaseForIsValidateNeg() {
        Assertions.assertFalse(pathValidator.isValidPath("src/test/java1/abc"));
    }
}
