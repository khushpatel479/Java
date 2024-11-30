
package clients;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ManagedBean;
import ejb.mthLocal;
import entity.Course;
import entity.StudentMaster;
import java.util.Collection;
import javax.ejb.EJB;
@ManagedBean(name="ii")
@SessionScoped

public class calls {
    @EJB
    mthLocal em;
    Integer studentId,courseId;
    String studentName;
    Collection<StudentMaster> sm;
    Collection<Course> cm;

    StudentMaster curr;
    public String add()
    {
       
        em.addstudent(studentName, courseId);
        return "OK";
    }
    public String upd()
    {
        studentId = curr.getStudentId();
        studentName = curr.getStudentName();
        courseId = curr.getCourseId().getCourseId();
        em.updatestudent(studentId, studentName, courseId);
        return "OK";
    }
    public String del()
    {
        studentId = curr.getStudentId();
        em.del(studentId);
        return "dele";
    }
    public void dis()
    {
        sm=em.dis();
    }
    public void cdis()
    {
        cm=em.cdis();
    }
    
    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }
    public StudentMaster getCurr()
    {
        return curr;
    }
    public void setCurr(StudentMaster curr)
    {
        this.curr = curr;
    }
  public Collection<StudentMaster> getSm()
  {
      return sm;
  }
   public Collection<Course> getCm()
  {
      return cm;
  }
  public String nav()
  {
      return "upd1?faces-redirect=true";
  }
}
