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
        /*-------UNAUTHORIZED-------*/
        authorization.put(Pattern.compile("/wilddolphin/login"), unauthorized);
        authorization.put(Pattern.compile("/wilddolphin/registration"), unauthorized);
        authorization.put(Pattern.compile("/wilddolphin/signin"), unauthorized);
        authorization.put(Pattern.compile("/wilddolphin/signup"), unauthorized);
        /*-------ALL------*/
        authorization.put(Pattern.compile("/wilddolphin/main"), all);
        authorization.put(Pattern.compile("/wilddolphin"), all);
        authorization.put(Pattern.compile("/wilddolphin/aboutus"), all);
        authorization.put(Pattern.compile("/wilddolphin/contact"), all);
        authorization.put(Pattern.compile("/wilddolphin/cruise/\\d{1,9}"),all);
        authorization.put(Pattern.compile("/wilddolphin/cruise"), all);
        authorization.put(Pattern.compile("/"), all);
       /* -------ADMIN-------*/
        authorization.put(Pattern.compile("/wilddolphin/country"), admin);
        authorization.put(Pattern.compile("/wilddolphin/countryadd/\\d{1,9}"), admin);
        authorization.put(Pattern.compile("/wilddolphin/countryadd"), admin);
        authorization.put(Pattern.compile("/wilddolphin/countryadded"), admin);
        authorization.put(Pattern.compile("/wilddolphin/countryedit/\\d{1,9}"), admin);
        authorization.put(Pattern.compile("/wilddolphin/countryedit"), admin);
        authorization.put(Pattern.compile("/wilddolphin/countrydelete/\\d{1,9}"),admin);
        authorization.put(Pattern.compile("/wilddolphin/countrydelete"), admin);
        authorization.put(Pattern.compile("/wilddolphin/countryupdate"),admin);
        authorization.put(Pattern.compile("/wilddolphin/ship"), admin);
        authorization.put(Pattern.compile("/wilddolphin/shipadd"), admin);
        authorization.put(Pattern.compile("/wilddolphin/shipadd/\\d{1,9}"), admin);
        authorization.put(Pattern.compile("/wilddolphin/shipedit"), admin);
        authorization.put(Pattern.compile("/wilddolphin/shipedit/\\d{1,9}"), admin);
        authorization.put(Pattern.compile("/wilddolphin/shipdelete"), admin);
        authorization.put(Pattern.compile("/wilddolphin/shipdelete/\\d{1,9}"), admin);
        authorization.put(Pattern.compile("/wilddolphin/orderall"),admin);
        /*-------AUTHORIZED-------*/
        authorization.put(Pattern.compile("/wilddolphin/excursionlist"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/logout"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/profile"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/cruise_card"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/cart"), authorized);
        authorization.put(Pattern.compile("/wilddolphin/pay"), authorized);


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
