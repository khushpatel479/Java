/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package client;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import ejb.methodsLocal;
import entity.Lg;
import java.util.Collection;

@ManagedBean(name = "tm")
@RequestScoped
/**
 *
 * @author Acer
 */
public class cli {
    @EJB
    methodsLocal nm;
    String uname;
    String pass;
    Integer id;
    Collection<Lg> bn;
    
    public String add()
    {
        nm.adduser(uname, pass);
        return "Success";
    }
    public String upd()
    {
        nm.updateuser(id, uname, pass);
        return "UPD";
    }
    public void dis()
    {
       bn = nm.displayuser();
    }
    public String lg()
    {
        String ch;
//        nm.lg(uname, pass);
        if(nm.lg(uname, pass))
        {
            ch="ok";
        }
        else
        {
            ch="not ok";
        }
        return ch;
    }
    
//    getset
    
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
    public Collection<Lg> getBn()
    {
        return bn;
    }
}
