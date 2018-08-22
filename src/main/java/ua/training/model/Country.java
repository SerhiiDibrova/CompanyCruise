package ua.training.model;

import java.io.Serializable;

public class Country implements Serializable {
    private final static long serialVersionUID = 1L;
    private int id;
    private String name;
    private String city;
    public Country(){}
    public Country(int id){
        this.id=id;
    }
    public Country(String name, String city) {
        this.name = name;
        this.city = city;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "Country{" +
                "name='" + name + '\'' +
                ", city='" + city + '\'' +
                '}';
    }
}