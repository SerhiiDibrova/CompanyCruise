import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static ua.training.controller.util.Util.*;

public class CheckPathTest {


    @Test
    public void testGetActionFromURI() {

        assertEquals("wilddolphin", getActionFromURI("/wilddolphin"));
        assertEquals("cruise", getActionFromURI("/wilddolphin/cruise"));
        assertEquals("cruise", getActionFromURI("/wilddolphin/cruise/2"));
        assertEquals(2, getIdFromURI("/wilddolphin/cruise/2"));
        assertEquals("cart", getActionFromURI("/wilddolphin/cart"));
        assertEquals("countryadd", getActionFromURI("/wilddolphin/countryadd"));
        assertEquals(5, getPage(10, 2));
    }
}
