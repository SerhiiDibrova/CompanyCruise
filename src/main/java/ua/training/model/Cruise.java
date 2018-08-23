package ua.training.model;


import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZoneId;

public class Cruise implements Serializable {
    private final static long serialVersionUID = 1L;
    private int id;
    private String name;
    private int ship_id;
    private int cityFrom;
    private int cityTo;
    private LocalDateTime departure;
    private LocalDateTime arrival;
    private CruiseCategory category;
    private int countPort;
    private long price;

    public Cruise() {
    }

    public Cruise(String name, int ship_id, int cityFrom, int cityTo, LocalDateTime departure, LocalDateTime arrival, CruiseCategory category, int countPort, long price) {
        this.name = name;
        this.ship_id = ship_id;
        this.cityFrom = cityFrom;
        this.cityTo = cityTo;
        this.departure = departure;
        this.arrival = arrival;
        this.category = category;
        this.countPort = countPort;
        this.price = price;
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

    public int getShip_id() {
        return ship_id;
    }

    public void setShip_id(int ship_id) {
        this.ship_id = ship_id;
    }

    public int getCityFrom() {
        return cityFrom;
    }

    public void setCityFrom(int cityFrom) {
        this.cityFrom = cityFrom;
    }

    public int getCityTo() {
        return cityTo;
    }

    public void setCityTo(int cityTo) {
        this.cityTo = cityTo;
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

    public LocalDateTime convertToLocalDateTimeViaInstant(Date dateToConvert) {
        return dateToConvert.toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDateTime();
    }

    public Date convertToDateViaInstant(LocalDateTime dateToConvert) {
        return (Date) java.util.Date.
                from(dateToConvert.atZone(ZoneId.systemDefault())
                        .toInstant());
    }

    @Override
    public String toString() {
        return "Cruise{" +
                "name='" + name + '\'' +
                ", ship_id=" + ship_id +
                ", cityFrom=" + cityFrom +
                ", cityTo=" + cityTo +
                ", departure=" + departure +
                ", arrival=" + arrival +
                ", category=" + category +
                ", countPort=" + countPort +
                ", price=" + price +
                '}';
    }
}
