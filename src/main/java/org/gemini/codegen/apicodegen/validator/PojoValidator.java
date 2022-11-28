package org.gemini.codegen.apicodegen.validator;

import org.apache.commons.io.FileUtils;

import org.gemini.codegen.apicodegen.utiltiy.CodeGenUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.Charset;

public final class PojoValidator {

    private static final Logger LOG = LoggerFactory.getLogger(PojoValidator.class);
    static int recursionCount = 0;

    /**
     * countTables() method is used for counting no. of tables in script
     *
     * @return count
     */
    private int countTables() {
        int count = 0;
        try(FileReader fileReader = new FileReader(CodeGenUtils.createMap().get("outerScriptDirectoryPath"));
            BufferedReader  bufferedReader = new BufferedReader(fileReader)) {
            String line = bufferedReader.readLine();
            while (line != null) {
                if (line.contains("CREATE TABLE") || line.contains("Create Table") || line.contains("create table")) {
                    count++;
                }
                line = bufferedReader.readLine();
            }

        } catch (Exception e) {
            LOG.error("Exception in countTables(): {}", e.getMessage());
        }
        return count;
    }

    /**
     * validatePojoClassContent() method is used for validating a class is java file or not.
     *
     * @return boolean value
     */

    private boolean validatePojoClassContent(final File filePath) {
        int leftCurlyBracesCount = 0;
        int rightCurlyBracesCount = 0;
        try(FileReader fileReader = new FileReader(filePath);
        BufferedReader bufferedReader = new BufferedReader(fileReader)) {
            String line = bufferedReader.readLine();
            while (line != null) {
                if (line.contains("{")) {
                    leftCurlyBracesCount++;
                }
                if (line.contains("}")) {
                    rightCurlyBracesCount++;
                }
                line = bufferedReader.readLine();
            }

        } catch (Exception e) {
            LOG.error("Exception in validatePojoClassContent(): {}", e.getMessage());
        }
        return leftCurlyBracesCount == rightCurlyBracesCount;
    }

    /**
     * validatePojoClasses() method is used for validating all pojo classes are generated or not.
     *
     * @return boolean value
     */
    public  boolean validatePojoClasses(final File[] files) {
        int count = 0;
        if (files.length == countTables()) {
            for (File file : files) {
                Boolean emptyFileCheck = null;
                try {
                    emptyFileCheck = FileUtils.readFileToString(file, Charset.defaultCharset()).isEmpty();
                    if (file.exists() && !emptyFileCheck && validatePojoClassContent(file)) {
                        count++;
                    } else {
                        recursionCount++;
                        if (recursionCount == 2) {
                            LOG.info("Time exceeds for running Code Generator.");
                            throw new RuntimeException("Time out of bound to run code generator.");
                        } else {
                            validatePojoClasses(files);
                        }
                    }
                } catch (IOException e) {
                    LOG.error("Exception in validatePojoClasses(): {}", e.getMessage());
                }

            }
        }
        if (count == files.length) {
            LOG.info("<---------If block of pojoValidator()---------->");
            return true;
        } else {
            LOG.info("<-----------Else block of pojoValidator()--------->");
            return false;
        }

    }
}
