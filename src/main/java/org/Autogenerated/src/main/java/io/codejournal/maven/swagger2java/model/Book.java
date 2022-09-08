package io.codejournal.maven.swagger2java.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.validation.annotation.Validated;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * Book
 */
@Validated
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2022-09-08T20:47:09.323+05:30")


public class Book   {
  @JsonProperty("ID")
  private Long ID = null;

  @JsonProperty("AUTHOR_ID")
  private Long AUTHOR_ID = null;

  @JsonProperty("TITLE")
  private String TITLE = null;

  @JsonProperty("PUBLISHED_IN")
  private Long PUBLISHED_IN = null;

  @JsonProperty("LANGUAGE_ID")
  private Long LANGUAGE_ID = null;

  public Book ID(Long ID) {
    this.ID = ID;
    return this;
  }

  /**
   * Get ID
   * @return ID
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public Long getID() {
    return ID;
  }

  public void setID(Long ID) {
    this.ID = ID;
  }

  public Book AUTHOR_ID(Long AUTHOR_ID) {
    this.AUTHOR_ID = AUTHOR_ID;
    return this;
  }

  /**
   * Get AUTHOR_ID
   * @return AUTHOR_ID
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public Long getAUTHORID() {
    return AUTHOR_ID;
  }

  public void setAUTHORID(Long AUTHOR_ID) {
    this.AUTHOR_ID = AUTHOR_ID;
  }

  public Book TITLE(String TITLE) {
    this.TITLE = TITLE;
    return this;
  }

  /**
   * Get TITLE
   * @return TITLE
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getTITLE() {
    return TITLE;
  }

  public void setTITLE(String TITLE) {
    this.TITLE = TITLE;
  }

  public Book PUBLISHED_IN(Long PUBLISHED_IN) {
    this.PUBLISHED_IN = PUBLISHED_IN;
    return this;
  }

  /**
   * Get PUBLISHED_IN
   * @return PUBLISHED_IN
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public Long getPUBLISHEDIN() {
    return PUBLISHED_IN;
  }

  public void setPUBLISHEDIN(Long PUBLISHED_IN) {
    this.PUBLISHED_IN = PUBLISHED_IN;
  }

  public Book LANGUAGE_ID(Long LANGUAGE_ID) {
    this.LANGUAGE_ID = LANGUAGE_ID;
    return this;
  }

  /**
   * Get LANGUAGE_ID
   * @return LANGUAGE_ID
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public Long getLANGUAGEID() {
    return LANGUAGE_ID;
  }

  public void setLANGUAGEID(Long LANGUAGE_ID) {
    this.LANGUAGE_ID = LANGUAGE_ID;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Book book = (Book) o;
    return Objects.equals(this.ID, book.ID) &&
        Objects.equals(this.AUTHOR_ID, book.AUTHOR_ID) &&
        Objects.equals(this.TITLE, book.TITLE) &&
        Objects.equals(this.PUBLISHED_IN, book.PUBLISHED_IN) &&
        Objects.equals(this.LANGUAGE_ID, book.LANGUAGE_ID);
  }

  @Override
  public int hashCode() {
    return Objects.hash(ID, AUTHOR_ID, TITLE, PUBLISHED_IN, LANGUAGE_ID);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Book {\n");
    
    sb.append("    ID: ").append(toIndentedString(ID)).append("\n");
    sb.append("    AUTHOR_ID: ").append(toIndentedString(AUTHOR_ID)).append("\n");
    sb.append("    TITLE: ").append(toIndentedString(TITLE)).append("\n");
    sb.append("    PUBLISHED_IN: ").append(toIndentedString(PUBLISHED_IN)).append("\n");
    sb.append("    LANGUAGE_ID: ").append(toIndentedString(LANGUAGE_ID)).append("\n");
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(java.lang.Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }
}

