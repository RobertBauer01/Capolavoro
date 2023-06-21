package it.beta80group.stud.model;

public class Employee {
    private String title;

    private String description;

    private String link;

    private String imageSrc;

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
