package ua.training.controller.command.user;

import org.apache.log4j.Logger;
import ua.training.controller.command.Command;
import ua.training.controller.command.servletAction.Redirect;
import ua.training.controller.command.servletAction.ServletAction;
import ua.training.controller.service.CountryService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CountryAddCommand implements Command {
    private CountryService countryService;

    public CountryAddCommand() {
        this.countryService = new CountryService();
    }


    @Override
    public ServletAction execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        countryService.addNewCountry(request);
        return new Redirect("/wilddolphin/country");
    }
}
