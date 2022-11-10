import org.codegen.Handler.TemplateHandler;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;
import java.io.FileNotFoundException;

import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class HandlebarTests {

//    @Rule
//
//    public ExpectedException thrown = ExpectedException.none();

    @Test
    public void testCaseForSwaggerJson() {
        File file = new File("D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\jsonFiles\\SwaggerJson.json");
        Assertions.assertTrue(file.exists(), "File Not present in directory");
    }

    @Test
    public void testCaseForSwaggerJsonFileNotFound() {
        File file = new File("D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\jsonFiles\\SwaggerJson1.json");
        System.out.println(file);
//        thrown.expect(FileNotFoundException.class);
//        thrown.expectMessage(("the required file do not exist in the directory"));
        boolean expected = false;
        boolean actual = file.exists();
        Assertions.assertEquals(expected, actual);
    }

    @Test
    public void testCaseForFIleNotFound() {
//        Path file = Paths.get("D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\jsonFiles\\SwaggerJson1.json");
//            if (file.exists() == false) {
//                throw new FileNotFoundException();
//            }

        Throwable exception = assertThrows(FileNotFoundException.class, () -> {
            File file = new File("D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\jsonFiles\\SwaggerJson1.json");
            if (file.exists() == false) {
                throw new FileNotFoundException("File Not Found");
            }
        });
        assertEquals("File Not Found", exception.getMessage());
    }

//    @Test
//    public void testCaseFileNotFound(){
//        try {
//            File file = new File("D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\jsonFiles\\SwaggerJson1.json");
//           file.exists();
//           fail("Expected file Not found ");
//        }
//        catch (FileNotFoundException e){
//            assertThat(e.getMessage(),is("file not exists"));
//        }
//    }
//    @Test
//    public void testHandlebarSwaggerYamlFile() throws IOException {
//         Handlebar.SwaggerYaml();
//         File file = new File("src/main/resources/SwaggerYaml.yml");
//        Assertions.assertTrue(file.exists(),"SwaggerYaml.yml is not generated");
//    }
//    @Test
//    public void testForSwaggerYamlFileNotFound()  {
//        File file = new File("src/main/resources/SwaggerYamll.yml");
//        boolean expected = false;
//        boolean actual = file.exists();
//        Assertions.assertEquals(expected,actual);
//    }

//    @Test (expected = FileNotFoundException.class)
//    public void testHandlebarSwaggerYamlFileNotFound(){
//        File file = new File("src/main/resources/SwaggerYaml.yml");
//        Assertions.assertTrue(file.exists(),"SwaggerYaml.yml is not generated");
//    }

//    @Test
//    public void testHandlebarSwaggerTemplate(){
//        File file = new File("src/main/resources/HandlebarTemplates/swaggerTemplate.hbs");
//        Assertions.assertTrue(file.exists(),"Swagger Template file do not exists");
//    }
//    @Test
//    public void testForSwaggerTemplateNotFound()  {
//        File file = new File("src/main/resources/HandlebarTemplates/swaggerrTemplate.hbs");
//        boolean expected = false;
//        boolean actual = file.exists();
//        Assertions.assertEquals(expected,actual);
//    }

        @Test
        public void testGenerateClassFromTemplates(){
            TemplateHandler.generateClassFromTemplates("D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\testTemplate\\DemoTemplateForTest","D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\Handler\\DemoClassForTest.java","D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\testTemplate\\testJson.json");
            File file = new File("D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\testTemplate\\DemoTemplateForTest.java");
            Assertions.assertTrue(file.exists(),"Error in generating file from specified template");
        }

        @Test
        public void testGenerateFileFromTemplate(){
        TemplateHandler.generateFileFromTemplate("HandlebarTemplates/Abc","D:\\Internal\\SwaggerCodeGen\\src\\test\\java\\Abc");
        File file = new File("src/test/java/abc");

        }







}