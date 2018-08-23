package ua.training.dao.query;

public interface CruiseQuery {
    String FIND_ALL_CRUISE = "SELECT * FROM CRUISE.CRUISE";
    String FIND_CRUISE_BY_ID = "SELECT * FROM CRUISE.CRUISE WHERE CRUISE_ID = ?";
    String DELETE_CRUISE_BY_ID = "DELETE FROM CRUISE.CRUISE WHERE CRUISE_ID = ?";
    String CREATE_CRUISE = "INSERT INTO CRUISE.CRUISE (cruise_name, ship_id , cruise_city_from , cruise_city_to, cruise_departure , cruise_arrival, cruise_category,cruise_count_port,cruise_price) VALUES(?,?,?,?,?,?,?,?,?)";
    String UPDATE_CRUISE = "UPDATE CRUISE.CRUISE SET  cruise_name = ?, ship_id = ? , cruise_city_from = ?, cruise_city_to = ?, cruise_departure = ? , cruise_arrival = ?, cruise_category = ?,cruise_count_port = ?,cruise_price = ? WHERE cruise_id = ?";

}
