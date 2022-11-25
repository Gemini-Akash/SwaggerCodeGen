package Validator;

import org.gemini.codegen.apicodegen.validator.JsonValidator;
import org.gemini.codegen.utiltiy.CodeGenUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.mockito.MockedStatic;
import org.mockito.Mockito;
import org.mockito.invocation.InvocationOnMock;

import java.util.Arrays;


public class JsonValidatorTest {
    static MockedStatic<CodeGenUtils> theMock;
    JsonValidator jsonValidator = new JsonValidator();

    @Before
    public void setUp() {
        theMock = Mockito.mockStatic(CodeGenUtils.class, InvocationOnMock::callRealMethod);
        theMock.when(() -> CodeGenUtils.generateDirectoryPath()).thenReturn("src/test/resources/Handler");
    }

    @After
    public void close() {
        theMock.close();
    }

    @Test(expected = RuntimeException.class)
    public void validateJsonFiles() {
        jsonValidator.validateJsonFiles(Arrays.asList("Author"));
    }

    @Test(expected = NullPointerException.class)
    public void negValidateJsonFiles() {
        jsonValidator.validateJsonFiles(Arrays.asList("Book"));
    }

    @Test
    public void negInputValidateJsonFiles() {
        try {
            jsonValidator.validateJsonFiles(Arrays.asList("Language"));
        } catch (Exception e) {
            Assertions.assertEquals("Exception in validateJsonFiles method: src/test/resources/Handler/jsonFiles/Book.json",e.getMessage());
        }
    }


}
