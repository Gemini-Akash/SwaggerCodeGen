package org.gemini.codegen.jooqPojoGen;

import org.jooq.Configuration;
import org.jooq.Constants;
import org.jooq.Record;
import org.jooq.codegen.GeneratorStrategy;
import org.jooq.codegen.JavaGenerator;
import org.jooq.codegen.JavaWriter;
import org.jooq.impl.DAOImpl;
import org.jooq.meta.*;
import org.jooq.tools.JooqLogger;
import org.jooq.tools.StringUtils;

import java.beans.ConstructorProperties;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;


public class CustomJooqAutoGenerator extends JavaGenerator {

    private static final JooqLogger LOG = JooqLogger.getLogger(CustomJooqAutoGenerator.class);

    private static final <T> List<T> list(T first, List<T> remaining) {
        List<T> result = new ArrayList<>();

        result.addAll(list(first));
        result.addAll(remaining);

        return result;
    }

    private static final <T> List<T> list(T... objects) {
        List<T> result = new ArrayList<>();

        if (objects != null) {
            for (T object : objects) {
                if (object != null && !"".equals(object)) {
                    result.add(object);
                }
            }
        }

        return result;
    }

    @Override
    protected void generatePojo(TableDefinition table) {
        JavaWriter out = newJavaWriter(getFile(table, GeneratorStrategy.Mode.POJO));
        LOG.info("Generating POJO ", out.file().getName());
        generatePojo(table, out);
        closeJavaWriter(out);
        super.generatePojo(table);
    }

    protected void generatePojo(TableDefinition table, JavaWriter out) {
        generatePojoClass(table, out);
    }

    private final void generatePojoClass(Definition tableUdtOrEmbeddable, JavaWriter out) {
        final String className = getStrategy().getJavaClassName(tableUdtOrEmbeddable, GeneratorStrategy.Mode.POJO);
        final String interfaceName = generateInterfaces()
                ? out.ref(getStrategy().getFullJavaClassName(tableUdtOrEmbeddable, GeneratorStrategy.Mode.INTERFACE))
                : "";
        final String superName = out.ref(getStrategy().getJavaClassExtends(tableUdtOrEmbeddable, GeneratorStrategy.Mode.POJO));
        final List<String> interfaces = out.ref(getStrategy().getJavaClassImplements(tableUdtOrEmbeddable, GeneratorStrategy.Mode.POJO));

        if (generateInterfaces()) {
            interfaces.add(interfaceName);
        }

//        final List<String> superTypes = list(superName, interfaces);
        printPackage(out, tableUdtOrEmbeddable, GeneratorStrategy.Mode.POJO);

        if (tableUdtOrEmbeddable instanceof TableDefinition) {
            generatePojoClassJavadoc((TableDefinition) tableUdtOrEmbeddable, out);
        } else if (tableUdtOrEmbeddable instanceof EmbeddableDefinition) {
            generateEmbeddableClassJavadoc((EmbeddableDefinition) tableUdtOrEmbeddable, out);
        } else {
            generateUDTPojoClassJavadoc((UDTDefinition) tableUdtOrEmbeddable, out);
        }

        printClassAnnotations(out, tableUdtOrEmbeddable, GeneratorStrategy.Mode.POJO);

        if (tableUdtOrEmbeddable instanceof TableDefinition) {
            printTableJPAAnnotation(out, (TableDefinition) tableUdtOrEmbeddable);
        }

        int maxLength = 0;
        for (TypedElementDefinition<?> column : getTypedElements(tableUdtOrEmbeddable)) {
            maxLength = Math.max(maxLength, out.ref(getJavaType(column.getType(resolver(out, GeneratorStrategy.Mode.POJO)), out, GeneratorStrategy.Mode.POJO)).length());
        }

        out.println("public class %s[[before= extends ][%s]][[before= implements ][%s]] {", className, list(superName), interfaces);

        if (generateSerializablePojos() || generateSerializableInterfaces()) {
            out.printSerial();
        }

        out.println();

        for (TypedElementDefinition<?> column : getTypedElements(tableUdtOrEmbeddable)) {
            if (column instanceof ColumnDefinition) {
                printColumnJPAAnnotation(out, (ColumnDefinition) column);
            }

            out.println("private %s%s %s;",
                    generateImmutablePojos() ? "final " : "",
                    StringUtils.rightPad(out.ref(getJavaType(column.getType(resolver(out, GeneratorStrategy.Mode.POJO)), out, GeneratorStrategy.Mode.POJO)), maxLength),
                    getStrategy().getJavaMemberName(column, GeneratorStrategy.Mode.POJO));

        }

        // Constructors
        // ---------------------------------------------------------------------

        // Default constructor
        if (!generateImmutablePojos()) {
            generatePojoDefaultConstructor(tableUdtOrEmbeddable, out);
        }


        // [#1363] [#7055] copy constructor
        generatePojoCopyConstructor(tableUdtOrEmbeddable, out);

        // Multi-constructor
        generatePojoMultiConstructor(tableUdtOrEmbeddable, out);

        List<? extends TypedElementDefinition<?>> elements = getTypedElements(tableUdtOrEmbeddable);
        for (int i = 0; i < elements.size(); i++) {
            TypedElementDefinition<?> column = elements.get(i);

            if (tableUdtOrEmbeddable instanceof TableDefinition) {
                generatePojoGetter(column, i, out);
            } else {
                generateUDTPojoGetter(column, i, out);
            }

            // Setter
            if (!generateImmutablePojos()) {
                if (tableUdtOrEmbeddable instanceof TableDefinition) {
                    generatePojoSetter(column, i, out);
                } else {
                    generateUDTPojoSetter(column, i, out);
                }
            }
        }


        if (tableUdtOrEmbeddable instanceof TableDefinition) {
            List<EmbeddableDefinition> embeddables = ((TableDefinition) tableUdtOrEmbeddable).getReferencedEmbeddables();

            for (int i = 0; i < embeddables.size(); i++) {
                EmbeddableDefinition embeddable = embeddables.get(i);

                generateEmbeddablePojoSetter(embeddable, i, out);
                generateEmbeddablePojoGetter(embeddable, i, out);
            }
        }

        if (generatePojosEqualsAndHashCode()) {
            generatePojoEqualsAndHashCode(tableUdtOrEmbeddable, out);
        }

        if (generatePojosToString()) {
            generatePojoToString(tableUdtOrEmbeddable, out);
        }

        if (generateInterfaces() && !generateImmutablePojos()) {
            printFromAndIntoMethod(out, tableUdtOrEmbeddable, GeneratorStrategy.Mode.POJO);
        }

        if (tableUdtOrEmbeddable instanceof TableDefinition) {
            generatePojoClassFooter((TableDefinition) tableUdtOrEmbeddable, out);
        } else if (tableUdtOrEmbeddable instanceof EmbeddableDefinition) {
            generateEmbeddableClassFooter((EmbeddableDefinition) tableUdtOrEmbeddable, out);
        } else {
            generateUDTPojoClassFooter((UDTDefinition) tableUdtOrEmbeddable, out);
        }

        out.println("}");
        closeJavaWriter(out);
    }

    protected void printColumnJPAAnnotation(JavaWriter out, ColumnDefinition column) {
        int indent = out.indent();
        if (this.generateJPAAnnotations()) {
            String prefix = "";
            UniqueKeyDefinition pk = column.getPrimaryKey();
            if (pk != null) {
                out.println("@%s%s", prefix, out.ref("javax.persistence.Id"));
                for (ColumnDefinition s : pk.getKeyColumns()) {
                    if (s.isIdentity()) {
                        out.println("@%s%s(strategy = %s.IDENTITY)", prefix, out.ref("javax.persistence.GeneratedValue"), out.ref("javax.persistence.GenerationType"));
                    }
                }
            }

            String nullable = "";
            if (!column.getType(this.resolver(out)).isNullable()) {
                nullable = ", nullable = false";
            }

            String length = "";
            String precision = "";
            String scale = "";
            if (column.getType(this.resolver(out)).getLength() > 0) {
                length = ", length = " + column.getType(this.resolver(out)).getLength();
            } else if (column.getType(this.resolver(out)).getPrecision() > 0) {
                precision = ", precision = " + column.getType(this.resolver(out)).getPrecision();
                if (column.getType(this.resolver(out)).getScale() > 0) {
                    scale = ", scale = " + column.getType(this.resolver(out)).getScale();
                }
            }

            out.print("@%s%s(name = \"", prefix, out.ref("javax.persistence.Column"));
            out.print(this.escapeStringMethod(column.getName()));
            out.print("\"");
            out.print(nullable);
            out.print(length);
            out.print(precision);
            out.print(scale);
            out.println(")");
        }

        out.indent(indent);
    }

    protected void generatePojoMultiConstructor(Definition tableOrUDT, JavaWriter out) {
        final String className = getStrategy().getJavaClassName(tableOrUDT, GeneratorStrategy.Mode.POJO);
        final List<String> properties = new ArrayList<>();

        int maxLength = 0;
        for (TypedElementDefinition<?> column : getTypedElements(tableOrUDT)) {
            maxLength = Math.max(maxLength, out.ref(getJavaType(column.getType(resolver(out, GeneratorStrategy.Mode.POJO)), out, GeneratorStrategy.Mode.POJO)).length());
            properties.add("\"" + escapeStringMethod(getStrategy().getJavaMemberName(column, GeneratorStrategy.Mode.POJO)) + "\"");
        }


        // [#3010] Invalid UDTs may have no attributes. Avoid generating this constructor in that case
        // [#3176] Avoid generating constructors for tables with more than 255 columns (Java's method argument limit)
        if (getTypedElements(tableOrUDT).size() > 0 &&
                getTypedElements(tableOrUDT).size() < 256) {
            out.println();

            if (generateConstructorPropertiesAnnotationOnPojos()) {
                out.println("@%s({ [[%s]] })", ConstructorProperties.class, properties);
            }

            out.print("public %s(", className);

            String separator1 = "";
            for (TypedElementDefinition<?> column : getTypedElements(tableOrUDT)) {
                final String nullableAnnotation = nullableOrNonnullAnnotationMethod(out, column);

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
//        int size = getTypedElements(tableOrUDT).size();
        // [#6248] [#10288] The no-args constructor isn't needed because we have named, defaulted parameters
        out.println("public %s() {}", className);

    }

    @Override
    protected void generatePojoGetter(TypedElementDefinition<?> column, int index, JavaWriter out) {
        generatePojoGetterClass(column, index, out);
    }

    /**
     * Subclasses may override this method to provide their own pojo getters.
     */

    private final void generatePojoGetterClass(TypedElementDefinition<?> column, @SuppressWarnings("unused") int index, JavaWriter out) {
        final String columnTypeFull = getJavaType(column.getType(resolver(out, GeneratorStrategy.Mode.POJO)), out, GeneratorStrategy.Mode.POJO);
        final String columnType = out.ref(columnTypeFull);
        final String columnGetter = getStrategy().getJavaGetterName(column, GeneratorStrategy.Mode.POJO);
        final String columnMember = getStrategy().getJavaMemberName(column, GeneratorStrategy.Mode.POJO);
        final String name = column.getQualifiedOutputName();

        // Getter
        if (!printDeprecationIfUnknownTypeMethod(out, columnTypeFull)) {
            out.javadoc("Getter for <code>%s</code>.[[before= ][%s]]", name, list(escapeEntities(commentMethod(column))));
        }

        printValidationAnnotationClass(out, column);
        printNullableOrNonnullAnnotationClass(out, column);


        out.overrideIf(generateInterfaces());
        out.println("public %s %s() {", columnType, columnGetter);
        out.println("return this.%s;", columnMember);
        out.println("}");

    }

    private void printValidationAnnotationClass(JavaWriter out, TypedElementDefinition<?> column) {
        if (generateValidationAnnotations()) {
            String prefix = "";
            DataTypeDefinition type = column.getType(resolver(out));

            // [#5128] defaulted columns are nullable in Java
            if (!column.getType(resolver(out)).isNullable() &&
                    !column.getType(resolver(out)).isDefaulted() &&
                    !column.getType(resolver(out)).isIdentity()) {
                out.println("@%s%s", prefix, out.ref("javax.validation.constraints.NotNull"));
            }
            String javaType = getJavaType(type, out);
            if ("java.lang.String".equals(javaType) || "byte[]".equals(javaType)) {
                int length = type.getLength();

                if (length > 0) {
                    out.println("@%s%s(max = %s)", prefix, out.ref("javax.validation.constraints.Size"), length);
                }
            }
        }
    }

    private void printNullableOrNonnullAnnotationClass(JavaWriter out, Definition column) {
        if (column instanceof TypedElementDefinition && ((TypedElementDefinition<?>) column).getType().isNullable()) {
            printNullableAnnotation(out);
        } else {
            printNonnullAnnotation(out);
        }
    }

    protected void printNullableAnnotation(JavaWriter out) {
        if (generateNullableAnnotation()) {
            out.println("@%s", out.ref(generatedNullableAnnotationType()));
        }
    }

    protected void printNonnullAnnotation(JavaWriter out) {
        if (generateNonnullAnnotation()) {
            out.println("@%s", out.ref(generatedNonnullAnnotationType()));
        }
    }

    private String commentMethod(Definition definition) {
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

    private boolean printDeprecationIfUnknownTypeMethod(JavaWriter out, String type) {
        if (generateDeprecationOnUnknownTypes() && Object.class.getName().equals(type) && "Any".equals(type)) {

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
        if (definition instanceof TableDefinition) {
            return ((TableDefinition) definition).getColumns();
        } else if (definition instanceof EmbeddableDefinition) {
            return ((EmbeddableDefinition) definition).getColumns();
        } else if (definition instanceof UDTDefinition) {
            return ((UDTDefinition) definition).getAttributes();
        } else if (definition instanceof RoutineDefinition) {
            return ((RoutineDefinition) definition).getAllParameters();
        } else {
            throw new IllegalArgumentException("Unsupported type : " + definition);
        }
    }

    private void printFromAndIntoMethod(JavaWriter out, Definition tableOrUDT, GeneratorStrategy.Mode mode) {
        String qualified = out.ref(getStrategy().getFullJavaClassName(tableOrUDT, GeneratorStrategy.Mode.INTERFACE));

        out.header("FROM and INTO");
        boolean override = generateInterfaces() && !generateImmutableInterfaces();


        out.overrideInheritIf(override);
        out.println("public void from(%s from) {", qualified);


        for (TypedElementDefinition<?> column : getTypedElements(tableOrUDT)) {
            final String setter = getStrategy().getJavaSetterName(column, GeneratorStrategy.Mode.INTERFACE);
            final String getter = getStrategy().getJavaGetterName(column, GeneratorStrategy.Mode.INTERFACE);

            // TODO: Use appropriate Mode here
//            final String member = getStrategy().getJavaMemberName(column, GeneratorStrategy.Mode.POJO);

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

    private String nullableOrNonnullAnnotationMethod(JavaWriter out, Definition column) {
        return column instanceof TypedElementDefinition && ((TypedElementDefinition<?>) column).getType().isNullable()
                ? nullableAnnotationMethod(out)
                : nonnullAnnotationMethod(out);
    }

    private String nullableAnnotationMethod(JavaWriter out) {
        return generateNullableAnnotation() ? out.ref(generatedNullableAnnotationType()) : null;
    }

    private String nonnullAnnotationMethod(JavaWriter out) {
        return generateNonnullAnnotation() ? out.ref(generatedNonnullAnnotationType()) : null;
    }

    private String escapeStringMethod(String string) {

        if (string == null) {
            return null;
        }

        // [#3450] Escape also the escape sequence, among other things that break Java strings.
        String result = string.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r");

        // [#10007] [#10318] Very long strings cannot be handled by the javac compiler.
        int max = 16384;
        if (result.length() <= max) {
            return result;
        }

        StringBuilder sb = new StringBuilder("\" + \"");
        for (int i = 0; i < result.length(); i += max) {
            if (i > 0) {
                sb.append("\".toString() + \"");
            }

            sb.append(result, i, Math.min(i + max, result.length()));
        }

        return sb.append("\".toString() + \"").toString();
    }


    @Override
    protected void generateDao(TableDefinition table) {
        JavaWriter out = newJavaWriter(getFile(table, GeneratorStrategy.Mode.DAO));
        LOG.info("Generating DAO", out.file().getName());
        generateDao(table, out);
        closeJavaWriter(out);
    }

    protected void generateDao(TableDefinition table, JavaWriter out) {
        UniqueKeyDefinition key = table.getPrimaryKey();
        int size = key.getKeyColumns().size();
        if (key == null) {
            LOG.info("Skipping DAO generation", out.file().getName());
            return;
        }

        final String className = getStrategy().getJavaClassName(table, GeneratorStrategy.Mode.DAO);
        final List<String> interfaces = out.ref(getStrategy().getJavaClassImplements(table, GeneratorStrategy.Mode.DAO));
        final String tableRecord = out.ref(getStrategy().getFullJavaClassName(table, GeneratorStrategy.Mode.RECORD));
        final String daoImpl = out.ref(DAOImpl.class);
        final String tableIdentifier = out.ref(getStrategy().getFullJavaIdentifier(table), 2);
        String tType = "Void";


        String pType = out.ref(getStrategy().getFullJavaClassName(table, GeneratorStrategy.Mode.POJO));

        List<ColumnDefinition> keyColumns = key.getKeyColumns();

        if (keyColumns.size() == 1) {
            tType = getJavaType(keyColumns.get(0).getType(resolver(out)), out, GeneratorStrategy.Mode.POJO);
        }
        if (keyColumns.size() <= Constants.MAX_ROW_DEGREE) {
            String generics = "";
            String separator = "";

            for (ColumnDefinition column : keyColumns) {
                generics += separator + out.ref(getJavaType(column.getType(resolver(out)), out));


                separator = ", ";
            }

        } else {
            tType = Record.class.getName();
        }


        printPackage(out, table, GeneratorStrategy.Mode.DAO);
        tType = out.ref(tType);
        out.println("import org.jooq.impl.DefaultConfiguration;");
        generateDaoClassJavadoc(table, out);
        printClassAnnotations(out, table, GeneratorStrategy.Mode.DAO);

        if (generateSpringAnnotations()) {
            out.println("@%s", out.ref("org.springframework.stereotype.Repository"));
        }

        out.println("public class %s extends %s<%s, %s, %s>[[before= implements ][%s]] {", className, daoImpl, tableRecord, pType, tType, interfaces);

        // Default constructor
        // -------------------
        out.javadoc("Create a new %s without any configuration", className);


        out.println("public %s() {", className);
        out.println("super(%s, %s.class);", tableIdentifier, pType);
        out.println("}");


        // Initialising constructor
        // ------------------------


        out.javadoc("Create a new %s with an attached configuration", className);

        printDaoConstructorAnnotations(table, out);
        out.println("public %s(%s configuration) {", className, Configuration.class);
        out.println("super(%s, %s.class, configuration);", tableIdentifier, pType);
        out.println("}");


        // Template method implementations
        // -------------------------------

        out.overrideInherit();
        printNonnullAnnotation(out);
        out.println("public %s getId(%s object) {", tType, pType);

        if (keyColumns.size() == 1) {

            out.println("return object.%s();", getStrategy().getJavaGetterName(keyColumns.get(0), GeneratorStrategy.Mode.POJO));
        }
        // [#2574] This should be replaced by a call to a method on the target table's Key type
        else {
            String params = "";
            String separator = "";

            for (ColumnDefinition column : keyColumns) {

                params += separator + "object." + getStrategy().getJavaGetterName(column, GeneratorStrategy.Mode.POJO) + "()";

                separator = ", ";
            }


            out.println("return compositeKeyRecord(%s);", params);
        }


        out.println("}");

        for (ColumnDefinition column : table.getColumns()) {
            final String colName = column.getOutputName();
            final String colClass = getStrategy().getJavaClassName(column);
            final String colTypeFull = getJavaType(column.getType(resolver(out)), out);
            final String colType = out.ref(colTypeFull);
            final String colIdentifier = out.ref(getStrategy().getFullJavaIdentifier(column), colRefSegmentsMethod(column));

            // fetchRangeOf[Column]([T]...)
            // -----------------------
            if (!printDeprecationIfUnknownTypeMethod(out, colTypeFull)) {
                out.javadoc("Fetch records that have <code>%s BETWEEN lowerInclusive AND upperInclusive</code>", colName);
            }
            printNonnullAnnotation(out);
            out.println("public %s<%s> fetchRangeOf%s(%s lowerInclusive, %s upperInclusive) {", List.class, pType, colClass, colType, colType);
            out.println("return fetchRange(%s, lowerInclusive, upperInclusive);", colIdentifier);
            out.println("}");


            // fetchBy[Column]([T]...)
            // -----------------------
            if (!printDeprecationIfUnknownTypeMethod(out, colTypeFull)) {
                out.javadoc("Fetch records that have <code>%s IN (values)</code>", colName);
            }

            printNonnullAnnotation(out);
            out.println("public %s<%s> fetchBy%s(%s... values) {", List.class, pType, colClass, colType);
            out.println("return fetch(%s, values);", colIdentifier);
            out.println("}");
            //DeleteBy[columns](Void)


            // fetchOneBy[Column]([T])
            // -----------------------
            ukLoop:
            for (UniqueKeyDefinition uk : column.getUniqueKeys()) {

                // If column is part of a single-column unique key...
                if (uk.getKeyColumns().size() == 1 && uk.getKeyColumns().get(0).equals(column)) {
                    if (!printDeprecationIfUnknownTypeMethod(out, colTypeFull)) {
                        out.javadoc("Fetch a unique record that has <code>%s = value</code>", colName);
                    }
                    printNullableAnnotation(out);
                    out.println("public %s fetchOneBy%s(%s value) {", pType, colClass, colType);
                    out.println("return fetchOne(%s, value);", colIdentifier);
                    out.println("}");


                    break ukLoop;
                }
            }
        }

        //For GET method for composite primary key.
        out.javadoc("Created custom fetchRecord Method");
        out.print("public %s fetchRecord(", pType);
        int flag = 0;
        for (ColumnDefinition column : table.getColumns()) {
            final String colClass = getStrategy().getJavaClassName(column);
            final String colTypeFull = getJavaType(column.getType(resolver(out)), out);
            final String colType1 = out.ref(colTypeFull);
            if (key == column.getPrimaryKey()) {
                if (flag != size - 1) {
                    out.print("%s %s,", colType1, colClass);
                    flag++;
                } else {
                    out.println("%s %s){", colType1, colClass);
                }
            }
        }
        out.print("return this.ctx().selectFrom(%s).where(", tableIdentifier);
        int flag2 = 0;
        for (ColumnDefinition column : table.getColumns()) {
            final String colClass1 = getStrategy().getJavaClassName(column);
            final String colIdentifier1 = out.ref(getStrategy().getFullJavaIdentifier(column), colRefSegmentsMethod(column));
            if (key == column.getPrimaryKey()) {
                if (flag2 != size - 1) {
                    if (flag2 == 0) {
                        out.print("%s.eq(%s).and(", colIdentifier1, colClass1);
                    } else {
                        out.print("%s.eq(%s)).and(", colIdentifier1, colClass1);
                    }
                    flag2++;
                } else {
                    if (size == 1) {
                        out.println("%s.eq(%s)).fetchOneInto(%s.class);", colIdentifier1, colClass1, pType);
                        out.println("}");
                    } else {
                        out.println("%s.eq(%s))).fetchOneInto(%s.class);", colIdentifier1, colClass1, pType);
                        out.println("}");
                    }
                }
            }
        }

        //For Insert Method
        out.javadoc("Created custom Insert records Method");
        out.println("public %s insertRecord(%s classObject) {", pType, pType);
        out.println("%s record=this.ctx().newRecord(%s);", tableRecord, tableIdentifier);
        for (ColumnDefinition column : table.getColumns()) {
            final String colClass = getStrategy().getJavaClassName(column);
            if (size == 1) {
                if (key != column.getPrimaryKey()) {
                    out.println("record.set%s(classObject.get%s());", colClass, colClass);
                }
            } else {
                out.println("record.set%s(classObject.get%s());", colClass, colClass);
            }
        }
        out.println("record.store();");
        out.println("%s result=record.into(%s.class);", pType, pType);
        out.println("return result;");
        out.println("}");


        if (size > 1) {
            //For Update COMPOSITE KEYS
            out.javadoc("Created custom Update record Method");
            out.println("public int updateRecord(%s classObject){", pType);
            out.println("int result=this.ctx().update(%s)", tableIdentifier);
            for (ColumnDefinition column1 : table.getColumns()) {
                final String colClass1 = getStrategy().getJavaClassName(column1);
                final String colIdentifier1 = out.ref(getStrategy().getFullJavaIdentifier(column1), colRefSegmentsMethod(column1));
                if (key != column1.getPrimaryKey()) {
                    out.println(".set(%s,classObject.get%s())", colIdentifier1, colClass1);
                }
            }
            out.print(".where(");
            int flag1 = 0;
            for (ColumnDefinition column : table.getColumns()) {
                final String colClass1 = getStrategy().getJavaClassName(column);
                final String colIdentifier1 = out.ref(getStrategy().getFullJavaIdentifier(column), colRefSegmentsMethod(column));

                if (key == column.getPrimaryKey()) {
                    if (flag1 != size - 1) {
                        if (flag1 == 0) {
                            out.print("%s.eq(classObject.get%s()).and(", colIdentifier1, colClass1);
                        } else {
                            out.print("%s.eq(classObject.get%s())).and(", colIdentifier1, colClass1);
                        }
                        flag1++;
                    } else {
                        out.println("%s.eq(classObject.get%s()))).execute();", colIdentifier1, colClass1, pType);
                        out.println("return result;");
                        out.println("}");
                    }
                }
            }
            //For Delete COMPOSITE KEYS
            out.javadoc("Created custom Delete method ");
            out.print("public int deleteRecord(");
            int flag5 = 0;
            for (ColumnDefinition column : table.getColumns()) {
                final String colClass = getStrategy().getJavaClassName(column);
                final String colTypeFull = getJavaType(column.getType(resolver(out)), out);
                final String colType1 = out.ref(colTypeFull);
                if (key == column.getPrimaryKey()) {
                    if (flag5 != size - 1) {
                        out.print("%s %s,", colType1, colClass);
                        flag5++;
                    } else {
                        out.println("%s %s){", colType1, colClass);
                    }
                }
            }
            out.print("return this.ctx().deleteFrom(%s).where(", tableIdentifier);
            int flag6 = 0;
            for (ColumnDefinition column : table.getColumns()) {
                final String colClass1 = getStrategy().getJavaClassName(column);
                final String colIdentifier1 = out.ref(getStrategy().getFullJavaIdentifier(column), colRefSegmentsMethod(column));
                if (key == column.getPrimaryKey()) {
                    if (flag6 != size - 1) {
                        if (flag6 == 0) {
                            out.print("%s.eq(%s).and(", colIdentifier1, colClass1);
                        } else {
                            out.print("%s.eq(%s)).and(", colIdentifier1, colClass1);
                        }
                        flag6++;
                    } else {
                        out.println("%s.eq(%s))).execute();", colIdentifier1, colClass1, pType);
                        out.println("}");
                    }
                }
            }
        } else {
            //For Delete single primary key
            for (ColumnDefinition column : table.getColumns()) {
                final String colClass = getStrategy().getJavaClassName(column);
                final String colTypeFull = getJavaType(column.getType(resolver(out)), out);
                final String colType = out.ref(colTypeFull);
                final String colIdentifier = out.ref(getStrategy().getFullJavaIdentifier(column), colRefSegmentsMethod(column));
                if (key == column.getPrimaryKey()) {
                    out.javadoc("Created custom Delete record Method");
                    out.println("public int deleteRecord(%s %s){", colType, colClass);
                    out.println("int result=this.ctx().deleteFrom(%s).where(%s.eq(%s)).execute();", tableIdentifier, colIdentifier, colClass);
                    out.println("return result;");
                    out.println("}");
                }
            }
            ColumnDefinition column = table.getColumns().get(0);
            final String colClass = getStrategy().getJavaClassName(column);
            final String colIdentifier = out.ref(getStrategy().getFullJavaIdentifier(column), colRefSegmentsMethod(column));
            //For update single primary key
            out.javadoc("Created custom Update record Method");
            out.println("public int updateRecord(%s classObject){", pType);
            out.println("int result=this.ctx().update(%s)", tableIdentifier);
            for (ColumnDefinition column1 : table.getColumns()) {
                final String colClass1 = getStrategy().getJavaClassName(column1);
                final String colIdentifier1 = out.ref(getStrategy().getFullJavaIdentifier(column1), colRefSegmentsMethod(column1));
                if (key != column1.getPrimaryKey()) {
                    out.println(".set(%s,classObject.get%s())", colIdentifier1, colClass1);
                }
            }
            out.println(".where(%s.eq(classObject.get%s())).execute();", colIdentifier, colClass);
            out.println("return result;");
            out.println("}");

        }
        generateDaoClassFooter(table, out);
        out.println("}");
    }

    protected String ref(String clazzOrId, int keepSegments) {
        return clazzOrId == null ? null : ref(Arrays.asList(clazzOrId), keepSegments).get(0);
    }


    protected List<String> ref(List<String> clazzOrId, int keepSegments) {
        return clazzOrId == null ? Collections.emptyList() : clazzOrId;
    }

    //
//    /**
//     * Subclasses may override this method to provide alternative DAO
//     * constructor annotations, such as DI annotations. [#10801]
//     */
    protected void printDaoConstructorAnnotations(TableDefinition table, JavaWriter out) {
        if (generateSpringAnnotations()) {
            out.println("@%s", out.ref("org.springframework.beans.factory.annotation.Autowired"));
        }
    }


    private int colRefSegmentsMethod(Definition column) {
        if (column instanceof TypedElementDefinition && ((TypedElementDefinition<?>) column).getContainer() instanceof UDTDefinition) {
            return 2;
        }
        if (!getStrategy().getInstanceFields()) {
            return 2;
        }

        return 3;
    }


}
