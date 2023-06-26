package it.beta80group.stud.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import it.beta80group.stud.model.User;
import it.beta80group.stud.services.UserService;
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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;


/**
 * Servlet implementation class HelloWorldServlet
 */
@WebServlet("/users/*")
public class UserServlet extends HttpServlet {

	final Logger logger = LogManager.getLogger(UserServlet.class);
	private static final long serialVersionUID = 1L;
	private UserService usService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
		usService = UserService.getInstance();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("CALLED /users/ doGet");
		String pathInfo = request.getPathInfo();
		if(pathInfo == null || pathInfo.equalsIgnoreCase("/")){
			logger.info("CALLED /users/ doGet");
			list(request, response);
		}
		else{
			Long id = Long.parseLong(pathInfo.split("/")[1]);
			logger.info("CALLED /users/{} doGet", id);

			details(id, request, response);
		}
	}

	private void details(Long id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = null;
		RequestDispatcher dispatcher = null;
		try {
			user = usService.getById(id);
			if(user != null){
				dispatcher = request.getRequestDispatcher("/WEB-INF/users/users_details.jsp");
				request.setAttribute("user_model", user);
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

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/users/users.jsp");
		List<User> list;
		try {
			list = usService.list();

			request.setAttribute("users_list", list);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Long rl = 1L;
			LocalDate currentDate = LocalDate.now();
			Date sqlDate = Date.valueOf(currentDate);
			logger.info("CALLED /users/ doPost");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if (request.getParameter("rl") != null && !request.getParameter("rl").isEmpty()) {
				rl = Long.valueOf(request.getParameter("rl"));
			}
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			if (request.getParameter("orderCol") != null && !request.getParameter("orderCol").isEmpty()) {
				String dateString = request.getParameter("orderCol");
				try {
					LocalDate parsedDate = LocalDate.parse(dateString);
					sqlDate = Date.valueOf(parsedDate);
				} catch (java.time.format.DateTimeParseException e) {
					// Gestionare l'errore o lanciare un'eccezione appropriata
				}
			}
			List<User> list;
			try {
				usService.save(username, password, rl, name, surname, sqlDate);
				list = usService.list();
				request.setAttribute("users_list", list);
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/users/users.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e){
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/users/users.jsp");
			e.printStackTrace();
			request.setAttribute("errorVar","L'username è già esistente");
			try {
				request.setAttribute("users_list", usService.list());
			} catch (Exception e1){

			}
			dispatcher.forward(request, response);
		}
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("CALLED /users/ doDelete");
		String idStr = request.getParameter("idUser");
		Long id = Long.parseLong(idStr);
		User u = new User();
		u.setIdUser(id);
		List<User> list;
		try {
			usService.delete(u);
			response.setStatus(HttpServletResponse.SC_OK);
			PrintWriter writer = response.getWriter();
			writer.append("OK");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("CALLED /users/ doPut");
		String idStr = request.getParameter("idUser");
		Long id = Long.parseLong(idStr);
		try(InputStream inputStream = request.getInputStream()){
			BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
			String json = br.readLine();
			ObjectMapper mapper = new ObjectMapper();
			User user = mapper.readValue(json, User.class);
			user.setIdUser(id);
			usService.update(user);
			response.setStatus(HttpServletResponse.SC_OK);
			PrintWriter writer = response.getWriter();
			writer.append("OK");
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}