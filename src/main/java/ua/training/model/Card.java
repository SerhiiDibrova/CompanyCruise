package ua.training.model;

import java.io.Serializable;

public class Card implements Serializable {
    private final static long serialVersionUID = 1L;
    private int card_id;
    private int user_id;
    private int cruise_id;
    private int excursion_id;
    private long price_total;
    public Card(){}
    public Card(int user_id, int cruise_id, int excursion_id, int price_total) {
        this.user_id = user_id;
        this.cruise_id = cruise_id;
        this.excursion_id = excursion_id;
        this.price_total = price_total;
    }

    public int getCard_id() {
        return card_id;
    }

    public void setCard_id(int card_id) {
        this.card_id = card_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCruise_id() {
        return cruise_id;
    }

    public void setCruise_id(int cruise_id) {
        this.cruise_id = cruise_id;
    }

    public int getExcursion_id() {
        return excursion_id;
    }

    public void setExcursion_id(int excursion_id) {
        this.excursion_id = excursion_id;
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
                "user_id=" + user_id +
                ", cruise_id=" + cruise_id +
                ", excursion_id=" + excursion_id +
                ", price_total=" + price_total +
                '}';
    }
}
