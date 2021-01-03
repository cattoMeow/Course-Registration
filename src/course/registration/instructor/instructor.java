/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package course.registration.instructor;

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
public class instructor {

    public static DefaultTableModel getCourse(JFrame frame) {
        DefaultTableModel model = new DefaultTableModel();

        String Query;
        PreparedStatement preparedStatement;
        ResultSet rs;

        model.addColumn("ID");
        model.addColumn("Title");
        model.addColumn("Desc");
        model.addColumn("Classroom");
        model.addColumn("Year");

        try {
            Connection conn = sql.getConnection();

            for (int i = 1; i <= 4; i++) {
                Query = "SELECT y" + i + "course.desig, course.title, course.descr, course.classroom "
                        + "FROM y" + i + "course "
                        + "inner join course on y" + i + "course.desig = course.desig";
                preparedStatement = conn.prepareStatement(Query);
                rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    model.addRow(new Object[]{rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), (i)});
                }
            }

            return model; //return model dari jtable
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
        return model;
    }

    public static DefaultTableModel Course(JFrame frame, boolean where) {
        DefaultTableModel model = new DefaultTableModel();

        String Query;
        PreparedStatement preparedStatement;
        ResultSet rs;

        model.addColumn("ID");
        model.addColumn("Title");
        model.addColumn("Desc");
        model.addColumn("Classroom");
        model.addColumn("Year");
        model.addColumn("Instruktor");

        try {
            Connection conn = sql.getConnection();

            Query = "SELECT hasi.desig, course.title, course.descr, course.classroom,  course.year, person.name "
                    + "FROM hasi "
                    + "inner join course on hasi.desig = course.desig "
                    + "inner join person on hasi.id = person.id";
            if (where == true) {
                Query += " where hasi.id = '" + Login_Session.personID + "'";
            }
            preparedStatement = conn.prepareStatement(Query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                model.addRow(new Object[]{rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)});
            }

            return model; //return model dari jtable
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
        return model;
    }

    public static void addNewCourse(JFrame frame, String CourseID, String title, String Desc, String Classroom, String Year, String AntiPrereq, String courseAntiPrereq, String courseAntiPrereqYear){
        try {
            Connection conn = sql.getConnection();
            String Query;
            PreparedStatement preparedStatement;

            Query = "Insert into Course Values('" + CourseID + "', '" + title + "', '" + Desc + "', '" + Classroom + "', '" + Year + "')";
            preparedStatement = conn.prepareStatement(Query);
            preparedStatement.execute();

            Query = "Insert into hasi Values('" + CourseID + "', '" + Login_Session.personID + "')";
            preparedStatement = conn.prepareStatement(Query);
            preparedStatement.execute();

            if ("Antireq".equals(AntiPrereq)) {
                Query = "Insert into antireq"+Year+" Values('"+CourseID+"', '"+courseAntiPrereq+"')";
                preparedStatement = conn.prepareStatement(Query);
                preparedStatement.execute();
            } else if ("Prereq".equals(AntiPrereq)) {
                Query = "Insert into prereq"+courseAntiPrereqYear+""+Year+" Values('"+courseAntiPrereq+"', '"+CourseID+"')";
                preparedStatement = conn.prepareStatement(Query);
                preparedStatement.execute();
            }

            JOptionPane.showMessageDialog(null, "Add New Course Success");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Database error: " + e.getMessage());
        }
    }
}
