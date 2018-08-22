package ua.training.dao;

import ua.training.dao.daoimpl.CountryDaoImpl;
import ua.training.dao.daoimpl.UserDaoImpl;

public interface AbstractFactory {

UserDaoImpl createUserDao();
CountryDaoImpl createCountryDao();
}
