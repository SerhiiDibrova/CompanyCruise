package ua.training.controller.filter;

import ua.training.model.User;

import java.util.*;
import java.util.regex.Pattern;

public class Authorization {

    private HashMap<Pattern, Set<User.Role>> authorization;

    private static Authorization instances;

    private Authorization(){
        Set<User.Role> all = new HashSet<>(
                Arrays.asList(User.Role.GUEST, User.Role.USER, User.Role.ADMIN)
        );
        Set<User.Role> authorized = new HashSet<>(
                Arrays.asList(User.Role.USER, User.Role.ADMIN)
        );
        Set<User.Role> unauthorized = new HashSet<>(
                Collections.singletonList(User.Role.GUEST)
        );
        Set<User.Role> admin = new HashSet<>(
                Collections.singletonList(User.Role.ADMIN)
        );
        authorization = new HashMap<>();
        authorization.put(Pattern.compile("/wilddolphin/login"), unauthorized);
        authorization.put(Pattern.compile("/wilddolphin/registration"), unauthorized);
        authorization.put(Pattern.compile("/wilddolphin/signin"), unauthorized);
        authorization.put(Pattern.compile("/wilddolphin/signup"), unauthorized);
        authorization.put(Pattern.compile("/wilddolphin/index"), all);
        authorization.put(Pattern.compile("/wilddolphin"), all);
        authorization.put(Pattern.compile("/wilddolphin/countrylist"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/shiplist"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/excursionlist"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/country"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/logout"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/profile"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/cruiselist"), all);
        authorization.put(Pattern.compile("/wilddolphin/cruise_card"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/showcard"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/pay"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/cruiselist/\\d{1,9}"),all);
        authorization.put(Pattern.compile("/"), all);
    }

    public static Authorization getInstances(){
        if (instances == null) {
            synchronized (Authorization.class) {
                if (instances == null) {
                    instances = new Authorization();
                }
            }
        }
        return instances;
    }

    public HashMap<Pattern, Set<User.Role>> getAuthorization() {
        return authorization;
    }
}
