

import org.codegen.JOOQ.PojosGen.EntityClassGen;
import org.codegen.JOOQ.PojosGen.FileNotFoundException;
import org.codegen.JOOQ.PojosGen.PathValidator;
import org.junit.Test;
;

import static org.junit.Assert.*;
import static org.junit.Assert.assertThrows;

public class JOOQTestCases {


    @Test
    public void testCaseForIsValidate(){
        PathValidator pathValidator =new PathValidator();
        assertTrue(pathValidator.isValidPath("src/test/java/abc"));
    }


    @Test
    public void testCaseForIsValidateNeg(){
        PathValidator pathValidator =new PathValidator();
        assertFalse(pathValidator.isValidPath("src/test/java1/abc"));
    }


    @Test
    public void testCaseForScriptPath() {

        FileNotFoundException exception=assertThrows(FileNotFoundException.class, () -> {
            EntityClassGen entityClassGen =new EntityClassGen();
            entityClassGen.EntityGenerator("src/main/resources/Scrpt.sql","Entity.Generated","D:\\JooqCodeGen\\src\\main\\java");
        });
        assertEquals("Script Not found", exception.message);
    }


    @Test
    public void testCaseForDirectoryPath() {

        FileNotFoundException exception=assertThrows(FileNotFoundException.class, () -> {
            EntityClassGen entityClassGen =new EntityClassGen();
            entityClassGen.EntityGenerator("src/main/resources/Script.sql","Entity.Generated","D:\\JoGen\\src\\main\\java");
        });
        assertEquals("Directory Not found", exception.message);
    }


}