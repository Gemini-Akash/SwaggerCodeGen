package Validator;


import org.gemini.codegen.apicodegen.validator.DialectValidator;
import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import static org.junit.Assert.assertEquals;


public class DialectValidatorTest {

    DialectValidator dialectValidator=new DialectValidator();

    @Test
    public void negValidateDialect() {
        RuntimeException exception = Assertions.assertThrows(RuntimeException.class, () -> {
            dialectValidator.validateDialect("mongoDb");
        });
        assertEquals("Wrong Dialect as an input. We only support these dialects : {CUBRID,DERBY,FIREBIRD ,H2 ,HSQLDB , MARIADB,MYSQL,POSTGRES,SQLITE}", exception.getMessage());
    }

}
