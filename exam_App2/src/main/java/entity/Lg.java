/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Acer
 */
@Entity
@Table(name = "lg")
@NamedQueries({
    @NamedQuery(name = "Lg.findAll", query = "SELECT l FROM Lg l"),
    @NamedQuery(name = "Lg.findById", query = "SELECT l FROM Lg l WHERE l.id = :id"),
    @NamedQuery(name = "Lg.findByUname", query = "SELECT l FROM Lg l WHERE l.uname = :uname"),
    @NamedQuery(name = "Lg.findByPass", query = "SELECT l FROM Lg l WHERE l.pass = :pass"),
    @NamedQuery(name = "Lg.login",query = "SELECT l FROM Lg l WHERE l.uname=:uname AND l.pass = :pass")
})
public class Lg implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "uname")
    private String uname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "pass")
    private String pass;

    public Lg() {
    }

    public Lg(Integer id) {
        this.id = id;
    }

    public Lg(Integer id, String uname, String pass) {
        this.id = id;
        this.uname = uname;
        this.pass = pass;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Lg)) {
            return false;
        }
        Lg other = (Lg) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Lg[ id=" + id + " ]";
    }
    
}
