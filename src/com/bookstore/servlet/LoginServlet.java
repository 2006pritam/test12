package com.bookstore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.bookstore.util.DBUtil;

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String loginId = trimToEmpty(request.getParameter("loginId"));
        if (loginId.isEmpty()) {
            loginId = trimToEmpty(request.getParameter("email"));
        }
        String password = trimToEmpty(request.getParameter("password"));

        if (loginId.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Please enter login ID and password.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        try (Connection con = DBUtil.getConnection()) {
            String foundUser = authenticateUser(con, loginId, password);

            if (foundUser != null) {
                request.setAttribute("email", foundUser);
                RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("error", "Invalid login ID or password.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            log("Login failed due to a server error.", e);
            request.setAttribute("error", "Unable to login right now. Please verify database configuration.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    private String authenticateUser(Connection con, String loginId, String password) throws Exception {
        String sqlByEmail = "SELECT email FROM users WHERE email = ? AND password = ?";

        try (PreparedStatement ps = con.prepareStatement(sqlByEmail)) {
            ps.setString(1, loginId);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String email = rs.getString("email");
                    return email != null && !email.trim().isEmpty() ? email : loginId;
                }
            }
        }

        String sqlById = "SELECT email FROM users WHERE id = ? AND password = ?";

        try (PreparedStatement ps = con.prepareStatement(sqlById)) {
            ps.setString(1, loginId);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String email = rs.getString("email");
                    return email != null && !email.trim().isEmpty() ? email : loginId;
                }
            }
        } catch (SQLException e) {
            String state = e.getSQLState();
            String message = e.getMessage() == null ? "" : e.getMessage().toLowerCase();
            if (!"42S22".equals(state) && !message.contains("unknown column")) {
                throw e;
            }
        }

        return null;
    }

    private String trimToEmpty(String value) {
        return value == null ? "" : value.trim();
    }
}
