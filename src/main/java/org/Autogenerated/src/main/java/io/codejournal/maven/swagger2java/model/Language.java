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
 * Language
 */
@Validated
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2022-09-08T20:47:09.323+05:30")


public class Language   {
  @JsonProperty("ID")
  private Long ID = null;

  @JsonProperty("CD")
  private String CD = null;

  @JsonProperty("DESCRIPTION")
  private String DESCRIPTION = null;

  public Language ID(Long ID) {
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

  public Language CD(String CD) {
    this.CD = CD;
    return this;
  }

  /**
   * Get CD
   * @return CD
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getCD() {
    return CD;
  }

  public void setCD(String CD) {
    this.CD = CD;
  }

  public Language DESCRIPTION(String DESCRIPTION) {
    this.DESCRIPTION = DESCRIPTION;
    return this;
  }

  /**
   * Get DESCRIPTION
   * @return DESCRIPTION
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getDESCRIPTION() {
    return DESCRIPTION;
  }

  public void setDESCRIPTION(String DESCRIPTION) {
    this.DESCRIPTION = DESCRIPTION;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Language language = (Language) o;
    return Objects.equals(this.ID, language.ID) &&
        Objects.equals(this.CD, language.CD) &&
        Objects.equals(this.DESCRIPTION, language.DESCRIPTION);
  }

  @Override
  public int hashCode() {
    return Objects.hash(ID, CD, DESCRIPTION);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Language {\n");
    
    sb.append("    ID: ").append(toIndentedString(ID)).append("\n");
    sb.append("    CD: ").append(toIndentedString(CD)).append("\n");
    sb.append("    DESCRIPTION: ").append(toIndentedString(DESCRIPTION)).append("\n");
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

