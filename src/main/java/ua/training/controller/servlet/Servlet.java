package ua.training.controller.servlet;

import org.apache.log4j.Logger;
import ua.training.controller.command.Command;
import ua.training.controller.command.CommandList.CommandList;
import ua.training.controller.command.servletAction.ServletAction;
import ua.training.controller.exception.CommandException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Servlet extends HttpServlet {
    private final static Logger logger = Logger.getLogger(Servlet.class);
    private CommandList commandList = CommandList.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        logger.info(req.getLocalAddr());
        logger.info(getServletName() + " get request");
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        logger.info(req.getLocalAddr());
        logger.info(getServletName() + " post request");
        processRequest(req, resp);
    }
    private void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            logger.info(req.getRequestURL().toString());

            Command action = commandList.getCommand(req);
            ServletAction dispatcher = action.execute(req, resp);
            dispatcher.action(req, resp);
        } catch (CommandException e) {
            e.printStackTrace();
            logger.error("command exception", e);
            resp.sendError(400, e.getMessage());
        } catch (Exception e) {
            logger.error("internal server error", e);
            e.printStackTrace();
            resp.sendError(500);
        }
    }
}
