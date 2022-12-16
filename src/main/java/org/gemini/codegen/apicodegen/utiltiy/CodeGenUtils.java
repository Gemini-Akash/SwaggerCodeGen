package org.gemini.codegen.apicodegen.utiltiy;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.util.Map;

public class CodeGenUtils {
    private static final Logger LOG = LoggerFactory.getLogger(CodeGenUtils.class);

    /**
     * createMap() method is used to create new configuration Map.
     *
     * @return Map<String,String>
     */
    public static Map<String, String> createMap() {
//        return Map.of("outerDirectoryPath", System.getProperty("directoryPath").replaceAll("[/\\\\]+", "/"),
//                "outerScriptDirectoryPath", System.getProperty("scriptPath").replaceAll("[/\\\\]+", "/"),
//                "dialect", System.getProperty("dialect"), "driverClassName", System.getProperty("driverClassName"),
//                "username", System.getProperty("username"), "password", System.getProperty("password"),
//                "url", System.getProperty("url"));
        return Map.of("outerDirectoryPath","C:\\2Nov2022\\CrudApiCodeGen".replaceAll("[/\\\\]+", "/"),
                "outerScriptDirectoryPath", "C:\\2Nov2022\\ims.sql".replaceAll("[/\\\\]+", "/"),
                "dialect", "", "driverClassName", "",
                "username", "", "password", "",
                "url","");
    }

    /**
     * createDirectory() method is used to create new directory.
     *
     * @param directoryPath
     */
    public static void createDirectory(final String directoryPath) {
        File file = new File(directoryPath);
        if (file.isDirectory()) {
            LOG.info("Directory already exists");
        } else {
            file.mkdirs();
            LOG.info("Directory created---> {}", directoryPath);
        }
    }

    /**
     * getScriptName() method is used to get script name.
     *
     * @return scriptName
     */
    public static String getScriptName() {
        File scriptName = new File(CodeGenUtils.createMap().get("outerScriptDirectoryPath"));
        return scriptName.getName().replace(".sql", "");
    }


    /**
     * getSchemaName() method is used to get Schema name in script.
     *
     * @return schemaName
     */
    public static String getSchemaName() {
        File schemaName = new File(CodeGenUtils.generateDirectoryPath() + "/entity");
        String[] directories = schemaName.list(new FilenameFilter() {
            @Override
            public boolean accept(File current, String name) {
                return new File(current, name).isDirectory();
            }
        });
        if (directories[0] == null) {
                throw new NullPointerException("Script does not contain Schema name.");
        }
        return directories[0];
    }

    /**
     * generateDirectoryPath() method is used to rename a directory.
     *
     * @return generateDirectoryPath
     */
    public static String generateDirectoryPath() {
        StringBuilder path = new StringBuilder();
        path.append(CodeGenUtils.createMap().get("outerDirectoryPath"));
        path.append("/");
        path.append(getScriptName());
        path.append("SpringBootApp/src/main/java/com/gemini/");
        path.append(getScriptName());
        return path.toString();
    }

    public static boolean checksFileContent(File existingFilePath,File realFilePath) throws IOException {

        Reader reader1 = new BufferedReader(new FileReader(existingFilePath));
        Reader reader2 = new BufferedReader(new FileReader(realFilePath));

        return IOUtils.contentEqualsIgnoreEOL(reader1, reader2);


    }

}
