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
            String selectEks = "";
            switch (typeLogin){
                case "Student":
                    tabel = "student";
                    selectEks = ", student.year";
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
                    "SELECT person.id, person.name"+selectEks+" FROM "+tabel
                    +" inner join person on "+tabel+".id = person.id"
                    +" WHERE "+tabel+".id = '"+personID+"'";
            PreparedStatement preparedStatement = conn.prepareStatement(Query);
            ResultSet rs = preparedStatement.executeQuery();
            
            while(rs.next()){
                Login_Session.personID = rs.getString("person.id");
                Login_Session.Nama = rs.getString("person.name");
                
                switch (selectEks){
                    case ", student.year":
                        Login_Session.studentYear = rs.getString("student.year");
                }
                
                return true;
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
        return false;
    }

}
