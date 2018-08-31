package ua.training.model;


import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Cruise implements Serializable {
    private final static long serialVersionUID = 1L;
    private int id;
    private String name;
    private Ship ship;
    private Country countryFrom;
    private Country countryTo;
    private LocalDateTime departure;
    private LocalDateTime arrival;
    private CruiseCategory category;
    private int countPort;
    private long price;

    public Cruise() {
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

    public Ship getShip() {
        return ship;
    }

    public void setShip(Ship ship) {
        this.ship = ship;
    }

    public Country getCountryFrom() {
        return countryFrom;
    }

    public void setCountryFrom(Country countryFrom) {
        this.countryFrom = countryFrom;
    }

    public Country getCountryTo() {
        return countryTo;
    }

    public void setCountryTo(Country countryTo) {
        this.countryTo = countryTo;
    }

    public LocalDateTime getDeparture() {
        return departure;
    }

    public void setDeparture(LocalDateTime departure) {
        this.departure = departure;
    }

    public LocalDateTime getArrival() {
        return arrival;
    }

    public void setArrival(LocalDateTime arrival) {
        this.arrival = arrival;
    }

    public CruiseCategory getCategory() {
        return category;
    }

    public void setCategory(CruiseCategory category) {
        this.category = category;
    }

    public int getCountPort() {
        return countPort;
    }

    public void setCountPort(int countPort) {
        this.countPort = countPort;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public LocalDateTime convertToLocalDateTime(Timestamp timestap) {
        if(timestap!=null){
            return timestap.toLocalDateTime();
        }
        return null;
    }

    public Timestamp convertToTimestap(LocalDateTime localDateTime) {
        return Timestamp.valueOf(localDateTime);
    }


    @Override
    public String toString() {
        return "Cruise{" +
                "name='" + name + '\'' +
                ", ship_id=" + ship.toString() +
                ", cityFrom=" + countryFrom.toString() +
                ", cityTo=" + countryTo.toString() +
                ", departure=" + departure +
                ", arrival=" + arrival +
                ", category=" + category +
                ", countPort=" + countPort +
                ", price=" + price +
                '}';
    }
}
