import org.codegen.ApiCodeGen.templateHandler.Handlebar;
import org.json.simple.parser.ParseException;
import org.junit.Test;

import java.io.File;
import java.io.IOException;

import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertEquals;

public class HandlebarTests {



    @Test
    public void testCaseForJsonFilePresent() {
        File file = new File("D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\jsonFiles\\SwaggerJson.json");
        assertTrue(file.exists());
    }

    @Test
    public void testHandlebarJsonParsing() throws IOException, ParseException {

        String dummyPath = "D:\\Internal\\SwaggerCodeGen\\src\\main\\resources\\SwaggerYaml.yml";

        String realPath = Handlebar.SwaggerYaml();
//		File f = new File(dummyPath);
//		Assertions.assertTrue(f.exists());
//		System.out.println(f.exists());
        assertEquals(dummyPath,realPath,"Error in path");

    }
}
