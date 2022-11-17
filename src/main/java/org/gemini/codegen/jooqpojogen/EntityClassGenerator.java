package org.gemini.codegen.jooqpojogen;

import org.gemini.codegen.apicodegen.validator.PathValidator;
import org.jooq.codegen.GenerationTool;
import org.jooq.meta.jaxb.*;


/**
 * This Class is for the Entity and POJOs class generation with the help of this class we can generate the required classes.
 */
public final class EntityClassGenerator {


    /**
     * This Method will create the Entity and POJOs class with the given script,
     * and also add the annotations acc. to the script,
     * and store the classes with the given package name and directory.
     * This Method also Validates the paths given by the Users.
     * Return NULL
     *
     * @param scriptPath  Containing the path of script
     * @param packageName Containing the package name
     * @param directory   Containing the directory where it stores the classes
     * @return null
     */

    public static void EntityGenerator(String scriptPath, String packageName, String directory) throws Exception {

        boolean scriptResult = PathValidator.isValidPath(scriptPath);
        boolean directoryResult = PathValidator.isValidPath(directory);

        if (!scriptResult) {
            throw new FileNotFoundException("Script Not found....");
        }

        if (!directoryResult) {
            throw new FileNotFoundException("Directory Not found....");
        }

        Configuration configuration = new Configuration();

        configuration.withGenerator(new Generator()
                .withName(CustomJooqAutoGenerator.class.getCanonicalName())
                .withStrategy(new Strategy()
                        .withMatchers(new Matchers()
                                .withFields(
                                        new MatchersFieldType()
                                                .withFieldMember(new MatcherRule()
                                                        .withTransform(MatcherTransformType.PASCAL))

                                )))
                .withDatabase(new Database()
                        .withName("org.jooq.meta.extensions.ddl.DDLDatabase")
                        .withProperties(new Property().
                                withKey("scripts").
                                withValue(scriptPath)
                        )
                )
                .withGenerate(new Generate()
                        .withPojos(true)
                        .withDaos(true)
                        .withSpringAnnotations(true)
                        .withJpaAnnotations(true)
                        .withJpaVersion(String.valueOf(2.2))
                        .withValidationAnnotations(true)
                        .withConstructorPropertiesAnnotation(true)
                        .withConstructorPropertiesAnnotationOnPojos(true)
                )
                .withTarget(new Target()
                        .withPackageName(packageName)
                        .withDirectory(directory))

        ).withOnError(OnError.FAIL);
        GenerationTool.generate(configuration);
    }
}
