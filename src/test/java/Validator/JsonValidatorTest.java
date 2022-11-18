package Validator;

import org.gemini.codegen.handler.DirectoryHandler;
import org.junit.Test;
import org.mockito.MockedStatic;
import org.mockito.Mockito;

public class JsonValidatorTest {

    @Test
    public void validateJsonFiles() {
        try (MockedStatic<DirectoryHandler> theMock = Mockito.mockStatic(DirectoryHandler.class)) {
            theMock.when(() -> DirectoryHandler.generateDirectoryPath())
                    .thenReturn("src/test/resources/Handler");

        }

    }

}
