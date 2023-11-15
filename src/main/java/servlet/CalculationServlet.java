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
			int result = 0;
			int num1 = Integer.parseInt(request.getParameter("calc1"));
			int num2 = Integer.parseInt(request.getParameter("calc2"));
			
			String calcMulti = request.getParameter("calcMulti");
            int num3 = calcMulti != null && "multi2".equals(calcMulti) ? 
            		Integer.parseInt(request.getParameter("calc3")) : 1;
            
			String calc = request.getParameter("calc");
			
			if("add".equals(calc)) {
				result = num1 + num2;
				if("multi2".equals(calcMulti)) {
                    result *= num3;
                }
			} else if("min".equals(calc)) {
				result = num1 - num2;
			} else if("multi".equals(calc)) {
				result = num1 * num2;
			} else if("dev".equals(calc)) {
				result = num2 != 0 ? num1 / num2 : 0;
			} 
			
			request.setAttribute("result", result);
		} else if("clearResult".equals(action)) { //計算結果クリアボタン
	        request.setAttribute("result", 0); 
	    } 
		request.getRequestDispatcher("calc.jsp").forward(request, response);
	}
}
