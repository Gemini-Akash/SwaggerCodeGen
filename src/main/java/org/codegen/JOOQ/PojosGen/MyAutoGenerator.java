package org.codegen.JOOQ.PojosGen;

import org.jooq.codegen.*;
import org.jooq.meta.*;
import org.jooq.tools.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.beans.ConstructorProperties;
import java.util.ArrayList;

import java.util.List;


public class MyAutoGenerator extends JavaGenerator {

    public static final Logger logger= LoggerFactory.getLogger(MyAutoGenerator.class);


    @Override
    protected void generatePojo(TableDefinition table) {
        JavaWriter out = newJavaWriter(getFile(table, GeneratorStrategy.Mode.POJO));
        logger.info("Generating POJO ",out.file().getName());
        generatePojo(table, out);
        closeJavaWriter(out);
        super.generatePojo(table);
    }

    protected void generatePojo(TableDefinition table, JavaWriter out) {
        generatePojo0(table, out);
    }

    private final void generatePojo0(Definition tableUdtOrEmbeddable, JavaWriter out) {
        final String className = getStrategy().getJavaClassName(tableUdtOrEmbeddable, GeneratorStrategy.Mode.POJO);
        final String interfaceName = generateInterfaces()
                ? out.ref(getStrategy().getFullJavaClassName(tableUdtOrEmbeddable, GeneratorStrategy.Mode.INTERFACE))
                : "";
        final String superName = out.ref(getStrategy().getJavaClassExtends(tableUdtOrEmbeddable, GeneratorStrategy.Mode.POJO));
        final List<String> interfaces = out.ref(getStrategy().getJavaClassImplements(tableUdtOrEmbeddable, GeneratorStrategy.Mode.POJO));

        if (generateInterfaces())
            interfaces.add(interfaceName);

        final List<String> superTypes = list(superName, interfaces);
        printPackage(out, tableUdtOrEmbeddable, GeneratorStrategy.Mode.POJO);

        if (tableUdtOrEmbeddable instanceof TableDefinition)
            generatePojoClassJavadoc((TableDefinition) tableUdtOrEmbeddable, out);
        else if (tableUdtOrEmbeddable instanceof EmbeddableDefinition)
            generateEmbeddableClassJavadoc((EmbeddableDefinition) tableUdtOrEmbeddable, out);
        else
            generateUDTPojoClassJavadoc((UDTDefinition) tableUdtOrEmbeddable, out);

        printClassAnnotations(out, tableUdtOrEmbeddable, GeneratorStrategy.Mode.POJO);

        if (tableUdtOrEmbeddable instanceof TableDefinition)
            printTableJPAAnnotation(out, (TableDefinition) tableUdtOrEmbeddable);

        int maxLength = 0;
        for (TypedElementDefinition<?> column : getTypedElements(tableUdtOrEmbeddable))
            maxLength = Math.max(maxLength, out.ref(getJavaType(column.getType(resolver(out, GeneratorStrategy.Mode.POJO)), out, GeneratorStrategy.Mode.POJO)).length());


            out.println("public class %s[[before= extends ][%s]][[before= implements ][%s]] {", className, list(superName), interfaces);

            if (generateSerializablePojos() || generateSerializableInterfaces())
                out.printSerial();

            out.println();

            for (TypedElementDefinition<?> column : getTypedElements(tableUdtOrEmbeddable)) {
                if (column instanceof ColumnDefinition)
                    printColumnJPAAnnotation(out, (ColumnDefinition) column);
                out.println("private %s%s %s;",
                        generateImmutablePojos() ? "final " : "",
                        StringUtils.rightPad(out.ref(getJavaType(column.getType(resolver(out, GeneratorStrategy.Mode.POJO)), out, GeneratorStrategy.Mode.POJO)), maxLength),
                        getStrategy().getJavaMemberName(column, GeneratorStrategy.Mode.POJO));

        }

        // Constructors
        // ---------------------------------------------------------------------

        // Default constructor
        if (!generateImmutablePojos())
            generatePojoDefaultConstructor(tableUdtOrEmbeddable, out);


            // [#1363] [#7055] copy constructor
            generatePojoCopyConstructor(tableUdtOrEmbeddable, out);

            // Multi-constructor
            generatePojoMultiConstructor(tableUdtOrEmbeddable, out);

            List<? extends TypedElementDefinition<?>> elements = getTypedElements(tableUdtOrEmbeddable);
            for (int i = 0; i < elements.size(); i++) {
                TypedElementDefinition<?> column = elements.get(i);

                if (tableUdtOrEmbeddable instanceof TableDefinition)
                    generatePojoGetter(column, i, out);
                else
                    generateUDTPojoGetter(column, i, out);

                // Setter
                if (!generateImmutablePojos())
                    if (tableUdtOrEmbeddable instanceof TableDefinition)
                        generatePojoSetter(column, i, out);
                    else
                        generateUDTPojoSetter(column, i, out);
            }



        if (tableUdtOrEmbeddable instanceof TableDefinition) {
            List<EmbeddableDefinition> embeddables = ((TableDefinition) tableUdtOrEmbeddable).getReferencedEmbeddables();

            for (int i = 0; i < embeddables.size(); i++) {
                EmbeddableDefinition embeddable = embeddables.get(i);

                generateEmbeddablePojoSetter(embeddable, i, out);
                generateEmbeddablePojoGetter(embeddable, i, out);
            }
        }

        if (generatePojosEqualsAndHashCode())
            generatePojoEqualsAndHashCode(tableUdtOrEmbeddable, out);

        if (generatePojosToString())
            generatePojoToString(tableUdtOrEmbeddable, out);

        if (generateInterfaces() && !generateImmutablePojos())
            printFromAndInto(out, tableUdtOrEmbeddable, GeneratorStrategy.Mode.POJO);

        if (tableUdtOrEmbeddable instanceof TableDefinition)
            generatePojoClassFooter((TableDefinition) tableUdtOrEmbeddable, out);
        else if (tableUdtOrEmbeddable instanceof EmbeddableDefinition)
            generateEmbeddableClassFooter((EmbeddableDefinition) tableUdtOrEmbeddable, out);
        else
            generateUDTPojoClassFooter((UDTDefinition) tableUdtOrEmbeddable, out);

        out.println("}");
        closeJavaWriter(out);
    }

    protected void generatePojoMultiConstructor(Definition tableOrUDT, JavaWriter out) {
        final String className = getStrategy().getJavaClassName(tableOrUDT, GeneratorStrategy.Mode.POJO);
        final List<String> properties = new ArrayList<>();

        int maxLength = 0;
        for (TypedElementDefinition<?> column : getTypedElements(tableOrUDT)) {
            maxLength = Math.max(maxLength, out.ref(getJavaType(column.getType(resolver(out, GeneratorStrategy.Mode.POJO)), out, GeneratorStrategy.Mode.POJO)).length());
            properties.add("\"" + escapeString(getStrategy().getJavaMemberName(column, GeneratorStrategy.Mode.POJO)) + "\"");
        }



        // [#3010] Invalid UDTs may have no attributes. Avoid generating this constructor in that case
        // [#3176] Avoid generating constructors for tables with more than 255 columns (Java's method argument limit)
        if (getTypedElements(tableOrUDT).size() > 0 &&
                getTypedElements(tableOrUDT).size() < 256) {
            out.println();

            if (generateConstructorPropertiesAnnotationOnPojos())
                out.println("@%s({ [[%s]] })", ConstructorProperties.class, properties);

            out.print("public %s(", className);

            String separator1 = "";
            for (TypedElementDefinition<?> column : getTypedElements(tableOrUDT)) {
                final String nullableAnnotation = nullableOrNonnullAnnotation(out, column);

                out.println(separator1);
                out.print("[[before=@][after= ][%s]]%s %s",
                        list(nullableAnnotation),
                        StringUtils.rightPad(out.ref(getJavaType(column.getType(resolver(out, GeneratorStrategy.Mode.POJO)), out, GeneratorStrategy.Mode.POJO)), maxLength),
                        getStrategy().getJavaMemberName(column, GeneratorStrategy.Mode.POJO));
                separator1 = ",";
            }

            out.println();
            out.println(") {");

            for (TypedElementDefinition<?> column : getTypedElements(tableOrUDT)) {
                final String columnMember = getStrategy().getJavaMemberName(column, GeneratorStrategy.Mode.POJO);

                out.println("this.%s = %s;", columnMember, columnMember);
            }

            out.println("}");
        }
    }

    /**
     * Subclasses may override this method to provide their own pojo copy constructors.
     */
    protected void generatePojoCopyConstructor(Definition tableOrUDT, JavaWriter out) {
        final String className = getStrategy().getJavaClassName(tableOrUDT, GeneratorStrategy.Mode.POJO);
        final String interfaceName = generateInterfaces()
                ? out.ref(getStrategy().getFullJavaClassName(tableOrUDT, GeneratorStrategy.Mode.INTERFACE))
                : "";

        out.println();

            out.println("public %s(%s value) {", className, generateInterfaces() ? interfaceName : className);

            for (TypedElementDefinition<?> column : getTypedElements(tableOrUDT)) {
                out.println("this.%s = value.%s%s;",
                        getStrategy().getJavaMemberName(column, GeneratorStrategy.Mode.POJO),
                        generateInterfaces()
                                ? getStrategy().getJavaGetterName(column, GeneratorStrategy.Mode.INTERFACE)
                                : getStrategy().getJavaMemberName(column, GeneratorStrategy.Mode.POJO),
                        generateInterfaces()
                                ? "()"
                                : "");



        }
        out.println("}");
    }

    /**
     * Subclasses may override this method to provide their own pojo default constructors.
     */
    protected void generatePojoDefaultConstructor(Definition tableOrUDT, JavaWriter out) {
        final String className = getStrategy().getJavaClassName(tableOrUDT, GeneratorStrategy.Mode.POJO);

        out.println();
        int size = getTypedElements(tableOrUDT).size();
        // [#6248] [#10288] The no-args constructor isn't needed because we have named, defaulted parameters
        out.println("public %s() {}", className);

    }


    @Override
    protected void generatePojoGetter(TypedElementDefinition<?> column, int index, JavaWriter out) {
        generatePojoGetter0(column, index, out);
    }

    /**
     * Subclasses may override this method to provide their own pojo getters.
     */

    private final void generatePojoGetter0(TypedElementDefinition<?> column, @SuppressWarnings("unused") int index, JavaWriter out) {
        final String columnTypeFull = getJavaType(column.getType(resolver(out, GeneratorStrategy.Mode.POJO)), out, GeneratorStrategy.Mode.POJO);
        final String columnType = out.ref(columnTypeFull);
        final String columnGetter = getStrategy().getJavaGetterName(column, GeneratorStrategy.Mode.POJO);
        final String columnMember = getStrategy().getJavaMemberName(column, GeneratorStrategy.Mode.POJO);
        final String name = column.getQualifiedOutputName();

        // Getter
        if (!printDeprecationIfUnknownType(out, columnTypeFull))
            out.javadoc("Getter for <code>%s</code>.[[before= ][%s]]", name, list(escapeEntities(comment(column))));



        printValidationAnnotation(out, column);
        printNullableOrNonnullAnnotation(out, column);


            out.overrideIf(generateInterfaces());
            out.println("public %s %s() {", columnType, columnGetter);
            out.println("return this.%s;", columnMember);
            out.println("}");

    }

    private void printValidationAnnotation(JavaWriter out, TypedElementDefinition<?> column) {
        if (generateValidationAnnotations()) {
            String prefix = "";
            DataTypeDefinition type = column.getType(resolver(out));

            // [#5128] defaulted columns are nullable in Java
            if (!column.getType(resolver(out)).isNullable() &&
                    !column.getType(resolver(out)).isDefaulted() &&
                    !column.getType(resolver(out)).isIdentity())
                out.println("@%s%s", prefix, out.ref("javax.validation.constraints.NotNull"));

            String javaType = getJavaType(type, out);
            if ("java.lang.String".equals(javaType) || "byte[]".equals(javaType)) {
                int length = type.getLength();

                if (length > 0)
                    out.println("@%s%s(max = %s)", prefix, out.ref("javax.validation.constraints.Size"), length);
            }
        }
    }

    private void printNullableOrNonnullAnnotation(JavaWriter out, Definition column) {
        if (column instanceof TypedElementDefinition && ((TypedElementDefinition<?>) column).getType().isNullable())
            printNullableAnnotation(out);
        else
            printNonnullAnnotation(out);
    }

    protected void printNullableAnnotation(JavaWriter out) {
        if (generateNullableAnnotation())
            out.println("@%s", out.ref(generatedNullableAnnotationType()));
    }

    protected void printNonnullAnnotation(JavaWriter out) {
        if (generateNonnullAnnotation())
            out.println("@%s", out.ref(generatedNonnullAnnotationType()));
    }

    private String comment(Definition definition) {
        return definition instanceof CatalogDefinition && generateCommentsOnCatalogs()
                || definition instanceof SchemaDefinition && generateCommentsOnSchemas()
                || definition instanceof TableDefinition && generateCommentsOnTables()
                || definition instanceof ColumnDefinition && generateCommentsOnColumns()
                || definition instanceof EmbeddableDefinition && generateCommentsOnEmbeddables()
                || definition instanceof UDTDefinition && generateCommentsOnUDTs()
                || definition instanceof AttributeDefinition && generateCommentsOnAttributes()
                || definition instanceof PackageDefinition && generateCommentsOnPackages()
                || definition instanceof RoutineDefinition && generateCommentsOnRoutines()
                || definition instanceof ParameterDefinition && generateCommentsOnParameters()
                || definition instanceof SequenceDefinition && generateCommentsOnSequences()
                ? StringUtils.defaultIfBlank(definition.getComment(), "")
                : "";
    }


    private boolean printDeprecationIfUnknownType(JavaWriter out, String type) {
        if (generateDeprecationOnUnknownTypes() && (Object.class.getName().equals(type) && "Any".equals(type))) {

            out.javadoc("@deprecated Unknown data type. "
                    + "Please define an explicit {@link org.jooq.Binding} to specify how this "
                    + "type should be handled. Deprecation can be turned off using {@literal <deprecationOnUnknownTypes/>} "
                    + "in your code generator configuration.");

            out.println("@%s", out.ref(Deprecated.class));


            return true;
        } else {
            return false;
        }
    }






    private List<? extends TypedElementDefinition<? extends Definition>> getTypedElements(Definition definition) {
        if (definition instanceof TableDefinition)
            return ((TableDefinition) definition).getColumns();
        else if (definition instanceof EmbeddableDefinition)
            return ((EmbeddableDefinition) definition).getColumns();
        else if (definition instanceof UDTDefinition)
            return ((UDTDefinition) definition).getAttributes();
        else if (definition instanceof RoutineDefinition)
            return ((RoutineDefinition) definition).getAllParameters();
        else
            throw new IllegalArgumentException("Unsupported type : " + definition);
    }

    private void printFromAndInto(JavaWriter out, Definition tableOrUDT, GeneratorStrategy.Mode mode) {
        String qualified = out.ref(getStrategy().getFullJavaClassName(tableOrUDT, GeneratorStrategy.Mode.INTERFACE));

        out.header("FROM and INTO");
        boolean override = generateInterfaces() && !generateImmutableInterfaces();


            out.overrideInheritIf(override);
            out.println("public void from(%s from) {", qualified);


        for (TypedElementDefinition<?> column : getTypedElements(tableOrUDT)) {
            final String setter = getStrategy().getJavaSetterName(column, GeneratorStrategy.Mode.INTERFACE);
            final String getter = getStrategy().getJavaGetterName(column, GeneratorStrategy.Mode.INTERFACE);

            // TODO: Use appropriate Mode here
            final String member = getStrategy().getJavaMemberName(column, GeneratorStrategy.Mode.POJO);

            out.println("%s(from.%s());", setter, getter);
        }

        out.println("}");

        if (override) {
            // [#10191] Java and Kotlin can produce overloads for this method despite
            // generic type erasure, but Scala cannot, see
            // https://twitter.com/lukaseder/status/1262652304773259264

                out.overrideInherit();
                out.println("public <E extends %s> E into(E into) {", qualified);
                out.println("into.from(this);");
                out.println("return into;");
                out.println("}");

        }
    }

    private static final <T> List<T> list(T first, List<T> remaining) {
        List<T> result = new ArrayList<>();

        result.addAll(list(first));
        result.addAll(remaining);

        return result;
    }

    private static final <T> List<T> list(T... objects) {
        List<T> result = new ArrayList<>();

        if (objects != null)
            for (T object : objects)
                if (object != null && !"".equals(object))
                    result.add(object);

        return result;
    }

    private String nullableOrNonnullAnnotation(JavaWriter out, Definition column) {
        return (column instanceof TypedElementDefinition && ((TypedElementDefinition<?>) column).getType().isNullable())
                ? nullableAnnotation(out)
                : nonnullAnnotation(out);
    }
    private String nullableAnnotation(JavaWriter out) {
        return generateNullableAnnotation() ? out.ref(generatedNullableAnnotationType()) : null;
    }

    private String nonnullAnnotation(JavaWriter out) {
        return generateNonnullAnnotation() ? out.ref(generatedNonnullAnnotationType()) : null;
    }

    private String escapeString(String string) {

        if (string == null)
            return null;

        // [#3450] Escape also the escape sequence, among other things that break Java strings.
        String result = string.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r");

        // [#10007] [#10318] Very long strings cannot be handled by the javac compiler.
        int max = 16384;
        if (result.length() <= max)
            return result;

        StringBuilder sb = new StringBuilder("\" + \"");
        for (int i = 0; i < result.length(); i += max) {
            if (i > 0)
                sb.append("\".toString() + \"");

            sb.append(result.substring(i, Math.min(i + max, result.length())));
        }

        return sb.append("\".toString() + \"").toString();
    }

}
