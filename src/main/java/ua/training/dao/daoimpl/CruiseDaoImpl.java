package ua.training.dao.daoimpl;

import org.apache.log4j.Logger;
import ua.training.dao.CruiseDao;
import ua.training.dao.connection.DataSourceConnection;
import ua.training.dao.mapper.CruiseMapper;
import ua.training.model.Cruise;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static ua.training.dao.query.CruiseQuery.*;

public class CruiseDaoImpl implements CruiseDao {
    private final static Logger logger = Logger.getLogger(CruiseDaoImpl.class);
    private CruiseMapper cruiseMapper;

    public CruiseDaoImpl(){
        this.cruiseMapper=new CruiseMapper();
    }

    @Override
    public boolean create(Cruise cruise) {
        boolean result = false;
        try (Connection connection = DataSourceConnection.getConnection()) {
            logger.info("Create new Cruise");
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_CRUISE);
            cruiseMapper.setPreparedStatement(preparedStatement, cruise);
            result = preparedStatement.executeUpdate() > 0;
            if (result) {
                connection.commit();
                logger.info("Cruise " + cruise.toString() + " was created!");
            } else {
                logger.info("Cruise " + cruise.toString() + " does not create!");

            }
        } catch (SQLException e) {
            logger.error(e.toString());
        }
        return result;
    }

    @Override
    public Cruise findById(int id) {
        logger.info("Find by id");
        Cruise cruise;
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_CRUISE_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            cruise = cruiseMapper.extractFromResultSet(resultSet);
        } catch (SQLException e) {
            logger.error(e.toString());
            return null;
        }
        return cruise;
    }

    @Override
    public List<Cruise> findAll() {
        logger.info("find all");
        Map<Integer, Cruise> cruises = new HashMap<>();
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_CRUISE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Cruise cruise = cruiseMapper.extractFromResultSet(resultSet);
                cruise = cruiseMapper.makeUnique(cruises, cruise);
                cruises.put(cruise.getId(), cruise);
                logger.info("Added cruise to Map  :" + cruise.toString());
            }

            return new ArrayList<>(cruises.values());
        } catch (SQLException e) {
            logger.error(e.toString());
            return null;
        }
    }

    @Override
    public void update(Cruise  cruise) {
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CRUISE);
            cruiseMapper.setPreparedStatementWithID(preparedStatement,cruise);
            boolean result = preparedStatement.executeUpdate() > 0;
            if (result) {
                connection.commit();
                logger.info("Cruise " + cruise.toString() + " was updated!");
            } else {
                logger.info("Cruise " + cruise.toString() + " does not uptade!");

            }
        } catch (SQLException e) {
            logger.error(e.toString());
        }
    }

    @Override
    public void delete(int id) {
        logger.info("delete cruise by id :" + id);
        String cruiseName = findById(id).getName();
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CRUISE_BY_ID);
            preparedStatement.setInt(1, id);
            boolean result = preparedStatement.execute();
            if (result) {
                connection.commit();
                logger.info("Cruise " + cruiseName + " was deleted!");
            } else {
                logger.info("Cruise " + cruiseName + " was not deleted!");
            }


        } catch (SQLException e) {
            logger.error(e.toString());
        }
    }
}
