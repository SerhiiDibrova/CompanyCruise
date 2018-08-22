package ua.training.controller.util;

import ua.training.controller.exception.CommandException;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Util {
    public static String getActionFromURI(String URI) {
        URI = URI.substring(1, URI.length());
        String[] s = URI.split("/");
        for (int i = s.length - 1; i >= 0; i--) {
            if (s[i].matches("[A-Za-z_]+")) {
                return s[i];
            }
        }
        throw new CommandException("null action");
    }

    public static int getIdFromURI(String URI) {
        Pattern pattern = Pattern.compile("[0-9]+");
        Matcher matcher = pattern.matcher(URI);
        int id;
        String m = "";
        while (matcher.find()) {
            m = matcher.group();
        }
        try {
            id = Integer.parseInt(m);
        } catch (NumberFormatException e) {
            id = 0;
        }
        return id;
    }


}
