package it.beta80group.stud.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import it.beta80group.stud.model.Task;
import it.beta80group.stud.model.TestModel;
import it.beta80group.stud.services.TaskService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/hpHR/*")
public class HomeHRServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Altri processi o logica della servlet

        // Inoltro alla pagina JSP desiderata
        String jspPage = "/WEB-INF/homepage/hpHR.jsp";
        getServletContext().getRequestDispatcher(jspPage).forward(request, response);
    }
}
