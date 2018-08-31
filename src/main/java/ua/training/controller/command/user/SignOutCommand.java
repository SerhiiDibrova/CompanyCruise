package ua.training.controller.command.user;

import org.apache.log4j.Logger;
import ua.training.controller.Endpoint;
import ua.training.controller.command.Command;
import ua.training.controller.command.servletAction.Forward;
import ua.training.controller.command.servletAction.Redirect;
import ua.training.controller.command.servletAction.ServletAction;
import ua.training.controller.util.SessionUtility;
import ua.training.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SignOutCommand implements Command {
    private final static Logger logger = Logger.getLogger(SignOutCommand.class);
    public SignOutCommand(){}
    @Override
    public ServletAction execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       logger.info("Log Out");
        HttpSession session = request.getSession();
        User user =null;
        SessionUtility.setUserRole(request, User.Role.GUEST, user , "Guest");
        logger.info("Loged Out");
        return new Redirect("/cruise/index");
    }
}
