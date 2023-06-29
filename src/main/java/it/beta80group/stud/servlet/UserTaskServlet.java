package it.beta80group.stud.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import it.beta80group.stud.model.Employee;
import it.beta80group.stud.model.Task;
import it.beta80group.stud.model.User;
import it.beta80group.stud.model.UserTask;
import it.beta80group.stud.services.EmployeeService;
import it.beta80group.stud.services.UserTaskService;
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
@WebServlet("/user_task_details/*")
public class UserTaskServlet extends HttpServlet{
    final Logger logger = LogManager.getLogger(UserTaskServlet.class);
    private static final long serialVersionUID = 1L;
    private UserTaskService usTkService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserTaskServlet() {
        super();
        usTkService = usTkService.getInstance();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Altri processi o logica della servlet

        // Inoltro alla pagina JSP desiderata
        logger.info("CALLED /user_task_details/ doGet");
        String pathInfo = request.getPathInfo();

        Long id = Long.parseLong(pathInfo.split("/")[1]);
        logger.info("CALLED /employee/{} doGet", id);

        details(id, request, response);
    }

    private void details(Long id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserTask userTask = null;
        List<UserTask> listTask;
        RequestDispatcher dispatcher = null;
        try {
            listTask = usTkService.listTask(id);

            request.setAttribute("task_list", listTask);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        try {
            userTask = usTkService.getById(id);
            if(userTask != null){
                dispatcher = request.getRequestDispatcher("/WEB-INF/users/user_task_details.jsp");
                request.setAttribute("user_model", userTask);
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
}
