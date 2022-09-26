import org.codegen.ApiCodeGen.templateHandler.Handlebar;
import org.junit.Rule;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.function.Executable;
import org.junit.rules.ExpectedException;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class HandlebarTests {

//    @Rule
//
//    public ExpectedException thrown = ExpectedException.none();

    @Test
    public void testCaseForSwaggerJson() {
        File file = new File("D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\jsonFiles\\SwaggerJson.json");
        Assertions.assertTrue(file.exists(),"File Not present in directory");
    }
    @Test
    public void testCaseForSwaggerJsonFileNotFound()  {
        File file = new File("D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\jsonFiles\\SwaggerJson1.json");
//        thrown.expect(FileNotFoundException.class);
//        thrown.expectMessage(("the required file do not exist in the directory"));
        boolean expected = false;
        boolean actual = file.exists();
        Assertions.assertEquals(expected,actual);
    }
    @Test (expected = FileNotFoundException.class)
    public void testCaseForFIleNotFound() throws FileNotFoundException {
        File file = new File("D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\jsonFiles\\SwaggerJson1.json");
            if (file.exists() == false) {
                throw new FileNotFoundException();
            }
    }
    @Test
    public void testHandlebarSwaggerYamlFile() throws IOException {
         Handlebar.SwaggerYaml();
         File file = new File("src/main/resources/SwaggerYaml.yml");
        Assertions.assertTrue(file.exists(),"SwaggerYaml.yml is not generated");
    }
    @Test
    public void testForSwaggerYamlFileNotFound()  {
        File file = new File("src/main/resources/SwaggerYamll.yml");
        boolean expected = false;
        boolean actual = file.exists();
        Assertions.assertEquals(expected,actual);
    }

//    @Test (expected = FileNotFoundException.class)
//    public void testHandlebarSwaggerYamlFileNotFound(){
//        File file = new File("src/main/resources/SwaggerYaml.yml");
//        Assertions.assertTrue(file.exists(),"SwaggerYaml.yml is not generated");
//    }

    @Test
    public void testHandlebarSwaggerTemplate(){
        File file = new File("src/main/resources/HandlebarTemplates/swaggerTemplate.hbs");
        Assertions.assertTrue(file.exists(),"Swagger Template file do not exists");
    }
    @Test
    public void testForSwaggerTemplateNotFound()  {
        File file = new File("src/main/resources/HandlebarTemplates/swaggerrTemplate.hbs");
        boolean expected = false;
        boolean actual = file.exists();
        Assertions.assertEquals(expected,actual);
    }


}
