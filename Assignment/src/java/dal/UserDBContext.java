/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.User;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Lecturer;

/**
 *
 * @author sonnt-local
 */
public class UserDBContext extends DBContext<User> {

    public User getUserByUsernamePassword(String username, String password) {
        PreparedStatement stm =null;
        User user = null;
        try {
            String sql = "SELECT u.username, u.displayname, l.lid, l.lname, r.rolename\n"
                   + "FROM users u\n"
                   + "LEFT JOIN users_lecturers ul ON ul.username = u.username AND ul.active = 1\n"
                   + "LEFT JOIN lecturers l ON ul.lid = l.lid\n"
                   + "LEFT JOIN users_role ur ON u.username = ur.username\n"
                   + "LEFT JOIN roles r ON ur.roleid = r.roleid\n"
                   + "WHERE u.username = ? AND u.[password] = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                user = new User();
                user.setDisplayname(rs.getString("displayname"));
                user.setUsername(username);
                user.setRole(rs.getString("rolename"));
                int lid = rs.getInt("lid");
                if(lid!=0)
                {
                   Lecturer lecturer = new Lecturer();
                   lecturer.setId(lid);
                   lecturer.setName(rs.getString("lname"));
                   user.setLecturer(lecturer);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return user;
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

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    

    @Override
    public ArrayList<User> all() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
