package org.gemini.codegen.apiCodeGen.validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Arrays;
import java.util.List;

public class DialectValidator {

    private static final Logger LOG = LoggerFactory.getLogger(DialectValidator.class);

    /**
     * validateDialect method is used for validating input dialect.
     *
     * @param dialectName
     */
    public static void validateDialect(final String dialectName) {
        LOG.info("InputDialect-----> {}", dialectName);
        List<String> dialects = Arrays.asList("CUBRID", "DERBY", "FIREBIRD", "H2", "HSQLDB", "MARIADB", "MYSQL", "POSTGRES", "SQLITE");
        if (!dialects.contains(dialectName) && !(dialectName.isEmpty())) {
            throw new RuntimeException("Wrong Dialect as an input. We only support these dialects : {CUBRID,DERBY,FIREBIRD ,H2 ,HSQLDB , MARIADB,MYSQL,POSTGRES,SQLITE}");
        }
    }

}
