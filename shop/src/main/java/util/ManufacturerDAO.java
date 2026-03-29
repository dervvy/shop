package util;

import domain.Manufacturer;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ManufacturerDAO {

    public List<Manufacturer> getAll() {
        List<Manufacturer> list = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT * FROM manufacturer";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Manufacturer m = new Manufacturer();

                m.setId(rs.getLong("id"));  // ✅
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
}