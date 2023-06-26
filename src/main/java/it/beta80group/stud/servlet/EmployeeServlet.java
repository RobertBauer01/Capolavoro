package it.beta80group.stud.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import it.beta80group.stud.model.Employee;
import it.beta80group.stud.model.Task;
import it.beta80group.stud.model.User;
import it.beta80group.stud.services.EmployeeService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;


/**
 * Servlet implementation class HelloWorldServlet
 */
@WebServlet("/employee/*")
public class EmployeeServlet extends HttpServlet {

    final Logger logger = LogManager.getLogger(UserServlet.class);
    private static final long serialVersionUID = 1L;
    private EmployeeService empService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeServlet() {
        super();
        empService = EmployeeService.getInstance();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("CALLED /employee/ doGet");
        String pathInfo = request.getPathInfo();
        if(pathInfo == null || pathInfo.equalsIgnoreCase("/")){
            logger.info("CALLED /employee/ doGet");
            list(request, response);
        }
        else{
            Long id = Long.parseLong(pathInfo.split("/")[1]);
            logger.info("CALLED /employee/{} doGet", id);

            details(id, request, response);
        }
    }



    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/employee/employee.jsp");
        List<Employee> list;
        try {
            list = empService.list(192L);
            request.setAttribute("employee_list", list);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        dispatcher.forward(request, response);
    }



    private void details(Long id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Employee employee = null;
        RequestDispatcher dispatcher = null;
        try {
            employee = empService.getById(id);
            if(employee != null){
                dispatcher = request.getRequestDispatcher("/WEB-INF/employee/employee_details.jsp");
                request.setAttribute("employee_model", employee);
            }
            else{
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                dispatcher = request.getRequestDispatcher("/WEB-INF/not_found.jsp");

            }
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("CALLED /employee/ doPost");
        String title = request.getParameter("title").trim();
        String description = request.getParameter("description");
        String imgSrc = request.getParameter("imgSrc");
        String link = request.getParameter("link");
        String status = request.getParameter("status");
        Long orderCol = Long.valueOf(request.getParameter("orderCol"));
        List<Employee> list;
        try {
            empService.save(title, description, imgSrc, link, java.sql.Date.valueOf(status), orderCol);
            list = empService.list(192L);
            request.setAttribute("employee_list", list);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/employee/employee.jsp");
        dispatcher.forward(request, response);
    }
}