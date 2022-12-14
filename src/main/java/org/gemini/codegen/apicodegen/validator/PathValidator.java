package org.gemini.codegen.apicodegen.validator;

import java.io.File;

/**
 * This class has method isValidPath, which is used for the validating paths.
 */
public final class PathValidator {

    /**
     * This Method will return boolean values whether the given path is valid or not.
     *
     * @param filePath Contains the path given by user to check.
     * @return boolean value True or False
     */
    public  boolean isValidPath(final String filePath) {
        File file = new File(filePath);
        boolean result = file.exists();
        return result;
    }
}