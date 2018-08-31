package ua.training.dao.mapper;

import ua.training.model.Card;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class CardMapper implements ObjectMapper<Card> {
    @Override
    public Card extractFromResultSet(ResultSet rs) throws SQLException {
       Card  card = new Card();
        /*card.setCard_id(rs.getInt("card_id"));
        card.setUser(rs.getInt("user_id"));
        card.setCruise_id(rs.getInt("cruise_id"));
        card.setExcursion_id(rs.getInt("excursion_id"));
        card.setPrice_total(rs.getLong("card_total"));*/
        return card;
    }

    @Override
    public Card makeUnique(Map<Integer, Card> cache, Card card) {
        cache.putIfAbsent(card.getCard_id(),card);
        return cache.get(card.getCard_id());
    }

    @Override
    public void setPreparedStatement(PreparedStatement preparedStatement, Card card) throws SQLException {
             /*         preparedStatement.setInt(1,card.getUser().getId());
                      preparedStatement.setInt(2,);
                      preparedStatement.setInt(3,card.getExcursion_id());
                      preparedStatement.setLong(4,card.getPrice_total());*/
    }

    @Override
    public void setPreparedStatementWithID(PreparedStatement preparedStatement, Card card) throws SQLException {
      /*  preparedStatement.setInt(1,card.getUser_id());
        preparedStatement.setInt(2,card.getCruise_id());
        preparedStatement.setInt(3,card.getExcursion_id());
        preparedStatement.setLong(4,card.getPrice_total());
        preparedStatement.setInt(5,card.getCard_id());*/
    }
}
