import org.codegen.ApiCodeGen.templateHandler.Handlebar;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;
import java.io.IOException;

import static junit.framework.TestCase.assertTrue;

public class HandlebarTests {

    @Test
    public void testCaseForSwaggerJson() {
        File file = new File("D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\jsonFiles\\SwaggerJson.json");
        assertTrue(file.exists());
    }

    @Test
    public void testHandlebarSwaggerYamlFile() throws IOException {
         Handlebar.SwaggerYaml();
         File file = new File("src/main/resources/SwaggerYaml.yml");
        Assertions.assertTrue(file.exists(),"SwaggerYaml.yml is not generated");
    }

    @Test
    public void testHandlebarSwaggerTemplate(){
        File file = new File("src/main/resources/HandlebarTemplates/swaggerTemplate.hbs");
        Assertions.assertTrue(file.exists(),"Swagger Template file do not exists");

    }
}
