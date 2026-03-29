package util;

import domain.Product;
import domain.Manufacturer;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {

            String sql = """
                SELECT p.*, m.id as m_id, m.name as m_name
                FROM product p
                JOIN manufacturer m ON p.manufacturer_id = m.id
            """;

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Manufacturer m = new Manufacturer();
                m.setId(rs.getLong("m_id"));      // ✅
                m.setName(rs.getString("m_name"));

                Product p = new Product();
                p.setId(rs.getLong("id"));        // ✅
                p.setName(rs.getString("name"));
                p.setSize(rs.getString("size"));
                p.setWeight(rs.getDouble("weight"));
                p.setManufacturer(m);

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}