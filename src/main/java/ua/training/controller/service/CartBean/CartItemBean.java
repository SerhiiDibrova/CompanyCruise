package ua.training.controller.service.CartBean;

import ua.training.model.Cruise;
import ua.training.model.Excursion;

import java.util.List;

public class CartItemBean {
    private List<Cruise> cruise;
    private List<Excursion> excursion;
    private long totalCost;
    CartItemBean(){}

    public void setCruise(List<Cruise> cruise) {
        this.cruise = cruise;
    }

    public List<Excursion> getExcursion() {
        return excursion;
    }

    public void setExcursion(List<Excursion> excursion) {
        this.excursion = excursion;
    }

    public long getTotalCost() {
        return totalCost+cruise.stream().mapToLong(i-> i.getPrice()).sum();
    }

    public void setTotalCost(long totalCost) {
        this.totalCost = totalCost;
    }
}
