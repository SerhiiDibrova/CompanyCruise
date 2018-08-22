package ua.training.controller.service;

import org.apache.log4j.Logger;
import ua.training.dao.AbstractFactory;
import ua.training.dao.CountryDao;
import ua.training.dao.FactoryDao;
import ua.training.model.Country;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class CountryService {
    private final static Logger logger = Logger.getLogger(CountryService.class);
    private AbstractFactory factoryDao;
    CountryDao countryDao;
    public CountryService(){
        this.factoryDao=new FactoryDao();
        countryDao=factoryDao.createCountryDao();
    }

    public boolean addNewCountry(HttpServletRequest request){
        logger.info("registration ");
        String name = request.getParameter("name");
        String city = request.getParameter("city");
        Country country = new Country(name,city);
        boolean result = countryDao.create(country);
        if (result) {
            logger.info("Created country " + country.toString());
        } else {
            logger.error("Error");
        }
        return result;

    }

    public List showListContry(){
        logger.info("show list country");
        List<Country> list = countryDao.findAll();
         return list;
    }


}