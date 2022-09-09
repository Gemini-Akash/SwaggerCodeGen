package org.codegen.ApiCodeGen.templateHandler;

import com.github.jknack.handlebars.Handlebars;
import com.github.jknack.handlebars.Template;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;



public class Handlebar {
    private static final Logger log = LoggerFactory.getLogger(Handlebar.class);
    public static String SwaggerYaml()
    {
        try
        {
            Handlebars handlebars = new Handlebars();
            Template template = handlebars.compile("\\HandlebarTemplates\\swaggerTemplate");
            Path path1 = Paths.get("D:\\Internal\\SwaggerCodeGen\\src\\main\\resources");
            String filename = "SwaggerYaml" + ".yml";
            String path = path1 + File.separator + filename;
            FileReader fileReader = new FileReader("D:\\Internal\\SwaggerCodeGen\\src\\main\\java\\org\\codegen\\ApiCodeGen\\jsonFiles\\SwaggerJson.json");
            JSONParser jsonParser = new JSONParser();
            Object obj = jsonParser.parse(fileReader);
            FileWriter fileWriter =new FileWriter(path);
            fileWriter.write(template.apply(obj));
            fileWriter.close();
            return path;
        }
        catch (Exception e)
        {
            log.error("Exception in SwaggerYaml() :{}", e.getMessage());
        }
        return null;
    }
    public static void main(String[] args) {
        SwaggerYaml();

    }
}
