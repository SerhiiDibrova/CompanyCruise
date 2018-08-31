package ua.training.controller.service;

import org.apache.log4j.Logger;
import ua.training.dao.AbstractFactory;
import ua.training.dao.ExcursionDao;
import ua.training.dao.FactoryDao;
import ua.training.model.Excursion;

import java.util.List;

public class ExcursionService {
    private final static Logger logger = Logger.getLogger(ExcursionService.class);
    private AbstractFactory factoryDao;
    private ExcursionDao excursionDao;

    public ExcursionService(){
        this.factoryDao = new FactoryDao();
        this.excursionDao=factoryDao.createExcursionDao();
    }

    public List<Excursion> showListContry() {
        logger.info("show list ship");
        List<Excursion> list = excursionDao.findAll();
        return list;
    }

}