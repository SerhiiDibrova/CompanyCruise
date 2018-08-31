package ua.training.dao.query;

public interface ExcursionImageQuery {
    String FIND_ALL_EXCURSIONIMAGE = "SELECT * FROM CRUISE.EXCURSIONIMAGE";
    String FIND_EXCURSION_IMAGE_BY_ID = "SELECT * FROM CRUISE.EXCURSIONIMAGE WHERE EXCURSIONIMAGE_ID = ?";
    String DELETE_EXCURSION_IMAGE_BY_ID = "DELETE FROM CRUISE.EXCURSIONIMAGE WHERE EXCURSIONIMAGE_ID = ?";
    String CREATE_EXCURSIONIMAGE = "INSERT INTO CRUISE.EXCURSIONIMAGE (excursion_uri) VALUES(?)";
    String UPDATE_EXCURSIONIMAGE= "UPDATE CRUISE.EXCURSIONIMAGE SET  excursion_uri= ? WHERE excursion_id = ?";

}
