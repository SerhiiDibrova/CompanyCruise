package ua.training.controller.command.CommandList;

import org.apache.log4j.Logger;
import ua.training.controller.command.Command;
import ua.training.controller.command.NoCommand;
import ua.training.controller.command.WelcomePageCommand;
import ua.training.controller.command.user.*;
import ua.training.controller.util.Util;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

public class CommandList {
    private final static Logger logger = Logger.getLogger(CommandList.class);
    private static CommandList instance = null;

    HashMap<String, Command> commands = new HashMap<>();

    private CommandList() {
        commands.put("login", new LoginCommand());
        commands.put("registration", new RegisterCommand());
        commands.put("signin", new SignInCommand());
        commands.put("signup" , new SignUpCommand());
        commands.put("index", new WelcomePageCommand());
        commands.put("cruise", new WelcomePageCommand());
        commands.put("country" , new CountryCommand());
        commands.put("countrylist", new CountryShowListCommand());
        commands.put("countryadd", new CountryAddCommand());
        commands.put("shiplist", new ShipListCommand());
        commands.put("cruiselist", new CruiseListCommand());
        commands.put("excursionlist",new ExcursionListCommand());
        commands.put("logout" , new SignOutCommand());
        commands.put("error", new NoCommand());
        commands.put("cruise_card", new AddCartCommand());
        commands.put("showcard" , new ShowCartCommand());
        commands.put("pay", new PayCommand());
    }

    public Command getCommand(HttpServletRequest request) {
        String action = Util.getActionFromURI(request.getRequestURI());
        Command command = commands.get(action.toLowerCase());
        logger.info("action ->"+command);
        if (command == null) {
            logger.info("wrong action");
            command = new NoCommand();
        }
        return command;
    }

    public static CommandList getInstance() {
        if (instance == null) {
            instance = new CommandList();
        }
        return instance;
    }


}
