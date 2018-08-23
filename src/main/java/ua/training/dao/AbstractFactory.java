package ua.training.dao;

import ua.training.dao.daoimpl.*;

public interface AbstractFactory {

UserDaoImpl createUserDao();
CountryDaoImpl createCountryDao();
CardDaoImpl createCardDao();
CruiseDaoImpl createCruiseDao();
ExcursionDaoImpl createExcursionDao();
ShipDaoImpl createShipDao();
}
