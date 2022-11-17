package org.gemini.codegen.Handler;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class DbJsonHandler {
    private static final Logger LOG = LoggerFactory.getLogger(DbJsonHandler.class);

    /**
     * createDbJson method is used for creating application.properties Json file.
     *
     * @param filePath
     * @param dialect
     * @param driverClassName
     * @param password
     * @param url
     * @param username
     */
    public static void createDbJson(final File filePath, final String url, final String dialect, final String username, final String password, final String driverClassName) {
        FileWriter fileWriter = null;
        try {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("url", url);
            jsonObject.put("dialect", dialect);
            jsonObject.put("username", username);
            jsonObject.put("driverClassName", driverClassName);
            jsonObject.put("password", password);
            LOG.info("Required applicationPropertiesJson: {}", jsonObject);
            fileWriter = new FileWriter(filePath);
            fileWriter.write(jsonObject.toJSONString());
        } catch (Exception e) {
            LOG.error("Exception in  writing JSON file / createDbJson(): {}", e.getMessage());
        }
        try{
            if( fileWriter == null) {
                throw new NullPointerException();
            }
        } catch ( NullPointerException e){
            LOG.error("Exception in   createDbJson() / fileWriter is null: {}", e.getMessage());
        }finally {
            try {
                if (fileWriter != null) {
                    fileWriter.close();
                }
            } catch (IOException e) {
                LOG.error("Exception in closing the file of createDbJson(): {}", e.getMessage());
            }
        }

 
    }
}
