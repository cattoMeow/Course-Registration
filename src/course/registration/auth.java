/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package course.registration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 *
 * @author PC
 */
public class auth {
    public static boolean isLogin(String personID, String typeLogin, JFrame frame){        
        try {
            Connection conn = sql.getConnection();
            String tabel = "";  
            switch (typeLogin){
                case "Student":
                    tabel = "student";
                    break;
                case "Staff":
                    tabel = "staff";
                    break;
                case "Instructor":
                    tabel = "instructor";
                    break;
                case "LA":
                    tabel = "ta";
                    break;
                case "TA":
                    tabel = "la";
                    break;    
            }
            String Query = 
                    "SELECT person.id, person.name FROM "+tabel
                    +" inner join person on "+tabel+".id = person.id"
                    +" WHERE "+tabel+".id = '"+personID+"'";
            PreparedStatement preparedStatement = conn.prepareStatement(Query);
            ResultSet rs = preparedStatement.executeQuery();
            
            while(rs.next()){
                Login_Session.personID = rs.getString("person.id");
                Login_Session.Nama = rs.getString("person.name");
                return true;
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
        return false;
    }

//    public static void getName(String personID, String typeLogin, JFrame frame) {
//        try {
//            String tabel = "";  
//            switch (typeLogin){
//                case "Student":
//                    nama = "";
//                    tabel = "student";
//                    break;
//                case "LA":
//                    tabel = "ta";
//                    break;
//                case "TA":
//                    tabel = "la";
//                    break;    
//            }
//            Connection conn = sql.getConnection();
//            
//            String Query = 
//                    "SELECT * FROM person WHERE ID = '"+personID+"'";
//            PreparedStatement preparedStatement = conn.prepareStatement(Query);
//            ResultSet rs = preparedStatement.executeQuery();
//            
//            while(rs.next()){
//                Login_Session.Nama = rs.getString("ID");
//            }
//        } catch (Exception e) {
//            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
//        }
//    }
}
