package Filters;

import java.io.IOException;
import java.util.UUID;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class CSRFProtectionFilter implements Filter{
	@Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(true); // tạo nếu chưa có

        // Tạo token nếu chưa có
        if (session.getAttribute("csrfToken") == null) {
            String csrfToken = UUID.randomUUID().toString();
            session.setAttribute("csrfToken", csrfToken);
        }

        // Đưa token vào request để JSP sử dụng
        request.setAttribute("csrfToken", session.getAttribute("csrfToken"));

        // Nếu là POST request, kiểm tra CSRF token
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String sessionToken = (String) session.getAttribute("csrfToken");

            // Lấy token từ header (fetch) hoặc từ form (parameter)
            String headerToken = request.getHeader("csrfToken");
            String formToken = request.getParameter("csrfToken");

            boolean valid = sessionToken != null && (
                sessionToken.equals(headerToken) || sessionToken.equals(formToken)
            );

            if (!valid) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "CSRF token mismatch.");
                return;
            }
        }

        chain.doFilter(req, res);
    }
}
