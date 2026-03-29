package controller;

import domain.Product;
import domain.Manufacturer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.ProductDAO;
import util.ManufacturerDAO;

import java.io.IOException;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO productDAO = new ProductDAO();
        ManufacturerDAO manufacturerDAO = new ManufacturerDAO();

        request.setAttribute("products", productDAO.getAll());
        request.setAttribute("manufacturers", manufacturerDAO.getAll());

        request.getRequestDispatcher("/views/product.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            Product p = new Product();
            Manufacturer m = new Manufacturer();

            p.setName(request.getParameter("name"));
            p.setSize(request.getParameter("size"));
            p.setWeight(Double.parseDouble(request.getParameter("weight")));

            m.setId(Long.parseLong(request.getParameter("manufacturerId")));
            p.setManufacturer(m);

            dao.insert(p);
        }

        if ("delete".equals(action)) {
            dao.delete(Long.parseLong(request.getParameter("id")));
        }

        if ("update".equals(action)) {
            Product p = new Product();
            Manufacturer m = new Manufacturer();

            p.setId(Long.parseLong(request.getParameter("id")));
            p.setName(request.getParameter("name"));
            p.setSize(request.getParameter("size"));
            p.setWeight(Double.parseDouble(request.getParameter("weight")));

            m.setId(Long.parseLong(request.getParameter("manufacturerId")));
            p.setManufacturer(m);

            dao.update(p);
        }

        response.sendRedirect("product");
    }
}