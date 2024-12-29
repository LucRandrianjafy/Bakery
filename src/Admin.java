package model;

import connexion.Connexion;

import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Admin {
    private int id;
    private String name;
    private String email;
    private String password;

    public Admin() {}

    public Admin(String name, String password) {
        this.name = name;
        this.password = password;
    }

    public Admin(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }


    public boolean insert() {
        String query = "INSERT INTO admin (name, email, password) VALUES (?, ?, ?)";

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, this.getName());
            pstmt.setString(2, this.getEmail());
            pstmt.setString(3, this.getPassword());

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int login() {
        String query = "SELECT id_admin FROM admin WHERE name = ? AND password = ?";

        try (Connection conn = Connexion.getConnexion();
            PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, this.getName());
            pstmt.setString(2, this.getPassword());

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int userId = rs.getInt("id_admin");
                    return userId;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }



    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
