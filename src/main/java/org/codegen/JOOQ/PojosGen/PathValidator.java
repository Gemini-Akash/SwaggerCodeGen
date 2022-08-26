package org.codegen.JOOQ.PojosGen;

import java.io.File;
import java.nio.file.Paths;


/**
 * This class has method isValidPath, which is used for the validating paths.
 */
public class PathValidator {

    /**
     * This Method will return boolean values whether the given path is valid or not.
     * @param Path Contains the path given by user to check.
     * @return boolean value True or False
     */
    public Boolean isValidPath(String Path){
        File file = new File(Path);
        Boolean result = file.exists();
        return result;
    }
}
