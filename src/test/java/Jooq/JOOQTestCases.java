package Jooq;

import org.gemini.codegen.JOOQ.PojosGen.EntityClassGenerator;
import org.gemini.codegen.JOOQ.PojosGen.FileNotFoundException;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;

import static org.junit.Assert.assertEquals;


public class JOOQTestCases {

    @Test
    public void testEntityGenerator(){
        try {
            EntityClassGenerator.EntityGenerator("src/test/resources/Jooq/testScript.sql","entity","src/test/resources/Jooq/");
        } catch (Exception e) {
            throw new RuntimeException("Exception in testLoadClass() :{}",e);
        }
        File file = new File("src/test/resources/Jooq/entity/demo/tables/pojos/");
        Assertions.assertTrue(file.isDirectory());
    }

    @Test
    public void testCaseForScriptPath() {

        FileNotFoundException exception=Assertions.assertThrows(FileNotFoundException.class, () -> {
            EntityClassGenerator entityClassGen =new EntityClassGenerator();
            entityClassGen.EntityGenerator("src/main/resources/Scrpt.sql","Entity.Generated","D:\\JooqCodeGen\\src\\main\\java");
        });
        assertEquals("Script Not found", exception.message);
    }


    @Test
    public void testCaseForDirectoryPath() {

        FileNotFoundException exception=Assertions.assertThrows(FileNotFoundException.class, () -> {
            EntityClassGenerator entityClassGen =new EntityClassGenerator();
            entityClassGen.EntityGenerator("src/main/resources/Script.sql","Entity.Generated","D:\\JoGen\\src\\main\\java");
        });
        assertEquals("Directory Not found", exception.message);
    }


}