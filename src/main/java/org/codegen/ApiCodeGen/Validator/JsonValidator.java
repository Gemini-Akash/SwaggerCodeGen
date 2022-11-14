package org.codegen.ApiCodeGen.Validator;

import org.codegen.Handler.DirectoryHandler;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.FileReader;
import java.util.List;

public class JsonValidator {
    private static final Logger log = LoggerFactory.getLogger(JsonValidator.class);

    /**
     * validateJsonFiles method is used for validating generated Json Files.
     *
     * @param classNames
     */
    public static void validateJsonFiles(List<String> classNames){
        for (String className:classNames) {
            JSONObject jsonObject=null;
            FileReader fileReader;
            try {
                fileReader=new FileReader(DirectoryHandler.generateDirectoryPath()+"/jsonFiles/"+ className + ".json");
                jsonObject= (JSONObject) new JSONParser().parse(fileReader);
                fileReader.close();
            }
            catch (Exception e){
                 log.info("Exception in validateJsonFiles method: {}",e.getMessage());
            }
            if (jsonObject.get("primaryKeys").toString().equals("[]")){
                log.info("Empty Json File: {}.json",className);
                throw new RuntimeException("Json File is not created.");
            }
        }
    }
}
