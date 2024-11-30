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
@Table(name = "student_subject")
@NamedQueries({
    @NamedQuery(name = "StudentSubject.findAll", query = "SELECT s FROM StudentSubject s"),
    @NamedQuery(name = "StudentSubject.findById", query = "SELECT s FROM StudentSubject s WHERE s.id = :id"),
    @NamedQuery(name = "StudentSubject.findByStudentName", query = "SELECT s FROM StudentSubject s WHERE s.studentName = :studentName"),
    @NamedQuery(name = "StudentSubject.findByCourseName", query = "SELECT s FROM StudentSubject s WHERE s.courseName = :courseName"),
    @NamedQuery(name = "StudentSubject.findBySubjectName", query = "SELECT s FROM StudentSubject s WHERE s.subjectName = :subjectName")})
public class StudentSubject implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "student_name")
    private String studentName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "course_name")
    private String courseName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "subject_name")
    private String subjectName;

    public StudentSubject() {
    }

    public StudentSubject(Integer id) {
        this.id = id;
    }

    public StudentSubject(Integer id, String studentName, String courseName, String subjectName) {
        this.id = id;
        this.studentName = studentName;
        this.courseName = courseName;
        this.subjectName = subjectName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
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
        if (!(object instanceof StudentSubject)) {
            return false;
        }
        StudentSubject other = (StudentSubject) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.StudentSubject[ id=" + id + " ]";
    }
    
}
