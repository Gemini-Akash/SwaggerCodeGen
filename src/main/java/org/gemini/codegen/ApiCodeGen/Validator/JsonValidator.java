package org.gemini.codegen.ApiCodeGen.Validator;

import org.gemini.codegen.Handler.DirectoryHandler;
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
    public static void validateJsonFiles(final List<String> classNames) {
        StringBuilder path = new StringBuilder();
        for (String className : classNames) {
            JSONObject jsonObject;
            FileReader fileReader = null;
            try {
                path.setLength(0);
                path.append(DirectoryHandler.generateDirectoryPath());
                path.append("/jsonFiles/");
                path.append(className);
                path.append(".json");
                fileReader = new FileReader(path.toString());
                jsonObject = (JSONObject) new JSONParser().parse(fileReader);
                if (jsonObject.get("primaryKeys").toString().equals("[]")) {
                    LOG.info("Empty Json File: {}.json", className);
                    throw new RuntimeException("Json File is not created.");
                }
            } catch (IOException | ParseException e) {
                LOG.info("Exception in validateJsonFiles method: {}", e.getMessage());
            }
            try{
                if(fileReader == null) {
                    throw new NullPointerException();
                }
            } catch ( NullPointerException e){
                LOG.error("Exception in  validateJsonFiles() / fileReader is null: {}", e.getMessage());
            }finally {
                try {
                    if(fileReader != null){
                        fileReader.close();
                    }
                } catch (IOException e) {
                    LOG.error("Exception in closing the file of validateJsonFiles() :{}", e.getMessage());
                }
            }
        }
    }
}
