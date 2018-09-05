package ua.training.controller.command.user;

import ua.training.controller.Endpoint;
import ua.training.controller.command.Command;
import ua.training.controller.command.servletAction.Forward;
import ua.training.controller.command.servletAction.ServletAction;
import ua.training.controller.service.CruiseService;
import ua.training.controller.service.ExcursionService;
import ua.training.controller.util.Util;
import ua.training.model.Cruise;
import ua.training.model.Excursion;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class CruiseListCommand implements Command {
    private CruiseService cruiseService;
    private ExcursionService excursionService;
    public CruiseListCommand(){
        this.cruiseService = new CruiseService();
        this.excursionService=new ExcursionService();
    }
    @Override
    public ServletAction execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        //List<Cruise> cruises = cruiseService.showListCruise();
        int quantity = cruiseService.quantityOfPages();
        int page = Util.getIdFromURI(request.getRequestURI());
        System.out.println("DDDDDDDDDDDDDDDDDDDDDDDD"+page);
        putCruises(request,page);
        int maxPage = Util.getPage(quantity, page);
        request.setAttribute("page", maxPage);
        request.setAttribute("pathPage", "cruiselist");
        //session.setAttribute("cruises", cruises);
        return new Forward(Endpoint.getInstance().getProperty(Endpoint.CRUISE_LIST_FORM));
    }
    private void putCruises(HttpServletRequest request, int page) {
        if (page == 0) {
            request.setAttribute("cruises", cruiseService.showListCruiseWithLimit(1));
        } else {
            request.setAttribute("cruises", cruiseService.showListCruiseWithLimit(page));
        }
    }
}
