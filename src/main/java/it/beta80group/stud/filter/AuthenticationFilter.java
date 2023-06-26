package it.beta80group.stud.filter;

import it.beta80group.stud.services.LoginService;
import it.beta80group.stud.servlet.LoginServlet;
import it.beta80group.stud.servlet.UserServlet;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {

    final Logger logger = LogManager.getLogger(AuthenticationFilter.class);

    private ServletContext context;
    private LoginService loginService;

    public void init(FilterConfig fConfig) throws ServletException {
        this.context = fConfig.getServletContext();
        logger.info("Authentication initialized");
        loginService = LoginService.getInstance();
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        logger.info("Requested Resource::"+uri);

        HttpSession session = req.getSession(false);

        if(chekifCookieIsPresentAndValid(req) || uri.equals("/login") || uri.startsWith("/static")){
            logger.info("Passed request");
            chain.doFilter(request, response);
        }else{
            logger.info("Unauthorized access request");
            res.sendRedirect("/login");
        }
    }

    private Boolean chekifCookieIsPresentAndValid(HttpServletRequest req){

        Cookie[] cookies = req.getCookies();
        String jwtCookieValue = getJWTCookieValue(cookies);
        return loginService.isValid(jwtCookieValue);
    }

    private String getJWTCookieValue(Cookie[] cookies){
        if(cookies == null || cookies.length == 0){
            return null;
        }
        for (Cookie ck: cookies) {
            String cn = ck.getName();
            if(LoginServlet.JWTTOK.equals(cn)){
                return ck.getValue();
            }
        }
        return null;
    }

    public void destroy() {
        //close any resources here
    }

}
