package it.beta80group.stud.model;

import java.sql.Date;
public class UserTask {
    //Informazioni del dipendente
    private String surname;
    private String name;
    private Date dt;

    //Lista Task
    private String taskTitle;
    private String taskDescription;
    private Date taskStatus;

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDt() {
        return dt;
    }

    public void setDt(Date dt) {
        this.dt = dt;
    }

    public String getTaskTitle() {
        return taskTitle;
    }

    public void setTaskTitle(String taskTitle) {
        this.taskTitle = taskTitle;
    }

    public String getTaskDescription() {
        return taskDescription;
    }

    public void setTaskDescription(String taskDescription) {
        this.taskDescription = taskDescription;
    }

    public Date getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(Date taskStatus) {
        this.taskStatus = taskStatus;
    }
}
