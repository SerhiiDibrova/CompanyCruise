package ua.training.model;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable {
    private final static long serialVersionUID = 1L;
    private int id;
    private String login;
    private String password;
    private String firstName;
    private String lastName;
    private String email;

    public enum Role {GUEST, USER, ADMIN}

    private Role role;
    private Date created;

    /*private List<Cruise> cruise;*/

    public User() {    }
    public User(int id){this.id=id;}
    public User( String login, String password, String firstName, String lastName, String email, Role role,Date created) {
        this.login = login;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.role = role;
        this.created = created;
    }

    public int getId() {
        return id;
    }

    public void setId(int user_id) {
        this.id = user_id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

 /*  public List<Cruise> getCruise() {
       return cruise;
   }

   public void setCruise(List<Cruise> cruise) {
        this.cruise = cruise;
    }*/


    @Override
    public String toString() {
        return "User{" +
                "user_id=" + id +
                ", login='" + login + '\'' +
                ", password='" + password + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", role=" + role +
                ", created=" + created +
                '}';
    }
}
