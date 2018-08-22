package ua.training.dao;

import ua.training.dao.daoimpl.CountryDaoImpl;
import ua.training.dao.daoimpl.UserDaoImpl;

public class FactoryDao implements AbstractFactory {
    @Override
    public UserDaoImpl createUserDao() {
        return new UserDaoImpl();
    }

    @Override
    public CountryDaoImpl createCountryDao() {
        return new CountryDaoImpl();
    }


}
