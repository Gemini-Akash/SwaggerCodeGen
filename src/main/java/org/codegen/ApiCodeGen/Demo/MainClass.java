package org.codegen.ApiCodeGen.Demo;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class MainClass {
    public static void main(String[] args) throws InstantiationException, IllegalAccessException,
            NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException, InvocationTargetException {

        CustomClassLoaderDemo loader = new CustomClassLoaderDemo();
        Class<?> c = loader.findClass("org.codegen.ApiCodeGen.Demo");
//        Object ob = c.ne;
        Method md = c.getMethod("show");
//        md.invoke(ob);
    }
}
