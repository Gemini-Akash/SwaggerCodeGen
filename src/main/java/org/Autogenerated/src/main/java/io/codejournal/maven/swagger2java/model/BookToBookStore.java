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
 * BookToBookStore
 */
@Validated
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2022-09-09T15:04:09.579+05:30")


public class BookToBookStore   {
  @JsonProperty("NAME")
  private String NAME = null;

  @JsonProperty("BOOK_ID")
  private Long BOOK_ID = null;

  @JsonProperty("STOCK")
  private Long STOCK = null;

  public BookToBookStore NAME(String NAME) {
    this.NAME = NAME;
    return this;
  }

  /**
   * Get NAME
   * @return NAME
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public String getNAME() {
    return NAME;
  }

  public void setNAME(String NAME) {
    this.NAME = NAME;
  }

  public BookToBookStore BOOK_ID(Long BOOK_ID) {
    this.BOOK_ID = BOOK_ID;
    return this;
  }

  /**
   * Get BOOK_ID
   * @return BOOK_ID
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public Long getBOOKID() {
    return BOOK_ID;
  }

  public void setBOOKID(Long BOOK_ID) {
    this.BOOK_ID = BOOK_ID;
  }

  public BookToBookStore STOCK(Long STOCK) {
    this.STOCK = STOCK;
    return this;
  }

  /**
   * Get STOCK
   * @return STOCK
  **/
  @ApiModelProperty(required = true, value = "")
  @NotNull


  public Long getSTOCK() {
    return STOCK;
  }

  public void setSTOCK(Long STOCK) {
    this.STOCK = STOCK;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    BookToBookStore bookToBookStore = (BookToBookStore) o;
    return Objects.equals(this.NAME, bookToBookStore.NAME) &&
        Objects.equals(this.BOOK_ID, bookToBookStore.BOOK_ID) &&
        Objects.equals(this.STOCK, bookToBookStore.STOCK);
  }

  @Override
  public int hashCode() {
    return Objects.hash(NAME, BOOK_ID, STOCK);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class BookToBookStore {\n");
    
    sb.append("    NAME: ").append(toIndentedString(NAME)).append("\n");
    sb.append("    BOOK_ID: ").append(toIndentedString(BOOK_ID)).append("\n");
    sb.append("    STOCK: ").append(toIndentedString(STOCK)).append("\n");
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

