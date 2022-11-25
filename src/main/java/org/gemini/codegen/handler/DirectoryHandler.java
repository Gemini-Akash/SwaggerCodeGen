package org.gemini.codegen.handler;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.List;


public final class DirectoryHandler{

    private static final Logger LOG = LoggerFactory.getLogger(DirectoryHandler.class);

    /**
     * renameDirectory() method is used to rename a directory.
     *
     * @param filePath
     */
    public void renameDirectory(final File filePath, final File renameFilePath) {
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
    public void deleteDirectory(final String filePath) {
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
    public void deleteFiles(final List<String> classNames, final String filePath) {
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
