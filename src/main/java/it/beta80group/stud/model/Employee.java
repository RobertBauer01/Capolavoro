package it.beta80group.stud.model;

import java.sql.Date;

public class Employee {
    private String title;

    private String description;

    private String link;

    private String imageSrc;

    private Long orderCol;

    private Long idTask;

    private Long idUser;

    private String statusTask;

    private String username;

    private String name;

    private String surname;

    private java.sql.Date data;

    public Date getData() {
        return data;
    }


    public void setData(Date data) {
        this.data = data;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getStatusTask() {
        return statusTask;
    }

    public Long getIdUser() {
        return idUser;
    }

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    public void setStatusTask(String statusTask) {
        this.statusTask = statusTask;
    }

    public Long getIdTask() {
        return idTask;
    }

    public void setIdTask(Long idTask) {
        this.idTask = idTask;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getImageSrc() {
        return imageSrc;
    }

    public void setImageSrc(String imageSrc) {
        this.imageSrc = imageSrc;
    }

    public Long getOrderCol() {
        return orderCol;
    }

    public void setOrderCol(Long orderCol) {
        this.orderCol = orderCol;
    }

}
