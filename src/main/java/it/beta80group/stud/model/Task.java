package it.beta80group.stud.model;

public class Task {
    private String title;
    private String description;
    private String imageSrc;
    private Long idTask;
    private String link;
    private Long status;
    private Long orderCol;

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

    public String getImageSrc() {
        return imageSrc;
    }

    public void setImageSrc(String imageSrc) {
        this.imageSrc = imageSrc;
    }

    public Long getIdTask() {
        return idTask;
    }

    public void setIdTask(Long idTask) { this.idTask = idTask; }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public Long getOrderCol() {
        return orderCol;
    }

    public void setOrderCol(Long orderCol) {
        this.orderCol = orderCol;
    }
}
