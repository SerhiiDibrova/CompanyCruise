package ua.training.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Card implements Serializable {
    private final static long serialVersionUID = 1L;
    private int card_id;
    private User user;
    private List<Cruise> cruise = new ArrayList<>();
    private List<Excursion> excursion = new ArrayList<>();
    private long price_total;
    public Card(){}

    public int getCard_id() {
        return card_id;
    }

    public void setCard_id(int card_id) {
        this.card_id = card_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Cruise> getCruise() {
        return cruise;
    }

    public void setCruise(List<Cruise> cruise) {
        this.cruise = cruise;
    }

    public List<Excursion> getExcursion() {
        return excursion;
    }

    public void setExcursion(List<Excursion> excursion) {
        this.excursion = excursion;
    }

    public long getPrice_total() {
        return price_total;
    }

    public void setPrice_total(long price_total) {
        this.price_total = price_total;
    }

    @Override
    public String toString() {
        return "Card{" +
                "user_id=" + user.getLogin() +
                ", cruise_id=" + cruise.toString() +
                ", excursion_id=" + excursion.toString() +
                ", price_total=" + price_total +
                '}';
    }
}
