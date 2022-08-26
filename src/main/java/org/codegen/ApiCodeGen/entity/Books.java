package org.codegen.ApiCodeGen.entity;


import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;


/**
 * This class is generated by jOOQ.
 */
@SuppressWarnings({ "all", "unchecked", "rawtypes" })
@Entity
public class Books implements Serializable {
    private static final long serialVersionUID = 1L;


    private String  name;


    private Integer id;


    @Id
    private Integer bookid;

    public Books() {}

    public Books(Books value) {
        this.id = value.id;
        this.name = value.name;
        this.bookid = value.bookid;
    }

    public Books(
            Integer id,
            String  name,
            Integer studentId
    ) {
        this.id = id;
        this.name = name;
        this.bookid = studentId;
    }

    /**
     * Getter for <code>users.books.id</code>.
     */
    public Integer getId() {
        return this.id;
    }

    /**
     * Setter for <code>users.books.id</code>.
     */
    public Books setId(Integer id) {
        this.id = id;
        return this;
    }

    /**
     * Getter for <code>users.books.name</code>.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Setter for <code>users.books.name</code>.
     */
    public Books setName(String name) {
        this.name = name;
        return this;
    }

    /**
     * Getter for <code>users.books.student_id</code>.
     */

    public Integer getBookid() {
        return this.bookid;
    }

    /**
     * Setter for <code>users.books.student_id</code>.
     */
    public Books setBookid(Integer bookid) {
        this.bookid = bookid;
        return this;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final Books other = (Books) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        }
        else if (!id.equals(other.id))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        }
        else if (!name.equals(other.name))
            return false;
        if (bookid == null) {
            if (other.bookid != null)
                return false;
        }
        else if (!bookid.equals(other.bookid))
            return false;
        return true;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((this.id == null) ? 0 : this.id.hashCode());
        result = prime * result + ((this.name == null) ? 0 : this.name.hashCode());
        result = prime * result + ((this.bookid == null) ? 0 : this.bookid.hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("Books (");

        sb.append(id);
        sb.append(", ").append(name);
        sb.append(", ").append(bookid);

        sb.append(")");
        return sb.toString();
    }
}


