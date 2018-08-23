package ua.training.model;

import java.io.Serializable;

public class Excursion implements Serializable {
    private final static long serialVersionUID = 1L;
    private int id;
    private int country;
    private String name;
    private String description;
    private long price;
    public Excursion(){}
    public Excursion(int country, String name, String description, long price) {
        this.country = country;
        this.name = name;
        this.description = description;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCountry() {
        return country;
    }

    public void setCountry(int country) {
        this.country = country;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Excursion{" +
                "country=" + country +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                '}';
    }
}
