package ua.training.controller.service;

import org.apache.log4j.Logger;
import ua.training.controller.exception.UniqueException;
import ua.training.controller.util.HashCode;
import ua.training.dao.AbstractFactory;
import ua.training.dao.FactoryDao;
import ua.training.dao.UserDao;
import ua.training.model.User;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;

public class UserService {
    private final static Logger logger = Logger.getLogger(UserService.class);
    private AbstractFactory factoryDao;
    private UserDao userDao;

    public UserService() {
        this.factoryDao = new FactoryDao();
        this.userDao = factoryDao.createUserDao();
    }

    public boolean registration(HttpServletRequest request) throws UniqueException {
        logger.info("registration ");
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String passwordHashCode = HashCode.getHashCodeSha1(password);
        User user = new User();
        user.setLogin(login);
        user.setPassword(passwordHashCode);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setRole(User.Role.USER);
        user.setCreated(LocalDateTime.now());
        boolean result = userDao.create(user);
        if (result) {
            logger.info("Created user " + user.getLogin());
        } else {
            logger.error("Error");
        }
        return result;
    }

    public User signIn(HttpServletRequest request) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordHashCode = HashCode.getHashCodeSha1(password);

        User user = userDao.findByEmail(email);
        if (user == null) return null;
        return passwordEquals(passwordHashCode, user) ? user : null;

    }


    private boolean passwordEquals(String password, User user) {

        return user.getPassword().equals(password);
    }

}
