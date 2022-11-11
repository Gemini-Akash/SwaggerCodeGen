package org.codegen.ApiCodeGen.Validator;

import org.apache.commons.io.FileUtils;
import org.codegen.Handler.DirectoryHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.nio.charset.Charset;

public class PojoValidator {

    private static final Logger log = LoggerFactory.getLogger(PojoValidator.class);

    /**
     * countTables() method is used for counting no. of tables in script.
     *
     * @return count
     */
    public static int countTables() {
        int count = 0;
        try {
            File f1 = new File(DirectoryHandler.outerScriptDirectoryPath);
            BufferedReader reader = new BufferedReader(new FileReader(f1));
            String line = reader.readLine();
            while (line != null) {
                if (line.contains("CREATE TABLE")) count++;
                line = reader.readLine();
            }
            reader.close();
        } catch (Exception e) {
            log.error("Exception in countTables {}", e.getMessage());
        }
        return count;
    }

    /**
     *validatePojoClassContent() method is used for validating a class is java file or not.
     *
     * @return boolean value
     */

    public static Boolean validatePojoClassContent(File filePath) {
        int count1 = 0, count2 = 0;
        File f1 = new File(String.valueOf(filePath));
        try {
            BufferedReader reader = new BufferedReader(new FileReader(f1));
            String line = reader.readLine();
            while (line != null) {
                if (line.contains("{")) count1++;
                if (line.contains("}")) count2++;
                line = reader.readLine();
            }
            reader.close();
        } catch (Exception e) {
            log.error("Exception in contentValidator {}", e.getMessage());
        }
        if (count1 == count2) {
            return true;
        } else {
            return false;
        }
    }

    /**
     *validatePojoClasses() method is used for validating all pojo classes are generated or not.
     *
     * @return boolean value
     */
    public static Boolean validatePojoClasses() {
        int count = 0,flag=0;
        File[] files = new File(DirectoryHandler.generateDirectoryPath()+"/entity/"+DirectoryHandler.getSchemaName()+"/tables/pojos").listFiles();
            if (files.length == countTables()) {
                for (File file : files) {
                    Boolean emptyFileCheck=null;
                    try {
                         emptyFileCheck = FileUtils.readFileToString(file, Charset.defaultCharset()).isEmpty();
                    }
                    catch (Exception e) {
                            log.error("Exception in pojoValidator {}", e.getMessage());
                    }
                    if (file.exists() && !emptyFileCheck && validatePojoClassContent(file) == true) {
                        count++;
                    }
                    else {
                        flag++;
                        if (flag==2) {
                            log.info("Time exceeds for running Code Generator.");
                            throw new RuntimeException("Time out of bound to run code generator.");
                        }
                        else {
                            validatePojoClasses();
                        }
                    }
                }
            }
        if (count == files.length) {
            log.info("<---------If block of pojoValidator()---------->");
            return true;
        } else {
            log.info("<-----------Else block of pojoValidator()--------->");
            return false;
        }

    }
}
