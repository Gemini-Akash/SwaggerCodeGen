package Validator;

import org.gemini.codegen.utiltiy.CodeGenUtils;
import org.junit.Test;
import org.mockito.MockedStatic;
import org.mockito.Mockito;

public class JsonValidatorTest {

    @Test
    public void validateJsonFiles() {
        try (MockedStatic<CodeGenUtils> theMock = Mockito.mockStatic(CodeGenUtils.class)) {
            theMock.when(() -> CodeGenUtils.generateDirectoryPath()).thenReturn("src/test/resources/Handler");
        }

    }

}
