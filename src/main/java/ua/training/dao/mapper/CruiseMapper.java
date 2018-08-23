package ua.training.dao.mapper;

import ua.training.model.Cruise;
import ua.training.model.CruiseCategory;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class CruiseMapper implements ObjectMapper<Cruise> {
    @Override
    public Cruise extractFromResultSet(ResultSet rs) throws SQLException {
        Cruise cruise = new Cruise();
        cruise.setId(rs.getInt("cruise_id"));
        cruise.setName(rs.getString("cruise_name"));
        cruise.setShip_id(rs.getInt("ship_id"));
        cruise.setCityFrom(rs.getInt("cruise_city_from"));
        cruise.setCityTo(rs.getInt("cruise_city_to"));
        cruise.setDeparture(cruise.convertToLocalDateTimeViaInstant(rs.getDate("cruise_departure")));
        cruise.setArrival(cruise.convertToLocalDateTimeViaInstant(rs.getDate("cruise_arrival")));
        cruise.setCategory(CruiseCategory.valueOf(rs.getString("cruise_category")));
        cruise.setCountPort(rs.getInt("cruise_count_port"));
        cruise.setPrice(rs.getLong("cruise_price"));
        return cruise;
    }

    @Override
    public Cruise makeUnique(Map<Integer, Cruise> cache, Cruise cruise) {
        cache.putIfAbsent(cruise.getId(),cruise);
        return cache.get(cruise.getId());
    }

    @Override
    public void setPreparedStatement(PreparedStatement preparedStatement, Cruise cruise) throws SQLException {
            preparedStatement.setString(1,cruise.getName());
            preparedStatement.setInt(2,cruise.getShip_id());
            preparedStatement.setInt(3,cruise.getCityFrom());
            preparedStatement.setInt(4,cruise.getCityTo());
            preparedStatement.setDate(5,cruise.convertToDateViaInstant(cruise.getDeparture()));
            preparedStatement.setDate(6,cruise.convertToDateViaInstant(cruise.getArrival()));
            preparedStatement.setString(7,cruise.getCategory().name());
            preparedStatement.setInt(8,cruise.getCountPort());
            preparedStatement.setLong(9,cruise.getPrice());

    }

    @Override
    public void setPreparedStatementWithID(PreparedStatement preparedStatement, Cruise cruise) throws SQLException {
        preparedStatement.setString(1,cruise.getName());
        preparedStatement.setInt(2,cruise.getShip_id());
        preparedStatement.setInt(3,cruise.getCityFrom());
        preparedStatement.setInt(4,cruise.getCityTo());
        preparedStatement.setDate(5,cruise.convertToDateViaInstant(cruise.getDeparture()));
        preparedStatement.setDate(6,cruise.convertToDateViaInstant(cruise.getArrival()));
        preparedStatement.setString(7,cruise.getCategory().name());
        preparedStatement.setInt(8,cruise.getCountPort());
        preparedStatement.setLong(9,cruise.getPrice());
        preparedStatement.setInt(10,cruise.getId());
    }
}
