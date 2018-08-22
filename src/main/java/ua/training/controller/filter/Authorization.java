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
        authorization.put(Pattern.compile("/login"), unauthorized);
        authorization.put(Pattern.compile("/registration"), unauthorized);
        authorization.put(Pattern.compile("/signin"), unauthorized);
        authorization.put(Pattern.compile("/signup"), unauthorized);
        authorization.put(Pattern.compile("/cruise"), all);
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
