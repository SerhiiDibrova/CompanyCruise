package ua.training.dao.daoimpl;

import org.apache.log4j.Logger;
import ua.training.dao.CardDao;
import ua.training.dao.connection.DataSourceConnection;
import ua.training.dao.mapper.CardMapper;
import ua.training.model.Card;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static ua.training.dao.query.CardQuery.*;

public class CardDaoImpl implements CardDao {

    private final static Logger logger = Logger.getLogger(CardDaoImpl.class);
    private CardMapper cardMapper;

    public CardDaoImpl() {
        this.cardMapper = new CardMapper();
    }

    @Override
    public boolean create(Card card) {
        boolean result = false;
        try (Connection connection = DataSourceConnection.getConnection()) {
            logger.info("Create new Card");
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_CARD);
            cardMapper.setPreparedStatement(preparedStatement, card);
            result = preparedStatement.executeUpdate() > 0;
            if (result) {
                connection.commit();
                logger.info("Card " + card.toString() + " was created!");
            } else {
                logger.info("Card " + card.toString() + " does not create!");

            }
        } catch (SQLException e) {
            logger.error(e.toString());
        }
        return result;
    }

    @Override
    public Card findById(int id) {
        logger.info("Find by id");
        Card card;
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_CARD_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            card = cardMapper.extractFromResultSet(resultSet);
        } catch (SQLException e) {
            logger.error(e.toString());
            return null;
        }
        return card;
    }

    @Override
    public List<Card> findAll() {
        logger.info("find all");
        Map<Integer, Card> cards = new HashMap<>();
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_CARD);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                Card card = cardMapper.extractFromResultSet(resultSet);
                card = cardMapper.makeUnique(cards, card);
                cards.put(card.getCard_id(), card);
                logger.info("Added card to Map  :" + card.toString());
            }

            return new ArrayList<>(cards.values());
        } catch (SQLException e) {
            logger.error(e.toString());
            return null;
        }
    }

    @Override
    public void update(Card card) {
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CARD);
            cardMapper.setPreparedStatementWithID(preparedStatement, card);

            boolean result = preparedStatement.executeUpdate() > 0;
            if (result) {
                connection.commit();
                logger.info("Card " + card.toString() + " was updated!");
            } else {
                logger.info("Card " + card.toString() + " does not uptade!");

            }
        } catch (SQLException e) {
            logger.error(e.toString());
        }
    }

    @Override
    public void delete(int id) {
        logger.info("delete card by id :" + id);
        try (Connection connection = DataSourceConnection.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CARD_BY_ID);
            preparedStatement.setInt(1, id);
            boolean result = preparedStatement.execute();
            if (result) {
                connection.commit();
                logger.info("Card " + id + " was deleted!");
            } else {
                logger.info("Card " + id + " was not deleted!");
            }

        } catch (SQLException e) {
            logger.error(e.toString());
        }
    }
}
