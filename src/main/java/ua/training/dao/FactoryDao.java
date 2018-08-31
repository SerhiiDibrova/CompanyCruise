package ua.training.dao;

import ua.training.dao.daoimpl.*;

public class FactoryDao implements AbstractFactory {
    @Override
    public UserDaoImpl createUserDao() {
        return new UserDaoImpl();
    }

    @Override
    public CountryDaoImpl createCountryDao() {
        return new CountryDaoImpl();
    }

    @Override
    public CardDaoImpl createCardDao() {
        return new CardDaoImpl();
    }

    @Override
    public CruiseDaoImpl createCruiseDao() {
        return new CruiseDaoImpl();
    }

    @Override
    public ExcursionDaoImpl createExcursionDao() {
        return new ExcursionDaoImpl();
    }

    @Override
    public ShipDaoImpl createShipDao() {
        return new ShipDaoImpl();
    }

    @Override
    public ShipImageDaoImpl createShipImageDao() {
        return new ShipImageDaoImpl();
    }

    @Override
    public ExcursionImageDaoImpl createExcursionImageDao() {
        return new ExcursionImageDaoImpl();
    }


}
