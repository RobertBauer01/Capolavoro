package it.beta80group.stud.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import it.beta80group.stud.model.Task;
import it.beta80group.stud.model.TestModel;
import it.beta80group.stud.model.User;
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

/**
 * Servlet implementation class HelloWorldServlet
 */
@WebServlet("/task/*")

// Servlet che gestisce le richieste relative ai task
public class TaskServlet extends HttpServlet {

	final Logger logger = LogManager.getLogger(TaskServlet.class);
	private static final long serialVersionUID = 1L;
	private TaskService tkService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TaskServlet() {
		super();
		tkService = TaskService.getInstance();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Gestione delle richieste GET, ti direziona verso la pagina richiesta
		logger.info("CALLED /task/ doGet");
		String pathInfo = request.getPathInfo();
		if (pathInfo == null || pathInfo.equalsIgnoreCase("/")) {
			logger.info("CALLED /task/ doGet");
			list(request, response);
		} else {
			Long id = Long.parseLong(pathInfo.split("/")[1]);
			logger.info("CALLED /task/{} doGet", id);

			details(id, request, response);
		}

	}

	private void details(Long id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Recupero dei dettagli di un task specifico
		request.getSession().removeAttribute("error");
		Task tsk = null;
		RequestDispatcher dispatcher = null;
		try {
			tsk = tkService.getById(id);
			if (tsk != null) {
				dispatcher = request.getRequestDispatcher("/WEB-INF/tasks/taskDetails.jsp");
				request.setAttribute("task_model", tsk);
			} else {
				response.setStatus(HttpServletResponse.SC_NOT_FOUND);
				dispatcher = request.getRequestDispatcher("/WEB-INF/not_found.jsp");

			}
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
	}

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Recupero dell'elenco completo dei task
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/tasks/task.jsp");
		List<Task> tasks;
		try {
			tasks = tkService.list();
			request.setAttribute("task_list", tasks);
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
		logger.info("CALLED /task/ doPost");
		String title = request.getParameter("title").trim();
		String description = request.getParameter("description");
		String imgSrc = request.getParameter("imgSrc");
		String link = request.getParameter("link");
		String status = request.getParameter("status");
		Long orderCol = Long.valueOf(request.getParameter("orderCol"));
		List<Task> list;
		try {
			tkService.save(title, description, imgSrc, link, Long.valueOf(status), orderCol);
			list = tkService.list();
			request.setAttribute("task_list", list);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/tasks/task.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			logger.info("CALLED /task/ doPut");
			String idStr = request.getParameter("idTask");
			Long id = Long.parseLong(idStr);
			try (InputStream inputStream = request.getInputStream()) {
				BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
				String json = br.readLine();
				ObjectMapper mapper = new ObjectMapper();
				Task testModel = mapper.readValue(json, Task.class);
				testModel.setIdTask(id);
				tkService.update(testModel);
				response.setStatus(HttpServletResponse.SC_OK);
				PrintWriter writer = response.getWriter();
				writer.append("OK");
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		} catch (Exception e) {
			request.getSession().setAttribute("error", "Hai dimenticato/sbagliato un campo");
		}
	}
}
