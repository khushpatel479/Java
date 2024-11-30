/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/SessionLocal.java to edit this template
 */
package ejb;
import entity.Category;
import entity.Lg;
import entity.Product;
import java.util.Collection;
import javax.ejb.Local;

/**
 *
 * @author Acer
 */
@Local
public interface methodsLocal {
    public void adduser(String name , String pass);
    public Collection<Lg> displayuser();
    public void updateuser(Integer id,String name , String pass);
    public boolean lg(String uname , String pass);
    public void addcat(Integer id , String name);
    public Collection<Category> displaycat(Integer id);
    public void delcategory(Integer id);
    public void updcat(Integer id,String name);
    public void addproduct(String name , Integer cid , Integer prize);
    
}
