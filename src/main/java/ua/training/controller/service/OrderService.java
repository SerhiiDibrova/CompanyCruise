package ua.training.controller.service;

import org.apache.log4j.Logger;
import ua.training.controller.service.CartBean.CartItemBean;
import ua.training.dao.AbstractFactory;
import ua.training.dao.FactoryDao;
import ua.training.dao.daoimpl.*;
import ua.training.model.Cruise;
import ua.training.model.Order;

import java.util.ArrayList;
import java.util.List;

public class OrderService {
    private final static Logger logger = Logger.getLogger(OrderService.class);
    private AbstractFactory factoryDao;
    private OrderDaoImpl orderDao;
    private CartDaoImpl cartDao;
    private UserDaoImpl userDao;
    private CruiseDaoImpl cruiseDao;
    private ExcursionDaoImpl excursionDao;
    private CountryDaoImpl countryDao;
    private ShipDaoImpl shipDao;

    public OrderService() {
        this.factoryDao = new FactoryDao();
        this.cartDao = factoryDao.createCartDao();
        this.userDao = factoryDao.createUserDao();
        this.cruiseDao = factoryDao.createCruiseDao();
        this.excursionDao = factoryDao.createExcursionDao();
        this.countryDao = factoryDao.createCountryDao();
        this.shipDao = factoryDao.createShipDao();
        this.orderDao = factoryDao.createOrderDao();
    }

    public String makeOrder(String userLogin, int cruiseId, int cartId, int excursionId) {
        List<CartItemBean> ordersList = findOrdersByUser(userLogin);
        if (ordersList != null) {
            for (CartItemBean item : ordersList) {
                if (item.getCruise().getId() == cruiseId) {
                    logger.info("Can't buy! This cruise already added in orders");
                    return "Can't buy! This cruise already added in orders";
                }
            }
        }

        Order order = new Order();
        order.setUser_id(userDao.findByLogin(userLogin).getId());
        order.setCruise_id(cruiseId);
        order.setPrice_total(cruiseDao.findById(cruiseId).getPrice() + excursionDao.findById(excursionId).getPrice());
        order.setExcursion_id(excursionId);
        Boolean result = orderDao.create(order);
        if (result) {
            logger.info("Order Succes");
            cartDao.delete(cartId);
            return "Order Succes";
        } else {
            logger.info("ERROR! Order not created!");
            return "ERROR! Order not created!";
        }

    }


    /**
     * Find all orders of user
     */
    public List<CartItemBean> findOrdersByUser(String userLogin) {
        List<Order> orderList = orderDao.findUserById(userDao.findByLogin(userLogin).getId());
        List<CartItemBean> cartItemBeans = new ArrayList<>();
        if (orderList != null) {
            for (Order order : orderList) {
                Cruise cruise = cruiseDao.findById(order.getCruise_id());
                cruise.setCountryFrom(countryDao.findById(cruise.getCountryFromById()));
                cruise.setCountryTo(countryDao.findById(cruise.getCountryToById()));
                cruise.setShip(shipDao.findById(cruise.getShipById()));
                cartItemBeans.add(new CartItemBean(null, cruise, order.getExcursion()));
            }
        } else {
            cartItemBeans = null;
        }
        return cartItemBeans;
    }
}
