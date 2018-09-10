package ua.training.controller.service;

import org.apache.log4j.Logger;
import ua.training.dao.AbstractFactory;
import ua.training.dao.CruiseDao;
import ua.training.dao.ExcursionDao;
import ua.training.dao.FactoryDao;
import ua.training.model.Cruise;
import ua.training.model.CruiseCategory;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.List;

public class CruiseService {
    private final static Logger logger = Logger.getLogger(CruiseService.class);
    public static final int LIMIT_CRUISE = 2;
    private CruiseDao cruiseDao;
    private AbstractFactory factoryDao;

    public CruiseService() {
        this.factoryDao = new FactoryDao();
        this.cruiseDao = factoryDao.createCruiseDao();
    }

    public List showListCruise() {
        logger.info("show list cruise");
        List<Cruise> list = cruiseDao.findAll();
        return list;
    }

    public List showListCruiseWithLimit(int page) {
        logger.info("show list cruise");
        List<Cruise> list = cruiseDao.findAllWithLimit(offset(page));
        return list;
    }

    private int offset(int pageNumber) {
        return (pageNumber * LIMIT_CRUISE) - LIMIT_CRUISE;
    }

    public int quantityOfPages() {
        return cruiseDao.countCruise();
    }
}
