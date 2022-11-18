package org.gemini.codegen.handler;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FilenameFilter;
import java.util.List;


public final class DirectoryHandler {

    private static final Logger LOG = LoggerFactory.getLogger(DirectoryHandler.class);

   public static String outerDirectoryPath= System.getProperty("directoryPath").replaceAll("[/\\\\]+","/");
   public static String outerScriptDirectoryPath=System.getProperty("scriptPath").replaceAll("[/\\\\]+","/");
//    public static String dialect=System.getProperty("dialect");
//    public static String url=System.getProperty("url");
//    public static String driverClassName=System.getProperty("driverClassName");
//    public static String username=System.getProperty("username");
//    public static String password=System.getProperty("password");

//    public static String outerDirectoryPath = "C:\\Users\\di.garg1\\Desktop\\Autogenerated".replaceAll("[/\\\\]+", "/");
//    public static String outerScriptDirectoryPath = "C:\\Users\\di.garg1\\Desktop\\MySql_Sripts\\DummyScript.sql".replaceAll("[/\\\\]+", "/");
    public static String dialect = "";
    public static String url = "";
    public static String driverClassName = "";
    public static String username = "";
    public static String password = "";

    public static String getOuterDirectoryPath() {
        return outerDirectoryPath;
    }

    public static void setOuterDirectoryPath(String outerDirectoryPath) {
        DirectoryHandler.outerDirectoryPath = outerDirectoryPath;
    }

    public static String getOuterScriptDirectoryPath() {
        return outerScriptDirectoryPath;
    }

    public static void setOuterScriptDirectoryPath(String outerScriptDirectoryPath) {
        DirectoryHandler.outerScriptDirectoryPath = outerScriptDirectoryPath;
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
        File scriptName = new File(outerScriptDirectoryPath);
        return scriptName.getName().replace(".sql", "");
    }

    /**
     * getSchemaName() method is used to get Schema name in script.
     *
     * @return schemaName
     */
    public static String getSchemaName() {
        File schemaName = new File(DirectoryHandler.generateDirectoryPath() + "/entity");
        String[] directories = schemaName.list(new FilenameFilter() {
            @Override
            public boolean accept(File current, String name) {
                return new File(current, name).isDirectory();
            }
        });
        try {
            if (directories[0] == null) {
                throw new NullPointerException("Script does not contain Schema Name.");
            }
        } catch (NullPointerException e) {
            LOG.error("Script does not contain Schema Name: {}", e.getMessage());
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
        path.append(outerDirectoryPath);
        path.append("/");
        path.append(getScriptName());
        path.append("SpringBootApp/src/main/java/com/gemini/");
        path.append(getScriptName());
        return path.toString();
    }

    /**
     * renameDirectory() method is used to rename a directory.
     *
     * @param filePath
     */
    public static void renameDirectory(final File filePath, final File renameFilePath) {
        if (filePath.renameTo(renameFilePath)) {
            LOG.info("File moved successfully");
        } else {
            LOG.info("Failed to move the file");
        }
    }


    /**
     * deleteDirectory() method is used to delete a directory.
     *
     * @param filePath
     */
    public static void deleteDirectory(final String filePath) {
        File file = new File(filePath);
        try {
            if (file.isDirectory()) {
                FileUtils.deleteDirectory(file);
                LOG.info("Directory deleted successfully : {}", file);
            } else {
                LOG.info("Directory does not exist");
            }
        } catch (Exception e) {
            LOG.info(e.getMessage(), e.getCause());
        }
    }

    /**
     * deleteFiles() method is used to delete files of a directory.
     *
     * @param filePath
     * @param classNames
     */
    public static void deleteFiles(final List<String> classNames, final String filePath) {
        StringBuilder path = new StringBuilder();
        for (String className : classNames) {
            path.setLength(0);
            path.append(filePath);
            path.append("/");
            path.append(className);
            path.append(".class");
            File file = new File(path.toString());
            if (file.exists()) {
                boolean result = file.delete();
                if (result) {
                    LOG.info("{}.class exits and deleted successfully", className);
                } else {
                    LOG.info("{}.class exits but not deleted", className);
                }

            } else {
                LOG.info("{}.class does not exist", className);
            }

        }
    }

}
