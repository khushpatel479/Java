/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/StatelessEjbClass.java to edit this template
 */
package ejb;

import entity.Lg;
import java.util.Collection;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import entity.Category;
import entity.Lg;
import entity.Product;
/**
 *
 * @author Acer
 */
@Stateless
public class methods implements methodsLocal {
@PersistenceContext(unitName = "podpu")EntityManager em;
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    @Override
    public void adduser(String name, String pass) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
Lg nm = new Lg();
nm.setUname(name);
nm.setPass(pass);
em.persist(nm);
    }

    @Override
    public Collection<Lg> displayuser() {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
return em.createNamedQuery("Lg.findAll").getResultList();
   }

    @Override
    public void updateuser(Integer id, String name, String pass) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
Lg hj = em.find(Lg.class, id);
hj.setUname(name);
hj.setPass(pass);
em.merge(hj);
   
   }

    @Override
    public boolean lg(String uname, String pass) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
Lg nm =(Lg)em.createNamedQuery("Lg.login").setParameter("uname", uname).setParameter("pass", pass).getSingleResult();
return nm!=null;
    }

    @Override
    public void addcat(Integer id, String name) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
Category nm = new Category();
nm.setId(id);
nm.setName(name);
em.persist(nm);
    }

    @Override
    public Collection<Category> displaycat(Integer id) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
return em.createNamedQuery("Category.findById").setParameter("id", id).getResultList();
    }

    @Override
    public void delcategory(Integer id) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
Category bn = (Category) em.find(Category.class, id);
em.remove(bn);
    }

    @Override
    public void updcat(Integer id,String name) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
Category bn = em.find(Category.class, id);
bn.setName(name);
em.merge(bn);
    }

    @Override
    public void addproduct(String name, Integer cid, Integer prize) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody

Category c = em.find(Category.class, cid);
Collection<Product> co = c.getProductCollection();
Product bn = new Product();
bn.setPname(name);
bn.setCid(c);
bn.setPprize(prize);
c.setProductCollection(co);
em.persist(bn);
em.merge(c);
    }
}
