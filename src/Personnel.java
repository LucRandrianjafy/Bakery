package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connexion.Connexion;

public class Personnel {
    private int idPersonnel;
    private String nom;

    public Personnel() {}

    public Personnel(int idPersonnel, String nom) {
        this.setIdPersonnel(idPersonnel);
        this.setNom(nom);
    }

    public int getIdPersonnel() {
        return idPersonnel;
    }

    public void setIdPersonnel(int idPersonnel) {
        this.idPersonnel = idPersonnel;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public boolean insert() {
        String sql = "INSERT INTO staff (name) VALUES (?)";
        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, this.getNom());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Erreur lors de l'insertion du personnel !");
            e.printStackTrace();
            return false;
        }
    }

    public boolean update() {
        String sql = "UPDATE staff SET name = ? WHERE id_staff = ?";
        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, this.getNom());
            pstmt.setInt(2, this.getIdPersonnel());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Erreur lors de la mise à jour du personnel !");
            e.printStackTrace();
            return false;
        }
    }

    public static Personnel getById(int id) {
        String sql = "SELECT * FROM staff WHERE id_staff = ?";
        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Personnel personnel = new Personnel();
                personnel.setIdPersonnel(rs.getInt("id_staff"));
                personnel.setNom(rs.getString("name"));
                return personnel;
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération du personnel !");
            e.printStackTrace();
        }
        return null;
    }

    public boolean delete() {
        String sql = "DELETE FROM staff WHERE id_staff = ?";
        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, this.getIdPersonnel());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Erreur lors de la suppression du personnel !");
            e.printStackTrace();
            return false;
        }
    }

    public static List<Personnel> getAll() {
        List<Personnel> personnelList = new ArrayList<>();
        String query = "SELECT id_staff, name FROM staff";

        try (Connection conn = Connexion.getConnexion();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Personnel personnel = new Personnel(
                    rs.getInt("id_staff"),
                    rs.getString("name")
                );
                personnelList.add(personnel);
            }

        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération des personnels !");
            e.printStackTrace();
        }

        return personnelList;
    }

    public void printPersonnel() {
        System.out.println("ID Personnel: " + this.getIdPersonnel());
        System.out.println("Nom: " + this.getNom());
    }
}