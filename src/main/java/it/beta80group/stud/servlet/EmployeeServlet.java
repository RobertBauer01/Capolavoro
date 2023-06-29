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
import java.rmi.RemoteException;
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
            Long idTask = Long.parseLong(pathInfo.split("/")[1]);
            logger.info("CALLED /employee/{} doGet", idTask);

            details(idTask, request, response);
        }
    }



    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/employee/employee.jsp");
        List<Employee> list;
        Employee employee = null;
        try {
            Long idLog = (Long) request.getSession().getAttribute("idLoggedUser");
            list = empService.list(idLog);
            request.setAttribute("employee_list", list);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        try {
            Long idLog = (Long) request.getSession().getAttribute("idLoggedUser");
            employee=empService.user(idLog);
            request.setAttribute("empmodel", employee);

        } catch (SQLException ee) {
            throw new RuntimeException(ee);
        }

        dispatcher.forward(request, response);
    }



    private void details(Long id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Employee employee = null;
        RequestDispatcher dispatcher = null;
        try {
            Long idLog = (Long) request.getSession().getAttribute("idLoggedUser");
            employee = empService.getById(id,idLog);
            employee.setIdUser(idLog);
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
        HttpServletResponse res = (HttpServletResponse) response;
        logger.info("CALLED /employee/ doPost");
        String idTask = request.getParameter("idTask");
        String idUser = request.getParameter("idUser");
        logger.info("stringa idTask: " + idTask);
        logger.info("stringa idUser: " + idUser);
        List<Employee> list;
        try {
            Long idLog = (Long) request.getSession().getAttribute("idLoggedUser");
            empService.update(idTask,idUser);
            list = empService.list(idLog);
            request.setAttribute("employee_list", list);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        res.sendRedirect("/employee");
    }
}