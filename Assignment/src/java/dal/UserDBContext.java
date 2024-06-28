/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.User;
import org.apache.tomcat.dbcp.dbcp2.SQLExceptionList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feature;
import model.Role;

/**
 *
 * @author sonng
 */
public class UserDBContext extends DBContext<User> {

    public User get(String username, String password) {

        User user = null;
        try {
            String sql = "SELECT \n"
                    + "    u.username,\n"
                    + "    u.displayname,\n"
                    + "    r.roleid,\n"
                    + "    r.rolename,\n"
                    + "    f.featureid,\n"
                    + "    f.url\n"
                    + "FROM users u \n"
                    + "    LEFT JOIN users_role ur ON u.username = ur.username\n"
                    + "    LEFT JOIN roles r ON r.roleid = ur.roleid\n"
                    + "    LEFT JOIN roles_features rf ON rf.roleid = r.roleid\n"
                    + "    LEFT JOIN features f ON f.featureid = rf.featureid\n"
                    + "WHERE u.username = ? AND u.password = ?\n"
                    + "ORDER BY u.username, r.roleid, f.featureid ASC";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();

            Role c_role = new Role();
            c_role.setId(-1);
            while (rs.next()) {
                if (user == null) {
                    user = new User();
                    user.setUsername(username);
                    user.setDisplayname(rs.getString("username"));
                }

                int roleid = rs.getInt("roleid");
                if (roleid != 0 && c_role.getId() != roleid) {
                    c_role = new Role();
                    c_role.setId(roleid);
                    c_role.setName(rs.getString("rolename"));
                    user.getRoles().add(c_role);
                }

                int featureid = rs.getInt("featureid");
                if (featureid != 0) {
                    Feature f = new Feature();
                    f.setId(featureid);
                    f.setUrl(rs.getString("url"));
                    c_role.getFeatures().add(f);
                }
            }

        } catch (SQLException ex) {

        } finally {
            try {
                

                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return user;
    }

    @Override
    public ArrayList<User> all() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
