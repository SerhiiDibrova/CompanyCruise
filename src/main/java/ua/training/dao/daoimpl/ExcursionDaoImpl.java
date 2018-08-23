package ua.training.dao.daoimpl;

import org.apache.log4j.Logger;
import ua.training.dao.ExcursionDao;
import ua.training.dao.connection.DataSourceConnection;
import ua.training.dao.mapper.ExcursionMapper;
import ua.training.model.Excursion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static ua.training.dao.query.ExcursionQuery.*;

public class ExcursionDaoImpl implements ExcursionDao {

    private final static Logger logger = Logger.getLogger(ExcursionDaoImpl.class);
    private ExcursionMapper excursionMapper;

    public ExcursionDaoImpl(){
        this.excursionMapper=new ExcursionMapper();
    }


    @Override
    public boolean create(Excursion excursion) {
        boolean result = false;
        try (Connection connection = DataSourceConnection.getConnection()) {
            logger.info("Create new Excursion");
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_EXCURSION);
            excursionMapper.setPreparedStatement(preparedStatement, excursion);
            result = preparedStatement.executeUpdate() > 0;
            if (result) {
                connection.commit();
                logger.info("Excursion " + excursion.toString() + " was created!");
            } else {
                logger.info("Excursion " + excursion.toString() + " does not create!");

            }
        } catch (SQLException e) {
            logger.error(e.toString());
        }
        return result;
    }

    @Override
    public Excursion findById(int id) {
        logger.info("Find by id");
        Excursion excursion;
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_EXCURSION_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            excursion = excursionMapper.extractFromResultSet(resultSet);
        } catch (SQLException e) {
            logger.error(e.toString());
            return null;
        }
        return excursion;
    }

    @Override
    public List<Excursion> findAll() {
        logger.info("find all");
        Map<Integer, Excursion> excursions = new HashMap<>();
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_EXCURSION);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Excursion excursion = excursionMapper.extractFromResultSet(resultSet);
                excursion = excursionMapper.makeUnique(excursions, excursion);
                excursions.put(excursion.getId(), excursion);
                logger.info("Added excursion to Map  :" + excursion.toString());
            }

            return new ArrayList<>(excursions.values());
        } catch (SQLException e) {
            logger.error(e.toString());
            return null;
        }
    }

    @Override
    public void update(Excursion excursion) {
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EXCURSION);
            excursionMapper.setPreparedStatementWithID(preparedStatement, excursion);

            boolean result = preparedStatement.executeUpdate() > 0;
            if (result) {
                connection.commit();
                logger.info("Excursion " + excursion.toString() + " was updated!");
            } else {
                logger.info("Excursion " + excursion.toString() + " does not uptade!");

            }
        } catch (SQLException e) {
            logger.error(e.toString());
        }
    }

    @Override
    public void delete(int id) {
        logger.info("delete excursion by id :" + id);
        String excursionName = findById(id).getName();
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EXCURSION_BY_ID);
            preparedStatement.setInt(5, id);
            boolean result = preparedStatement.execute();
            if (result) {
                connection.commit();
                logger.info("Excursion " + excursionName + " was deleted!");
            } else {
                logger.info("Excursion " + excursionName + " was not deleted!");
            }


        } catch (SQLException e) {
            logger.error(e.toString());
        }
    }
}
