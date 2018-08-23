package ua.training.dao.query;

public interface ShipQuery {
    String FIND_ALL_SHIP = "SELECT * FROM CRUISE.SHIP";
    String FIND_SHIP_BY_ID = "SELECT * FROM CRUISE.SHIP WHERE SHIP_ID = ?";
    String DELETE_SHIP_BY_ID = "DELETE FROM CRUISE.SHIP WHERE SHIP_ID = ?";
    String CREATE_SHIP = "INSERT INTO CRUISE.SHIP (ship_name, ship_capacity) VALUES(?, ?)";
    String UPDATE_SHIP=  "UPDATE CRUISE.SHIP SET  ship_name = ?, ship_capacity = ? WHERE ship_id = ?";

}
