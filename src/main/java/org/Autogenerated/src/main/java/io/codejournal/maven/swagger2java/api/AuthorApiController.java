package io.codejournal.maven.swagger2java.api;

import io.codejournal.maven.swagger2java.model.Author;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.*;
import javax.validation.Valid;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2022-09-09T15:04:09.579+05:30")

@Controller
public class AuthorApiController implements AuthorApi {

    private static final Logger log = LoggerFactory.getLogger(AuthorApiController.class);

    private final ObjectMapper objectMapper;

    private final HttpServletRequest request;

    @org.springframework.beans.factory.annotation.Autowired
    public AuthorApiController(ObjectMapper objectMapper, HttpServletRequest request) {
        this.objectMapper = objectMapper;
        this.request = request;
    }

    public ResponseEntity<Void> addAuthor(@ApiParam(value = "Pet object that needs to be added to the store" ,required=true )  @Valid @RequestBody Author body) {
        String accept = request.getHeader("Accept");
        return new ResponseEntity<Void>(HttpStatus.NOT_IMPLEMENTED);
    }

    public ResponseEntity<Void> deleteAuthor(@ApiParam(value = "Pet Author to delete",required=true) @PathVariable("ID") Long ID) {
        String accept = request.getHeader("Accept");
        return new ResponseEntity<Void>(HttpStatus.NOT_IMPLEMENTED);
    }

    public ResponseEntity<Author> getAuthorByID(@ApiParam(value = "ID of Author to return",required=true) @PathVariable("ID") Long ID) {
        String accept = request.getHeader("Accept");
        if (accept != null && accept.contains("application/xml")) {
            try {
                return new ResponseEntity<Author>(objectMapper.readValue("<Author>  <ID>123456789</ID>  <FIRST_NAME>aeiou</FIRST_NAME>  <LAST_NAME>aeiou</LAST_NAME>  <DATE_OF_BIRTH>aeiou</DATE_OF_BIRTH>  <YEAR_OF_BIRTH>123456789</YEAR_OF_BIRTH>  <DISTINGUISHED>aeiou</DISTINGUISHED></Author>", Author.class), HttpStatus.NOT_IMPLEMENTED);
            } catch (IOException e) {
                log.error("Couldn't serialize response for content type application/xml", e);
                return new ResponseEntity<Author>(HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }

        if (accept != null && accept.contains("application/json")) {
            try {
                return new ResponseEntity<Author>(objectMapper.readValue("{\"empty\": false}", Author.class), HttpStatus.NOT_IMPLEMENTED);
            } catch (IOException e) {
                log.error("Couldn't serialize response for content type application/json", e);
                return new ResponseEntity<Author>(HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }

        return new ResponseEntity<Author>(HttpStatus.NOT_IMPLEMENTED);
    }

}
