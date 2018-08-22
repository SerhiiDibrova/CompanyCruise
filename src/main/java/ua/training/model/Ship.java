package ua.training.model;

import java.io.Serializable;

public class Ship implements Serializable {
    private final static long serialVersionUID = 1L;
    private int ship_id;
    private String name;
    private int capacity;

    public Ship() {
    }

    public Ship(String name, int capacity) {
        this.name = name;
        this.capacity = capacity;
    }

    public int getShip_id() {
        return ship_id;
    }

    public void setShip_id(int ship_id) {
        this.ship_id = ship_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    @Override
    public String toString() {
        return "Ship{" +
                "name='" + name + '\'' +
                ", capacity=" + capacity +
                '}';
    }
}
