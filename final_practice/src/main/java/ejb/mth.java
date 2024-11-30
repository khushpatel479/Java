
package ejb;

import javax.ejb.Stateless;
import entity.Course;
import entity.StudentMaster;
import java.util.Collection;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless
public class mth implements mthLocal {
@PersistenceContext(unitName = "vb")EntityManager em;

    @Override
    public void addstudent(String name, Integer cid) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
StudentMaster sm = new StudentMaster();
Course cm = em.find(Course.class, cid);
Collection<StudentMaster> vb = cm.getStudentMasterCollection();
sm.setStudentName(name);
sm.setCourseId(cm);
cm.setStudentMasterCollection(vb);
em.persist(sm);
em.merge(cm);
    
   }

    @Override
    public void updatestudent(Integer id, String name, Integer cid) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
StudentMaster sm = em.find(StudentMaster.class, id);
Course cm = em.find(Course.class, cid);
Collection<StudentMaster> cv = cm.getStudentMasterCollection();
sm.setStudentName(name);
sm.setCourseId(cm);
cm.setStudentMasterCollection(cv);
em.merge(sm);
em.merge(cm);
    }

    @Override
    public Collection<StudentMaster> dis() {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
return em.createNamedQuery("StudentMaster.findAll").getResultList();
    }

    @Override
    public Collection<Course> cdis() {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
return em.createNamedQuery("Course.findAll").getResultList();
    }

    @Override
    public void del(Integer id) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
StudentMaster ms = em.find(StudentMaster.class, id);
em.remove(ms);
    }
   
}
