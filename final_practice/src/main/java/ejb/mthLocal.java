/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/SessionLocal.java to edit this template
 */
package ejb;

import entity.Course;
import javax.ejb.Local;
import entity.StudentMaster;
import java.util.Collection;
/**
 *
 * @author Acer
 */
@Local
public interface mthLocal {
    public void addstudent(String name , Integer cid);
    public void updatestudent(Integer id , String name , Integer cid);
    public Collection<StudentMaster> dis();
    public Collection<Course> cdis();
    public void del(Integer id);
}
