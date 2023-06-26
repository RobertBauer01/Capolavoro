package it.beta80group.stud.servlet;

import it.beta80group.stud.model.UserInfo;
import it.beta80group.stud.services.LoginService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/logout/*")
public class LogoutServlet extends HttpServlet {
    public static final String JWTTOK = "JWTTOK";
    public static final int MAX_AGE = 3 * 24 * 60 * 60; //TRE GIORNI
    final Logger logger = LogManager.getLogger(LogoutServlet.class);
    private static final long serialVersionUID = 1L;

    private LoginService loginService;
    public LogoutServlet() {
        super();
        loginService = LoginService.getInstance();
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("CALLED /login doGet");
        RequestDispatcher dispatcher = null;
        Cookie c = new Cookie(JWTTOK, "ohmygoodnes");
        c.setPath("/");
        c.setMaxAge(MAX_AGE);
        response.addCookie(c);
        dispatcher = request.getRequestDispatcher("/WEB-INF/login/login.jsp");
        dispatcher.forward(request, response);

    }
/*    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,  IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserInfo ui = loginService.doLogin(username, loginService.cryptPassword(password));
        if(ui != null){
            String token = loginService.createToken(ui);
            logger.info("login token {}", token);
            Cookie c = new Cookie(JWTTOK, token);
            c.setPath("/");
            c.setMaxAge(MAX_AGE);
            response.addCookie(c);

            if(ui.getUserType() == 1){
                response.sendRedirect("/employee");
            }
            else{
                response.sendRedirect("/hpHR");
            }
            return;
        }
        logger.info("CALLED /login doPost {} {}", username, password);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/login/login.jsp");
        dispatcher.forward(request, response);
    }
*/
}
