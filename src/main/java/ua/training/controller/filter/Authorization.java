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
        authorization.put(Pattern.compile("/cruise/login"), unauthorized);
        authorization.put(Pattern.compile("/cruise/registration"), unauthorized);
        authorization.put(Pattern.compile("/cruise/signin"), unauthorized);
        authorization.put(Pattern.compile("/cruise/signup"), unauthorized);
        authorization.put(Pattern.compile("/cruise/index"), all);
        authorization.put(Pattern.compile("/cruise"), all);
        authorization.put(Pattern.compile("/cruise/countrylist"), authorized);
        authorization.put(Pattern.compile("/cruise/shiplist"), authorized);
        authorization.put(Pattern.compile("/cruise/excursionlist"), authorized);
        authorization.put(Pattern.compile("/cruise/country"), authorized);
        authorization.put(Pattern.compile("/cruise/logout"), authorized);
        authorization.put(Pattern.compile("/cruise/profile"), authorized);
        authorization.put(Pattern.compile("/cruise/cruiselist"), authorized);
        authorization.put(Pattern.compile("/cruise/cruise_card"), authorized);
        authorization.put(Pattern.compile("/cruise/showcard"), authorized);
        authorization.put(Pattern.compile("/cruise/pay"), authorized);
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
