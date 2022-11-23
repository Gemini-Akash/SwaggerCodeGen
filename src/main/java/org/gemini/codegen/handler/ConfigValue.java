package org.gemini.codegen.handler;

import java.util.Map;

public final class ConfigValue {

    public static Map<String, String> createMap() {
        return Map.of("outerDirectoryPath", System.getProperty("directoryPath").replaceAll("[/\\\\]+", "/"),
                "outerScriptDirectoryPath", System.getProperty("scriptPath").replaceAll("[/\\\\]+", "/"),
                "dialect", System.getProperty("dialect"), "driverClassName", System.getProperty("driverClassName"),
                "username", System.getProperty("username"), "password", System.getProperty("password"),
                "url", System.getProperty("url"));

    }
}
