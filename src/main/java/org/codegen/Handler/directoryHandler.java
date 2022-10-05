package org.codegen.Handler;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.File;
import java.io.IOException;
import java.util.List;

public class directoryHandler {
    private static final Logger log = LoggerFactory.getLogger(directoryHandler.class);
   public static String outerDirectoryPath="C:\\Users\\di.garg1\\Desktop\\Autogenerated";
   public static String outerScriptDirectoryPath="C:\\Users\\di.garg1\\Desktop\\MySql_Sripts\\DummyScript.sql";
    public static void directoryCreation(String directoryPath)
    {
        File file = new File(directoryPath);
        if(file.isDirectory())
            log.info("Directory already exists");
        else {
            file.mkdirs();
            log.info("Directory created--->"+directoryPath);
        }
    }
    public static String getScriptName()
    {
        File scriptName= new File(outerScriptDirectoryPath);
        log.info("Fetching Script name");
        return scriptName.getName().replace(".sql","");
    }

    public static String generatedDirectoryPath()
    {
        log.info("Generated outer Directory Path");
        return outerDirectoryPath+"\\src\\main\\java\\com\\gemini\\"+getScriptName();
    }

    public static void renameDirectory(String filePath ){
        File file = new File(filePath);
        if(file.renameTo
                (new File(directoryHandler.generatedDirectoryPath()+"\\entity"))) {
            log.info("File moved successfully");
        }
        else {
            log.info("Failed to move the file");
        }
    }

    public static void deleteDirectory(String filePath)  {
        File file =new File(filePath);
        try {
            if (file.isDirectory()) {
                FileUtils.deleteDirectory(file);
                log.info("Directory deleted successfully : {}", file);
            } else {
                log.info("Directory does not exist");
            }
        }
        catch (Exception e){
            log.info(e.getMessage(),e.getCause());
        }
    }

    public static void deleteFiles(List<String> classNames, String filePath){
        for (String className:classNames) {
            File file = new File(filePath+"\\"+className+".class");
            if (file.exists()) {
                file.delete();
                log.info("{}.class deleted successfully",className);
            } else {
                log.info("{}.class does not exist",className);
            }

        }
    }

}
