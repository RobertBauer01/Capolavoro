package it.beta80group.stud.model;

import java.sql.Date;

public class User {

    private Long idUser;
    private String username;
    private String password;
    private Long rl;
    private String name;
    private String surname;
    private Date dt;
    private Long totTask;
    private Long totTaskDone;

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRl(Long rl) {
        this.rl = rl;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public void setDt(Date dt) {
        this.dt = dt;
    }


    public Long getIdUser() {
        return idUser;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public Long getRl() {
        return rl;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public Date getDt() {
        return  dt;
    }

    public void setTotTask(Long totTask) {
        this.totTask = totTask;
    }

    public void setTotTaskDone(Long totTaskDone) {
        this.totTaskDone = totTaskDone;
    }

    public Long getTotTask() {
        return totTask;
    }

    public Long getTotTaskDone() {
        return totTaskDone;
    }
}
