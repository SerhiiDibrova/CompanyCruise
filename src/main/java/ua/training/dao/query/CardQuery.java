package ua.training.dao.query;

public interface CardQuery {
    String FIND_ALL_CARD = "SELECT * FROM CRUISE.CARD";
    String FIND_CARD_BY_ID = "SELECT * FROM CRUISE.CARD WHERE CARD_ID = ?";
    String DELETE_CARD_BY_ID = "DELETE FROM CRUISE.CARD WHERE CARD_ID = ?";
    String CREATE_CARD = "INSERT INTO CRUISE.CARD (user_id, cruise_id,excursion_id, card_total) VALUES(?, ?,?,?)";
    String UPDATE_CARD = "UPDATE CRUISE.COUNTRY SET  user_id = ?, cruise_id = ? , excursion_id = ?, card_total = ? WHERE card_id = ?";

}
