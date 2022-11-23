package Jooq;


import org.gemini.codegen.jooqpojogen.EntityClassGenerator;
import org.gemini.codegen.jooqpojogen.FileNotFoundException;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;


public class JOOQTestCases {

    @Test
    public void testEntityGenerator() {
        try {
            EntityClassGenerator.EntityGenerator("src/test/resources/testScript.sql", "CustomClassLoader/entity", "src/test/resources/Jooq/");
        } catch (Exception e) {
            throw new RuntimeException("Exception in testLoadClass() :{}", e);
        }
        File file = new File("src/test/resources/Jooq/entity/demo/tables/pojos/");
        Assertions.assertTrue(file.isDirectory());
    }

    @Test
    public void testCaseForScriptPath() {

        FileNotFoundException exception = Assertions.assertThrows(FileNotFoundException.class, () -> {
            EntityClassGenerator entityClassGen = new EntityClassGenerator();
            entityClassGen.EntityGenerator("src/main/resources/Scrpt.sql", "Entity.Generated", "D:\\JooqCodeGen\\src\\main\\java");
        });
        Assertions.assertEquals("Script Not found", exception.message);
    }


    @Test
    public void testCaseForDirectoryPath() {

        FileNotFoundException exception = Assertions.assertThrows(FileNotFoundException.class, () -> {
            EntityClassGenerator entityClassGen = new EntityClassGenerator();
            entityClassGen.EntityGenerator("src/main/resources/Script.sql", "Entity.Generated", "D:\\JoGen\\src\\main\\java");
        });
        Assertions.assertEquals("Directory Not found", exception.message);
    }


}