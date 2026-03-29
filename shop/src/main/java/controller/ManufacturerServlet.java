package controller;

import domain.Manufacturer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.ManufacturerDAO;

import java.io.IOException;

@WebServlet("/manufacturer") // URL для доступа к JSP
public class ManufacturerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ManufacturerServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ManufacturerDAO dao = new ManufacturerDAO();

        request.setAttribute("manufacturers", dao.getAll());

        request.getRequestDispatcher("/views/manufacturer.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}