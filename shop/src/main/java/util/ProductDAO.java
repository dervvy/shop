package util;

import domain.Product;
import domain.Manufacturer;

import java.sql.*;
import java.util.*;

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
                m.setId(rs.getLong("m_id"));
                m.setName(rs.getString("m_name"));

                Product p = new Product();
                p.setId(rs.getLong("id"));
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

    public void insert(Product p) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO product(name, size, weight, manufacturer_id) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setString(2, p.getSize());
            ps.setDouble(3, p.getWeight());
            ps.setLong(4, p.getManufacturer().getId());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(Long id) {
        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM product WHERE id=?");
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(Product p) {
        try (Connection conn = DBConnection.getConnection()) {

            String sql = "UPDATE product SET name=?, size=?, weight=?, manufacturer_id=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, p.getName());
            ps.setString(2, p.getSize());
            ps.setDouble(3, p.getWeight());
            ps.setLong(4, p.getManufacturer().getId());
            ps.setLong(5, p.getId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}