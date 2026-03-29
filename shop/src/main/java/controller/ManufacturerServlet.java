package controller;

import domain.Manufacturer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.ManufacturerDAO;

import java.io.IOException;

@WebServlet("/manufacturer")
public class ManufacturerServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ManufacturerDAO dao = new ManufacturerDAO();
        request.setAttribute("manufacturers", dao.getAll());

        request.getRequestDispatcher("/views/manufacturer.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ManufacturerDAO dao = new ManufacturerDAO();
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            Manufacturer m = new Manufacturer();

            m.setName(request.getParameter("name"));
            m.setCountry(request.getParameter("country"));
            m.setContactPerson(request.getParameter("contactPerson"));
            m.setPhone(request.getParameter("phone"));

            dao.insert(m);
        }

        if ("delete".equals(action)) {
            Long id = Long.parseLong(request.getParameter("id"));
            dao.delete(id);
        }

        if ("update".equals(action)) {
            Manufacturer m = new Manufacturer();

            m.setId(Long.parseLong(request.getParameter("id")));
            m.setName(request.getParameter("name"));
            m.setCountry(request.getParameter("country"));
            m.setContactPerson(request.getParameter("contactPerson"));
            m.setPhone(request.getParameter("phone"));

            dao.update(m);
        }

        response.sendRedirect("manufacturer");
    }
}