package utility;


import org.gemini.codegen.utiltiy.CodeGenUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.mockito.MockedStatic;
import org.mockito.Mockito;
import org.mockito.invocation.InvocationOnMock;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class CodeGenUtilsTest {
    static MockedStatic<CodeGenUtils> theMock;


    @Before
    public void setUp() {
        File file = new File("src/test/resources/Handler/Abc");
        if (!file.exists()) {
            file.mkdir();
        }

        Map<String, String> result = new HashMap<>();
        result.put("outerDirectoryPath", "src/test/resources");
        result.put("outerScriptDirectoryPath", "src/test/resources/testScript.sql");
        result.put("dialect", "");
        result.put("driverClassName", "");
        result.put("username", "");
        result.put("password", "");
        result.put("url", "");

        theMock = Mockito.mockStatic(CodeGenUtils.class, InvocationOnMock::callRealMethod);
        theMock.when(() -> CodeGenUtils.createMap()).thenReturn(result);
    }
    @After
    public void close() {
        theMock.close();
    }

    @Test
    public void testCreateDirectory() {
        String directoryPath = "src/test/resources/Handler/demoDirectory";
        CodeGenUtils.createDirectory(directoryPath);
        File file = new File(directoryPath);
        Assertions.assertTrue(file.exists());
    }

    @Test
    public void testGetScriptName() {
        String expected = "testScript";
        String actual = CodeGenUtils.getScriptName();
        Assertions.assertEquals(expected, actual);
    }

    @Test
    public void negTestGetScriptName() {
        String expected = "DummyScriptt";
        String actual = CodeGenUtils.getScriptName();
        Assertions.assertNotEquals(expected, actual);

    }
    @Test
    public void testGetSchemaName() {
        theMock.when(() -> CodeGenUtils.generateDirectoryPath()).thenReturn("src/test/resources/Handler");
        String expected = CodeGenUtils.getSchemaName();
        String actual = "ims";
        Assertions.assertEquals(expected, actual);
    }

    @Test
    public void negTestGetSchemaName() {

        theMock.when(() -> CodeGenUtils.generateDirectoryPath()).thenReturn("src/test/resources/Handler");
        String expected = CodeGenUtils.getSchemaName();
        String actual = "ims1";
        Assertions.assertNotEquals(expected, actual);

    }


    @Test
    public void testGenerateDirectoryPath() {

        StringBuilder path = new StringBuilder();
        path.setLength(0);
        path.append(CodeGenUtils.createMap().get("outerDirectoryPath"));
        path.append("/");
        path.append(CodeGenUtils.getScriptName());
        path.append("SpringBootApp/src/main/java/com/gemini/");
        path.append(CodeGenUtils.getScriptName());
        String expected = path.toString();
        String actual = CodeGenUtils.generateDirectoryPath();
        Assertions.assertEquals(expected, actual);

    }
}
