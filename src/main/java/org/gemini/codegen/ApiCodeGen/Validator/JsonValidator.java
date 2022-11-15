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
    static StringBuilder path=new StringBuilder();

    /**
     * validateJsonFiles method is used for validating generated Json Files.
     *
     * @param classNames
     */
    public static void validateJsonFiles(List<String> classNames) {
        for (String className:classNames) {
            JSONObject jsonObject;
            FileReader fileReader=null;
            try {
                path.setLength(0);
                path.append(DirectoryHandler.generateDirectoryPath());
                path.append("/jsonFiles/");
                path.append(className);
                path.append(".json");
                fileReader=new FileReader(path.toString());
                jsonObject= (JSONObject) new JSONParser().parse(fileReader);
                if (jsonObject.get("primaryKeys").toString().equals("[]")){
                    LOG.info("Empty Json File: {}.json",className);
                    throw new RuntimeException("Json File is not created.");
                }
            }
            catch (IOException | ParseException e){
                 LOG.info("Exception in validateJsonFiles method: {}",e.getMessage());
            }
            finally {
                try {
                    fileReader.close();
                }
                catch (IOException e) {
                    LOG.error("Exception in closing the file of validateJsonFiles() :{}", e.getMessage());
                }
            }
        }
    }
}
