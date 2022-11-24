/*
 * This file is generated by jOOQ.
 */
package entity.demo.tables.records;


import entity.demo.tables.Author;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record6;
import org.jooq.Row6;
import org.jooq.impl.UpdatableRecordImpl;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.beans.ConstructorProperties;
import java.time.LocalDate;


/**
 * This class is generated by jOOQ.
 */
@SuppressWarnings({"all", "unchecked", "rawtypes"})
@Entity
@Table(
        name = "AUTHOR",
        schema = "DEMO",
        uniqueConstraints = {
                @UniqueConstraint(name = "CONSTRAINT_7", columnNames = {"ID"})
        }
)
public class AuthorRecord extends UpdatableRecordImpl<AuthorRecord> implements Record6<Integer, String, String, LocalDate, Integer, Byte> {

    private static final long serialVersionUID = 1L;

    /**
     * Create a detached AuthorRecord
     */
    public AuthorRecord() {
        super(Author.AUTHOR);
    }

    /**
     * Create a detached, initialised AuthorRecord
     */
    @ConstructorProperties({"Id", "FirstName", "LastName", "DateOfBirth", "YearOfBirth", "Distinguished"})
    public AuthorRecord(Integer Id, String FirstName, String LastName, LocalDate DateOfBirth, Integer YearOfBirth, Byte Distinguished) {
        super(Author.AUTHOR);

        setId(Id);
        setFirstName(FirstName);
        setLastName(LastName);
        setDateOfBirth(DateOfBirth);
        setYearOfBirth(YearOfBirth);
        setDistinguished(Distinguished);
    }

    /**
     * Getter for <code>DEMO.AUTHOR.ID</code>.
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false, precision = 7)
    public Integer getId() {
        return (Integer) get(0);
    }

    /**
     * Setter for <code>DEMO.AUTHOR.ID</code>.
     */
    public void setId(Integer value) {
        set(0, value);
    }

    /**
     * Getter for <code>DEMO.AUTHOR.FIRST_NAME</code>.
     */
    @Column(name = "FIRST_NAME", length = 50)
    @Size(max = 50)
    public String getFirstName() {
        return (String) get(1);
    }

    /**
     * Setter for <code>DEMO.AUTHOR.FIRST_NAME</code>.
     */
    public void setFirstName(String value) {
        set(1, value);
    }

    /**
     * Getter for <code>DEMO.AUTHOR.LAST_NAME</code>.
     */
    @Column(name = "LAST_NAME", nullable = false, length = 50)
    @NotNull
    @Size(max = 50)
    public String getLastName() {
        return (String) get(2);
    }

    /**
     * Setter for <code>DEMO.AUTHOR.LAST_NAME</code>.
     */
    public void setLastName(String value) {
        set(2, value);
    }

    /**
     * Getter for <code>DEMO.AUTHOR.DATE_OF_BIRTH</code>.
     */
    @Column(name = "DATE_OF_BIRTH", precision = 10)
    public LocalDate getDateOfBirth() {
        return (LocalDate) get(3);
    }

    /**
     * Setter for <code>DEMO.AUTHOR.DATE_OF_BIRTH</code>.
     */
    public void setDateOfBirth(LocalDate value) {
        set(3, value);
    }

    /**
     * Getter for <code>DEMO.AUTHOR.YEAR_OF_BIRTH</code>.
     */
    @Column(name = "YEAR_OF_BIRTH", precision = 7)
    public Integer getYearOfBirth() {
        return (Integer) get(4);
    }

    /**
     * Setter for <code>DEMO.AUTHOR.YEAR_OF_BIRTH</code>.
     */
    public void setYearOfBirth(Integer value) {
        set(4, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>DEMO.AUTHOR.DISTINGUISHED</code>.
     */
    @Column(name = "DISTINGUISHED", precision = 1)
    public Byte getDistinguished() {
        return (Byte) get(5);
    }

    // -------------------------------------------------------------------------
    // Record6 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>DEMO.AUTHOR.DISTINGUISHED</code>.
     */
    public void setDistinguished(Byte value) {
        set(5, value);
    }

    @Override
    public Record1<Integer> key() {
        return (Record1) super.key();
    }

    @Override
    public Row6<Integer, String, String, LocalDate, Integer, Byte> fieldsRow() {
        return (Row6) super.fieldsRow();
    }

    @Override
    public Row6<Integer, String, String, LocalDate, Integer, Byte> valuesRow() {
        return (Row6) super.valuesRow();
    }

    @Override
    public Field<Integer> field1() {
        return Author.AUTHOR.ID;
    }

    @Override
    public Field<String> field2() {
        return Author.AUTHOR.FIRST_NAME;
    }

    @Override
    public Field<String> field3() {
        return Author.AUTHOR.LAST_NAME;
    }

    @Override
    public Field<LocalDate> field4() {
        return Author.AUTHOR.DATE_OF_BIRTH;
    }

    @Override
    public Field<Integer> field5() {
        return Author.AUTHOR.YEAR_OF_BIRTH;
    }

    @Override
    public Field<Byte> field6() {
        return Author.AUTHOR.DISTINGUISHED;
    }

    @Override
    public Integer component1() {
        return getId();
    }

    @Override
    public String component2() {
        return getFirstName();
    }

    @Override
    public String component3() {
        return getLastName();
    }

    @Override
    public LocalDate component4() {
        return getDateOfBirth();
    }

    @Override
    public Integer component5() {
        return getYearOfBirth();
    }

    @Override
    public Byte component6() {
        return getDistinguished();
    }

    @Override
    public Integer value1() {
        return getId();
    }

    @Override
    public String value2() {
        return getFirstName();
    }

    @Override
    public String value3() {
        return getLastName();
    }

    @Override
    public LocalDate value4() {
        return getDateOfBirth();
    }

    @Override
    public Integer value5() {
        return getYearOfBirth();
    }

    @Override
    public Byte value6() {
        return getDistinguished();
    }

    @Override
    public AuthorRecord value1(Integer value) {
        setId(value);
        return this;
    }

    @Override
    public AuthorRecord value2(String value) {
        setFirstName(value);
        return this;
    }

    @Override
    public AuthorRecord value3(String value) {
        setLastName(value);
        return this;
    }

    @Override
    public AuthorRecord value4(LocalDate value) {
        setDateOfBirth(value);
        return this;
    }

    @Override
    public AuthorRecord value5(Integer value) {
        setYearOfBirth(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public AuthorRecord value6(Byte value) {
        setDistinguished(value);
        return this;
    }

    @Override
    public AuthorRecord values(Integer value1, String value2, String value3, LocalDate value4, Integer value5, Byte value6) {
        value1(value1);
        value2(value2);
        value3(value3);
        value4(value4);
        value5(value5);
        value6(value6);
        return this;
    }
}
