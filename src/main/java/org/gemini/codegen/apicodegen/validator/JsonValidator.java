package org.gemini.codegen.apicodegen.validator;

import org.gemini.codegen.apicodegen.utiltiy.CodeGenUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.FileReader;
import java.io.IOException;
import java.util.List;

public class JsonValidator {
    private static final Logger LOG = LoggerFactory.getLogger(JsonValidator.class);

    /**
     * validateJsonFiles method is used for validating generated Json Files.
     *
     * @param classNames
     */
    public void validateJsonFiles(final List<String> classNames) {
        StringBuilder path = new StringBuilder();
        for (String className : classNames) {
            JSONObject jsonObject;
                path.setLength(0);
                path.append(CodeGenUtils.generateDirectoryPath());
                path.append("/jsonFiles/");
                path.append(className);
                path.append(".json");
            try(FileReader fileReader = new FileReader(path.toString())) {
                jsonObject = (JSONObject) new JSONParser().parse(fileReader);
                if (jsonObject.get("primaryKeys").toString().equals("[]")) {
                    LOG.info("Empty Json File: {}.json", className);
                    throw new RuntimeException("Json File is not created.");
                }
            } catch (IOException | ParseException e) {
                LOG.info("Exception in validateJsonFiles method: {}", e.getMessage());
            }
        }
    }
}
