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
}
