import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletCustumer", urlPatterns = {"/ServletCustumer","/khach_hang"})

public class ServletCustumer extends HttpServlet {
    private static List<Custumer> custumerList = new ArrayList<>();
    static {
        custumerList.add(new Custumer("hoa","2000","DN","http://cdn.shopify.com/s/files/1/0550/9300/2349/products/Luffy_snewwantedposter_1200x1200.jpg?v=1658374516"));
        custumerList.add(new Custumer("hai","1997","QN","https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/zoro-bounty-wanted-poster-one-piece-roronoa-zoro.jpg"));
        custumerList.add(new Custumer("duong","1196","Hue","https://cdn.shopify.com/s/files/1/0573/7522/8070/products/OP-425-SanjiHearteyes.jpg?v=1622781125"));
        custumerList.add(new Custumer("cu teo","2002","BD","https://i.pinimg.com/474x/40/ce/51/40ce51d85aa47573ab49b837db05d500.jpg"));
        custumerList.add(new Custumer("hoa","1998","TPHCM","https://i.pinimg.com/originals/1a/8d/3e/1a8d3e747c26a7dcdf8a8d9c1aecd52a.jpg"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setAttribute("custumerList",custumerList);
request.getRequestDispatcher("view/listCustumer.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
