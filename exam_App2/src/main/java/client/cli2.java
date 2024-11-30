/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package client;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import entity.Category;
import ejb.methodsLocal;
import java.util.Collection;
import javax.ejb.EJB;
@ManagedBean(name = "tt")
@RequestScoped
public class cli2 {
    @EJB
    methodsLocal nm;
    Integer id;
    String name;
    Collection<Category> vb;
    public String add()
    {
        nm.addcat(id, name);
        return "ok";
    }
    public void dis()
    {
        vb=nm.displaycat(id);
        
    }
    public void upd()
    {
        nm.updcat(id, name);
        
    }
    
    public String del()
    {
        nm.delcategory(id);
        return "ol";
    }
    
    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public Collection getVb()
    {
        return vb;
    }
}
