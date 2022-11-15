package org.gemini.codegen.ApiCodeGen.Validator;

import java.io.File;

/**
 * This class has method isValidPath, which is used for the validating paths.
 */
public class PathValidator {

    /**
     * This Method will return boolean values whether the given path is valid or not.
     * @param Path Contains the path given by user to check.
     * @return boolean value True or False
     */
    public static boolean isValidPath(String Path){
        File file = new File(Path);
        boolean result = file.exists();
        return result;
    }
}