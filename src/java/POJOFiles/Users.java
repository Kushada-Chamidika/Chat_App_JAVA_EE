package POJOFiles;
// Generated Jan 18, 2021 11:09:38 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Users generated by hbm2java
 */
public class Users  implements java.io.Serializable {


     private Integer idusers;
     private String fullname;
     private String email;
     private String username;
     private String password;
     private Date dateCreated;
     private Integer isActive;

    public Users() {
    }

	
    public Users(String fullname, String email, String username, String password) {
        this.fullname = fullname;
        this.email = email;
        this.username = username;
        this.password = password;
    }
    public Users(String fullname, String email, String username, String password, Date dateCreated, Integer isActive) {
       this.fullname = fullname;
       this.email = email;
       this.username = username;
       this.password = password;
       this.dateCreated = dateCreated;
       this.isActive = isActive;
    }
   
    public Integer getIdusers() {
        return this.idusers;
    }
    
    public void setIdusers(Integer idusers) {
        this.idusers = idusers;
    }
    public String getFullname() {
        return this.fullname;
    }
    
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Date getDateCreated() {
        return this.dateCreated;
    }
    
    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }
    public Integer getIsActive() {
        return this.isActive;
    }
    
    public void setIsActive(Integer isActive) {
        this.isActive = isActive;
    }




}

