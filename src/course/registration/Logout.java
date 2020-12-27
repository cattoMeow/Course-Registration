/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package course.registration;
import javax.swing.JFrame;

/**
 *
 * @author PC
 */
public class Logout {
    public static void logOut(JFrame redirectContext, JFrame oldContext){
        Login_Session.isLoggedIn = false;
        redirectContext.setVisible(true);
        oldContext.dispose();
    }
}
