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
 * Author
 */
@Validated
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2022-09-08T20:47:09.323+05:30")


public class Author   {
  @JsonProperty("ID")
  private Long ID = null;

  @JsonProperty("FIRST_NAME")
  private String FIRST_NAME = null;

  @JsonProperty("LAST_NAME")
  private String LAST_NAME = null;

  @JsonProperty("DATE_OF_BIRTH")
  private String DATE_OF_BIRTH = null;

  @JsonProperty("YEAR_OF_BIRTH")
  private Long YEAR_OF_BIRTH = null;

  @JsonProperty("DISTINGUISHED")
  private String DISTINGUISHED = null;

  public Author ID(Long ID) {
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

  public Author FIRST_NAME(String FIRST_NAME) {
    this.FIRST_NAME = FIRST_NAME;
    return this;
  }

  /**
   * Get FIRST_NAME
   * @return FIRST_NAME
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getFIRSTNAME() {
    return FIRST_NAME;
  }

  public void setFIRSTNAME(String FIRST_NAME) {
    this.FIRST_NAME = FIRST_NAME;
  }

  public Author LAST_NAME(String LAST_NAME) {
    this.LAST_NAME = LAST_NAME;
    return this;
  }

  /**
   * Get LAST_NAME
   * @return LAST_NAME
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getLASTNAME() {
    return LAST_NAME;
  }

  public void setLASTNAME(String LAST_NAME) {
    this.LAST_NAME = LAST_NAME;
  }

  public Author DATE_OF_BIRTH(String DATE_OF_BIRTH) {
    this.DATE_OF_BIRTH = DATE_OF_BIRTH;
    return this;
  }

  /**
   * Get DATE_OF_BIRTH
   * @return DATE_OF_BIRTH
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getDATEOFBIRTH() {
    return DATE_OF_BIRTH;
  }

  public void setDATEOFBIRTH(String DATE_OF_BIRTH) {
    this.DATE_OF_BIRTH = DATE_OF_BIRTH;
  }

  public Author YEAR_OF_BIRTH(Long YEAR_OF_BIRTH) {
    this.YEAR_OF_BIRTH = YEAR_OF_BIRTH;
    return this;
  }

  /**
   * Get YEAR_OF_BIRTH
   * @return YEAR_OF_BIRTH
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public Long getYEAROFBIRTH() {
    return YEAR_OF_BIRTH;
  }

  public void setYEAROFBIRTH(Long YEAR_OF_BIRTH) {
    this.YEAR_OF_BIRTH = YEAR_OF_BIRTH;
  }

  public Author DISTINGUISHED(String DISTINGUISHED) {
    this.DISTINGUISHED = DISTINGUISHED;
    return this;
  }

  /**
   * Get DISTINGUISHED
   * @return DISTINGUISHED
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getDISTINGUISHED() {
    return DISTINGUISHED;
  }

  public void setDISTINGUISHED(String DISTINGUISHED) {
    this.DISTINGUISHED = DISTINGUISHED;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Author author = (Author) o;
    return Objects.equals(this.ID, author.ID) &&
        Objects.equals(this.FIRST_NAME, author.FIRST_NAME) &&
        Objects.equals(this.LAST_NAME, author.LAST_NAME) &&
        Objects.equals(this.DATE_OF_BIRTH, author.DATE_OF_BIRTH) &&
        Objects.equals(this.YEAR_OF_BIRTH, author.YEAR_OF_BIRTH) &&
        Objects.equals(this.DISTINGUISHED, author.DISTINGUISHED);
  }

  @Override
  public int hashCode() {
    return Objects.hash(ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, YEAR_OF_BIRTH, DISTINGUISHED);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Author {\n");
    
    sb.append("    ID: ").append(toIndentedString(ID)).append("\n");
    sb.append("    FIRST_NAME: ").append(toIndentedString(FIRST_NAME)).append("\n");
    sb.append("    LAST_NAME: ").append(toIndentedString(LAST_NAME)).append("\n");
    sb.append("    DATE_OF_BIRTH: ").append(toIndentedString(DATE_OF_BIRTH)).append("\n");
    sb.append("    YEAR_OF_BIRTH: ").append(toIndentedString(YEAR_OF_BIRTH)).append("\n");
    sb.append("    DISTINGUISHED: ").append(toIndentedString(DISTINGUISHED)).append("\n");
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

