package ua.training.dao.daoimpl;

import org.apache.log4j.Logger;
import ua.training.dao.ShipDao;
import ua.training.dao.connection.DataSourceConnection;
import ua.training.dao.mapper.ShipMapper;
import ua.training.model.Ship;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static ua.training.dao.query.ShipQuery.*;

public class ShipDaoImpl implements ShipDao {
    private final static Logger logger = Logger.getLogger(ShipDaoImpl.class);
    private ShipMapper shipMapper;

    public ShipDaoImpl(){
        this.shipMapper = new ShipMapper();
    }

    @Override
    public boolean create(Ship ship) {
        boolean result = false;
        try (Connection connection = DataSourceConnection.getConnection()) {
            logger.info("Create new Ship");
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_SHIP);
            shipMapper.setPreparedStatement(preparedStatement, ship);
            result = preparedStatement.executeUpdate() > 0;
            if (result) {
                connection.commit();
                logger.info("Ship " + ship.toString() + " was created!");
            } else {
                logger.info("Ship " + ship.toString() + " does not create!");

            }
        } catch (SQLException e) {
            logger.error(e.toString());
        }
        return result;
    }

    @Override
    public Ship findById(int id) {
        logger.info("Find by id");
        Ship ship;
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_SHIP_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            ship = shipMapper.extractFromResultSet(resultSet);
        } catch (SQLException e) {
            logger.error(e.toString());
            return null;
        }
        return ship;
    }


    @Override
    public List<Ship> findAll() {
        logger.info("find all");
        Map<Integer, Ship> ships = new HashMap<>();
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_SHIP);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Ship ship = shipMapper.extractFromResultSet(resultSet);
                 ship = shipMapper.makeUnique(ships, ship);
                ships.put(ship.getShip_id(), ship);
                logger.info("Added ship to Map  :" + ship.toString());
            }

            return new ArrayList<>(ships.values());
        } catch (SQLException e) {
            logger.error(e.toString());
            return null;
        }
    }

    @Override
    public void update(Ship ship) {
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SHIP);
            shipMapper.setPreparedStatementWithID(preparedStatement, ship);

            boolean result = preparedStatement.executeUpdate() > 0;
            if (result) {
                connection.commit();
                logger.info("Ship  " + ship.toString() + " was updated!");
            } else {
                logger.info("Ship  " + ship.toString() + " does not uptade!");

            }
        } catch (SQLException e) {
            logger.error(e.toString());
        }
    }

    @Override
    public void delete(int id) {
        logger.info("delete ship by id :" + id);
        String shipName = findById(id).getName();
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SHIP_BY_ID);
            preparedStatement.setInt(1, id);
            boolean result = preparedStatement.execute();
            if (result) {
                connection.commit();
                logger.info("Ship " + shipName + " was deleted!");
            } else {
                logger.info("Ship " + shipName + " was not deleted!");
            }


        } catch (SQLException e) {
            logger.error(e.toString());
        }
    }
}
