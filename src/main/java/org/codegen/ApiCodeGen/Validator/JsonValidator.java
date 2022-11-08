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
    public static void validateJsonFiles(List<String> classNames){
        for (String className:classNames) {
            try {
                FileReader fileReader=new FileReader(DirectoryHandler.generateDirectoryPath()+"\\jsonFiles\\"+ className + ".json");
                JSONObject jsonObject = (JSONObject) new JSONParser().parse(fileReader);
                if (jsonObject.get("primaryKeys").equals("{[]}")){
                    log.info("Empty Jso File: {}.json",className);
                    throw new RuntimeException("Json File not created.");
                }
            }
            catch (Exception e){
                log.info("{}",e.getMessage());
            }
        }
    }
}
