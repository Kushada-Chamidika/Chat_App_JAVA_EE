package POJOFiles;
// Generated Jan 18, 2021 11:09:38 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Activestatus generated by hbm2java
 */
public class Activestatus  implements java.io.Serializable {


     private Integer idactiveStatus;
     private String email;
     private String status;
     private Date lastSeen;
     private int isActive;

    public Activestatus() {
    }

    public Activestatus(String email, String status, Date lastSeen, int isActive) {
       this.email = email;
       this.status = status;
       this.lastSeen = lastSeen;
       this.isActive = isActive;
    }
   
    public Integer getIdactiveStatus() {
        return this.idactiveStatus;
    }
    
    public void setIdactiveStatus(Integer idactiveStatus) {
        this.idactiveStatus = idactiveStatus;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public Date getLastSeen() {
        return this.lastSeen;
    }
    
    public void setLastSeen(Date lastSeen) {
        this.lastSeen = lastSeen;
    }
    public int getIsActive() {
        return this.isActive;
    }
    
    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }




}


