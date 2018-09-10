package ua.training.controller.service;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import ua.training.controller.service.Bean.CartItemBean;
import ua.training.dao.daoimpl.CartDaoImpl;
import ua.training.dao.daoimpl.UserDaoImpl;
import ua.training.model.*;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class CartServiceTest {

    @Mock
    CartDaoImpl cartDao;
    @Mock
    UserDaoImpl userDao;
    @InjectMocks
    CartService cartService;
    List<CartItemBean>  items;

    @Before
    public void init() {
        items = new ArrayList<>();
    }

 /*   @Test
    public void testFindByUserCart() {
        User user=mock(User.class);
        when(user.getLogin()).thenReturn("admin");
        String login = user.getLogin();
        when(cartService.findCartsByUser(login)).thenReturn(items);
        List<CartItemBean> allCartsByUser = cartService.findCartsByUser(user.getLogin());
        assertEquals(allCartsByUser.size(), items.size());
    }*/
}