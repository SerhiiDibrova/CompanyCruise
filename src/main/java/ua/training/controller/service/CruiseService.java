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
    private CruiseDao cruiseDao;
    private AbstractFactory factoryDao;

    public CruiseService(){
        this.factoryDao = new FactoryDao();
        this.cruiseDao=factoryDao.createCruiseDao();
    }

    public boolean addNewCruise(HttpServletRequest request){
        logger.info("add new cruise");
        String name = request.getParameter("name");
        int ship = Integer.parseInt(request.getParameter("ship"));
        int cityFrom = Integer.parseInt(request.getParameter("cityFrom"));
        int cityTo = Integer.parseInt(request.getParameter("cityTo"));
        LocalDateTime departure = LocalDateTime.parse(request.getParameter("departure"));
        LocalDateTime arrival = LocalDateTime.parse(request.getParameter("arrival"));
        CruiseCategory category = CruiseCategory.valueOf(request.getParameter("category"));
        int port = Integer.parseInt(request.getParameter("port"));
        long price = Long.parseLong(request.getParameter("price"));
        Cruise cruise = new Cruise();
        cruise.setName(name);
       // cruise.setShip_id(ship);
       // cruise.setCityFrom(cityFrom);
       // cruise.setCityTo(cityTo);
        cruise.setDeparture(departure);
        cruise.setArrival(arrival);
        cruise.setCategory(category);
        cruise.setCountPort(port);
        cruise.setPrice(price);
        boolean result = cruiseDao.create(cruise);
        if (result) {
            logger.info("Created cruise " + cruise.toString());
        } else {
            logger.error("Error");
        }
        return result;

    }

    public List showListContry(){
        logger.info("show list cruise");
        List<Cruise> list = cruiseDao.findAll();
        return list;
    }
}
