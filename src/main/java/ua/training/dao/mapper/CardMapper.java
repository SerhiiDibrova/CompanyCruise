package ua.training.dao.mapper;

import ua.training.model.Card;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class CardMapper implements ObjectMapper<Card> {
    @Override
    public Card extractFromResultSet(ResultSet rs) throws SQLException {
        return null;
    }

    @Override
    public Card makeUnique(Map<Integer, Card> cache, Card card) {
        return null;
    }

    @Override
    public void setPreparedStatement(PreparedStatement preparedStatement, Card card) throws SQLException {

    }
}
