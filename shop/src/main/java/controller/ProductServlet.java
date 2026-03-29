package controller;

import domain.Product;
import domain.Manufacturer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.ManufacturerDAO;
import util.ProductDAO;

import java.io.IOException;

@WebServlet("/product") // URL для доступа к JSP
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProductServlet() {
        super();
    }

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
        doGet(request, response);
    }
}