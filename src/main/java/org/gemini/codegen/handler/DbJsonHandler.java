package org.gemini.codegen.handler;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileWriter;

public final class DbJsonHandler {
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
    public void createDbJson(final File filePath, final String url, final String dialect, final String username, final String password, final String driverClassName) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("url", url);
        jsonObject.put("dialect", dialect);
        jsonObject.put("username", username);
        jsonObject.put("driverClassName", driverClassName);
        jsonObject.put("password", password);
        LOG.info("Required applicationPropertiesJson: {}", jsonObject);
        try (FileWriter fileWriter = new FileWriter(filePath)) {
            fileWriter.write(jsonObject.toJSONString());
        } catch (Exception e) {
            LOG.error("Exception in  writing JSON file / createDbJson(): {}", e.getMessage());
        }
    }
}
