package ua.training.dao;

import ua.training.model.User;

import java.sql.SQLException;

public interface UserDao extends GenericDao<User> {
    User findByEmail(String email);
}
