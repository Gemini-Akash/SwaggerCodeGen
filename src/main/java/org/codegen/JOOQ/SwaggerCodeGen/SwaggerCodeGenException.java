package org.codegen.JOOQ.SwaggerCodeGen;

public class SwaggerCodeGenException extends Exception {

    String message;
    SwaggerCodeGenException(String str){
        message=str;
    }

    @Override
    public String toString() {
        return (message);
    }

}
