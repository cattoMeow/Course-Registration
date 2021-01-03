/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package course.registration.student;

import course.registration.Login_Session;
import course.registration.sql;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author PC
 */
public class student {
    
    public static DefaultTableModel getCourse(JFrame frame){
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("ID");
        model.addColumn("Title");
        model.addColumn("Desc");
        model.addColumn("Classroom");
        model.addColumn("Year");

        try {
            Connection conn = sql.getConnection();
            String Query = 
                    "SELECT y1course.desig, course.title, course.descr, course.classroom "
                    +"FROM y1course "
                    +"inner join course on y1course.desig = course.desig";
            PreparedStatement preparedStatement = conn.prepareStatement(Query);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                model.addRow(new Object[]{rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4), ("1")});
            }
            
            Query = 
                    "SELECT y2course.desig, course.title, course.descr, course.classroom "
                    +"FROM y2course "
                    +"inner join course on y2course.desig = course.desig";
            preparedStatement = conn.prepareStatement(Query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                model.addRow(new Object[]{rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4), ("2")});
            }
            
            Query = 
                    "SELECT y3course.desig, course.title, course.descr, course.classroom "
                    +"FROM y3course "
                    +"inner join course on y3course.desig = course.desig";
            preparedStatement = conn.prepareStatement(Query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                model.addRow(new Object[]{rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4), ("3")});
            }
            
            Query = 
                    "SELECT y4course.desig, course.title, course.descr, course.classroom "
                    +"FROM y4course "
                    +"inner join course on y4course.desig = course.desig";
            preparedStatement = conn.prepareStatement(Query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                model.addRow(new Object[]{rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4), ("4")});
            }
            return model; //return model dari jtable
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
        return model;
    }
    
    public static DefaultTableModel getRegisteredCourse(String year, JFrame frame){
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("ID");
        model.addColumn("Title");
        model.addColumn("Classroom");
        model.addColumn("Status");
        model.addColumn("Year");

        try {
            Connection conn = sql.getConnection();
            String Query = 
                    "SELECT course.desig, course.title, course.classroom, l1.status "
                    +"FROM l1 "
                    +"inner join course on l1.desig = course.desig "
                    + "Where l1.ID = '"+Login_Session.personID+"' AND l1.status = 'R'";
            PreparedStatement preparedStatement = conn.prepareStatement(Query);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                model.addRow(new Object[]{rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4), ("1")});
            }
            
            Query = 
                    "SELECT course.desig, course.title, course.classroom, l2.status "
                    +"FROM l2 "
                    +"inner join course on l2.desig = course.desig "
                    + "Where l2.ID = '"+Login_Session.personID+"' AND l2.status = 'R'";
            preparedStatement = conn.prepareStatement(Query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                model.addRow(new Object[]{rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4), ("2")});
            }
            
            Query = 
                    "SELECT course.desig, course.title, course.classroom, l3.status "
                    +"FROM l3 "
                    +"inner join course on l3.desig = course.desig "
                    + "Where l3.ID = '"+Login_Session.personID+"' AND l3.status = 'R'";
            preparedStatement = conn.prepareStatement(Query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                model.addRow(new Object[]{rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4), ("3")});
            }
            
            Query = 
                    "SELECT course.desig, course.title, course.classroom, l4.status "
                    +"FROM l4 "
                    +"inner join course on l4.desig = course.desig "
                    + "Where l4.ID = '"+Login_Session.personID+"' AND l4.status = 'R'";
            preparedStatement = conn.prepareStatement(Query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                model.addRow(new Object[]{rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4), ("4")});
            }
            return model; //return model dari jtable
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
        return model;
    }
    
    public static void registerCourse_Insert(String Year, String IDCourse, JFrame frame){
        try {
            Connection conn = sql.getConnection();
            String Query = 
                    "Insert into l"+Year+" "
                    +"Values('"+Login_Session.personID+"', '"+IDCourse+"', 'R')";
            PreparedStatement preparedStatement = conn.prepareStatement(Query);
            preparedStatement.execute();
            JOptionPane.showMessageDialog(null, "Course Registration Success");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
    }
    
    public static void registerCourse_delete(String Year, String IDCourse, JFrame frame){
        try {
            Connection conn = sql.getConnection();
            String Query = "delete from l"+Year+" where desig='"+IDCourse+"' AND ID='"+Login_Session.personID+"'";
            PreparedStatement preparedStatement = conn.prepareStatement(Query);
            preparedStatement.execute();
            JOptionPane.showMessageDialog(null, "Delete Course Success");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
    }
    
    public static boolean prereqPASS(String IDCourse, JFrame frame){
        try {
            String ID_Prereq = null;
            String cekIfPass = null;
            String year = null;
            Connection conn = sql.getConnection();
            String Query;
            PreparedStatement preparedStatement;
            ResultSet rs;
            
            int index1 = 1, index2=1;
            while (true) {                   
                Query = 
                        "Select desig1 From prereq"+String.valueOf(index1)+String.valueOf(index2)+" "
                        + "where desig2 = '"+IDCourse+"'";
                preparedStatement = conn.prepareStatement(Query);
                rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    ID_Prereq = rs.getString(1);
                }

                if ((index1==4)&&(index2==4)) {
                    break;
                }
                
                index2 += 1;
                
                if (index2 == 4) {
                    index1 += 1;
                    index2 = index1;
                }            
            }
            
            if (ID_Prereq == null) { //bila matkul tanpa prereq
                return true;
            }
 
            String tes = null;
            for (int i = 1; i <= 4; i++) {
                Query = 
                        "Select desig From y"+i+"course where desig = '"+ID_Prereq+"'";
                preparedStatement = conn.prepareStatement(Query);
                rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    tes = rs.getString(1);
                    if (tes != null) {
                        year = String.valueOf(i);
                        break;
                    }
                }
            }
            
            Query = 
                    "Select id From l"+year+" where desig = '"+ID_Prereq+"' and status = 'P' and id = '"+Login_Session.personID+"'";
            preparedStatement = conn.prepareStatement(Query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                cekIfPass = rs.getString(1);
            }
            
            if (ID_Prereq == null) { //bila prereq dari matkul tidak ada
                return true;
            } else if (cekIfPass != null){ //bila prereq terpenuhi
                return true;
            }
            return false;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
        return false;
    }
    
    public static boolean antireqPASS(String IDCourse, String CourseYear, JFrame frame){
        try {
            Connection conn = sql.getConnection();
            String Query;
            PreparedStatement preparedStatement;
            ResultSet rs;
            String antireqCheck = null;
            
            Query = 
                    "Select * from antireq"+CourseYear+" where desig1 = '"+IDCourse+"' or desig2 = '"+IDCourse+"'";
            preparedStatement = conn.prepareStatement(Query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                if (rs.getString(1).equals(IDCourse)) {
                    antireqCheck = rs.getString(2);
                } else {
                    antireqCheck = rs.getString(1);
                }
            }
            
            String year = null;
            String nullCheck = null;
            for (int i = 1; i <= 4; i++) {
                Query = 
                        "Select desig From y"+i+"course where desig = '"+antireqCheck+"'";
                preparedStatement = conn.prepareStatement(Query);
                rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    nullCheck = rs.getString(1);
                    if (nullCheck != null) {
                        year = String.valueOf(i);
                        break;
                    }
                }
            }
            
            if (year == null) return true;
            
            String passCheck = null; 
            Query = 
                    "Select * from l"+year+" "
                    + "where ID = '"+Login_Session.personID+"' and desig = '"+antireqCheck+"' and (status = 'R' or status = 'P')";
            preparedStatement = conn.prepareStatement(Query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                passCheck = rs.getString(1);
            }
            
            return passCheck == null; //jika kosong maka boleh mengambil course
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
        return false;
    }
    
    public static String getPrereqName(String IDCourse, String Year, JFrame frame){
        try {
            Connection conn = sql.getConnection();
            String Query;
            PreparedStatement preparedStatement;
            ResultSet rs;
            String ID_Prereq = null;
            
            int index1 = 1, index2=1;
            while (true) {                   
                Query = 
                        "Select desig1 From prereq"+String.valueOf(index1)+String.valueOf(index2)+" "
                        + "where desig2 = '"+IDCourse+"'";
                preparedStatement = conn.prepareStatement(Query);
                rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    ID_Prereq = rs.getString(1);
                }

                if ((index1==4)&&(index2==4)) {
                    break;
                }
                
                index2 += 1;
                
                if (index2 == 4) {
                    index1 += 1;
                    index2 = index1;
                }            
            }
            
            Query = 
                    "Select title from course where desig = '"+ID_Prereq+"'";
            preparedStatement = conn.prepareStatement(Query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            return "error";
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
        return "error";
    }
    
    public static String getAntireqName(String IDCourse, String Year, JFrame frame){
        try {
            Connection conn = sql.getConnection();
            String Query;
            PreparedStatement preparedStatement;
            ResultSet rs;
            String getTitle = null;
            
            Query = 
                    "Select * from antireq"+Year+" where desig1 = '"+IDCourse+"' or desig2 = '"+IDCourse+"'";
            preparedStatement = conn.prepareStatement(Query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                if (rs.getString(1).equals(IDCourse)) {
                    getTitle = rs.getString(2);
                } else {
                    getTitle = rs.getString(1);
                }
            }
            
            Query = 
                    "Select title from course where desig = '"+getTitle+"'";
            preparedStatement = conn.prepareStatement(Query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            
            return "error";
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
        return "error";
    }
    
    public static DefaultTableModel getHistoryCourse(JFrame frame){
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("ID");
        model.addColumn("Title");
        model.addColumn("Classroom");
        model.addColumn("Status");
        model.addColumn("Year");

        try {
            Connection conn = sql.getConnection();
            String Query;
            PreparedStatement preparedStatement;
            ResultSet rs;
            
            for (int i = 1; i <= 4; i++) {
                Query = 
                        "SELECT course.desig, course.title, course.classroom, l"+i+".status "
                        +"FROM l"+i+" "
                        +"inner join course on l"+i+".desig = course.desig "
                        + "Where l"+i+".ID = '"+Login_Session.personID+"' AND (l"+i+".status = 'P' or l"+i+".status = 'F')";
                preparedStatement = conn.prepareStatement(Query);
                rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    model.addRow(new Object[]{rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4), (i)});
                }
            }
            return model; //return model dari jtable
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
        return model;
    } 
}
