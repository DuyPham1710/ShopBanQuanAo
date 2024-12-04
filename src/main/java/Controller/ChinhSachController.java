package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ChinhSachController
 */
public class ChinhSachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChinhSachController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String chinhSach = request.getParameter("chinhSach");
		if ("Bảo mật".equals(chinhSach)) {
		    RequestDispatcher req = request.getRequestDispatcher("/views/policies/ChinhSachBaoMat.jsp");
		    req.forward(request, response);
		}
		if ("Vận chuyển".equals(chinhSach)) {
		    RequestDispatcher req = request.getRequestDispatcher("/views/policies/ChinhSachVanChuyen.jsp");
		    req.forward(request, response);
		}
		if ("Đổi trả".equals(chinhSach)) {
		    RequestDispatcher req = request.getRequestDispatcher("/views/policies/ChinhSachDoiTra.jsp");
		    req.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
