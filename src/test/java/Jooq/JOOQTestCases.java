package Jooq;

import org.apache.commons.io.FileUtils;
import org.gemini.codegen.jooqpojogen.EntityClassGenerator;
import org.gemini.codegen.jooqpojogen.FileNotFoundException;
import org.junit.After;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.io.File;


public class JOOQTestCases {

    @After
    public void cleanUpFiles() {
        String path = "src/test/resources/Jooq/entity";
        File file = new File(path);
        try {
            if (file.isDirectory()) {
                FileUtils.deleteDirectory(file);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testEntityGenerator() {
        try {
            EntityClassGenerator.EntityGenerator("src/test/resources/testScript.sql", "entity", "src/test/resources/Jooq/");
        } catch (Exception e) {
            throw new RuntimeException("Exception in testLoadClass() :{}", e);
        }
        File file = new File("src/test/resources/Jooq/entity/demo/tables/pojos/");
        Assertions.assertTrue(file.isDirectory());
    }

    @Test(expected = FileNotFoundException.class)
    public void testCaseForScriptPath() throws Exception {
        EntityClassGenerator.EntityGenerator("src/main/resources/testScript1.sql", "entity", "src/test/resources/Jooq/");

    }


    @Test(expected = FileNotFoundException.class)
    public void testCaseForDirectoryPath() throws Exception {
        EntityClassGenerator.EntityGenerator("src/main/resources/testScript.sql", "entity", "src/test/resources/Jooq1/");
    }


}