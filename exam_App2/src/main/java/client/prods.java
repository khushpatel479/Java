/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package client;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import ejb.methodsLocal;
import entity.Category;
import javax.ejb.EJB;
@ManagedBean(name = "op")
@RequestScoped
public class prods {
    @EJB
    methodsLocal bn;
    String pname;
    Integer pid;
    Integer cid;
    Integer pprize;
    
    public String add()
    {
       bn.addproduct(pname, cid, pprize);
       return "ok";
       
    }
    
    
    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Integer getPprize() {
        return pprize;
    }

    public void setPprize(Integer pprize) {
        this.pprize = pprize;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    
    
    
}
