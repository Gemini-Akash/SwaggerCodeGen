package org.gemini.codegen.ApiCodeGen.Validator;

import java.util.Arrays;
import java.util.List;

public class DialectValidator {
    public static void validateDialect(String dialectName){
        List<String> dialects= Arrays.asList("CUBRID","DERBY" , "FIREBIRD" , "H2" , "HSQLDB" , "MARIADB", "MYSQL", "POSTGRES", "SQLITE");
        if (!dialects.contains(dialectName) && !(dialectName.isEmpty()))
            throw new RuntimeException("Wrong Dialect as an input. We only support these dialects : {CUBRID,DERBY,FIREBIRD ,H2 ,HSQLDB , MARIADB,MYSQL,POSTGRES,SQLITE}");
    }
}
