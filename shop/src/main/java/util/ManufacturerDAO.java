package util;

import domain.Manufacturer;
import java.sql.*;
import java.util.*;

public class ManufacturerDAO {

    public List<Manufacturer> getAll() {
        List<Manufacturer> list = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM manufacturer";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Manufacturer m = new Manufacturer();

                m.setId(rs.getLong("id"));
                m.setName(rs.getString("name"));
                m.setCountry(rs.getString("country"));
                m.setContactPerson(rs.getString("contact_person"));
                m.setPhone(rs.getString("phone"));

                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void insert(Manufacturer m) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO manufacturer(name, country, contact_person, phone) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, m.getName());
            ps.setString(2, m.getCountry());
            ps.setString(3, m.getContactPerson());
            ps.setString(4, m.getPhone());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(Long id) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM manufacturer WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(Manufacturer m) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE manufacturer SET name=?, country=?, contact_person=?, phone=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, m.getName());
            ps.setString(2, m.getCountry());
            ps.setString(3, m.getContactPerson());
            ps.setString(4, m.getPhone());
            ps.setLong(5, m.getId());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}