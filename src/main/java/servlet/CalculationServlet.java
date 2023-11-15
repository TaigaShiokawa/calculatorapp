package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/calculation-servlet")
public class CalculationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getRequestDispatcher("calc.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if("calculation".equals(action)) {
		int num1 = Integer.parseInt(request.getParameter("calc1"));
		int num2 = Integer.parseInt(request.getParameter("calc2"));
		String calc = request.getParameter("calc");
		int result = 0;
		
		if("add".equals(calc)) {
			result = num1 + num2;
		} else if("min".equals(calc)) {
			result = num1 - num2;
		}else if("multi".equals(calc)) {
			result = num1 * num2;
		}else if("dev".equals(calc)) {
			result = num2 != 0 ? num1 / num2 : 0;
		} 
		
		request.setAttribute("result", result);
	} else if("clear".equals(action)) {
		request.setAttribute("result", 0);
	}else if("clearResult".equals(action)) {
        request.setAttribute("result", 0); 
    }
		request.getRequestDispatcher("calc.jsp").forward(request, response);
	}
}
