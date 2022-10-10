package org.codegen.ApiCodeGen.Validator;

import org.apache.commons.io.FileUtils;
import org.codegen.Handler.DirectoryHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.nio.charset.Charset;

public class pojoValidator {

    private static final Logger log = LoggerFactory.getLogger(pojoValidator.class);

    public static int countClasses() {
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
            log.error("Exception in countClasses {}", e.getMessage());
        }
        return count;
    }

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
            System.out.println("count1: " + count1 + " count2: " + count2 + " filename: " + f1.getName());
            return true;
        } else {
            return false;
        }
    }

    public static Boolean validatePojoClasses() {
        int count = 0;
        File[] files = new File(DirectoryHandler.generateDirectoryPath()+"\\entity\\"+DirectoryHandler.getSchemaName()+"\\tables\\pojos").listFiles();
        try {
            if (files.length == countClasses()) {
                for (File file : files) {
                    if (file.exists() && !(FileUtils.readFileToString(file, Charset.defaultCharset()).isEmpty()) && validatePojoClassContent(file) == true) {
                        count++;
                    } else {
                        validatePojoClasses();
                    }
                }
            }
        } catch (Exception e) {
            log.error("Exception in pojoValidator {}", e.getMessage());
        }
        if (count == files.length) {
            System.out.println("Hi I am in if statement of pojoValidator()");
            return true;
        } else {
            System.out.println("Hi I am in else statement of pojoValidator()");
            return false;
        }

    }
}
