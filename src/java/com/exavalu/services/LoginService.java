/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Appointment;
import com.exavalu.models.FbProfile;
import com.exavalu.models.Users;
import static com.exavalu.services.PatientService.log;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.SessionMap;

/**
 *
 * @author anich
 */
public class LoginService {

    /**
     *
     */
    public static LoginService loginService = null;

    /**
     *
     */
    public static Logger log = Logger.getLogger(LoginService.class.getName());

    private LoginService() {
    }

    /**
     *
     * @return
     */
    public static LoginService getInstance() {
        if (loginService == null) {
            return new LoginService();
        } else {
            return loginService;
        }
    }

    /**
     *
     * Used to check user credentials with the
     * database.
     * @param user
     * @return 
     */
    public boolean doLogin(Users user) {

        boolean result = false;

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "Select * from users right join role on role.roleId=users.roleId where emailAddress=? and password=? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getEmailAddress());
            ps.setString(2, user.getPassword());

            System.out.println("LoginService :: " + ps);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user.setRoleId(rs.getString("roleId"));
                user.setDoctorId(rs.getString("doctorId"));
                user.setPatientId(rs.getString("patientId"));
                user.setUserId(rs.getString("userId"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));

                result = true;
            }

        } catch (SQLException ex) {
            log.error("Not Found any user with given credential");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }
        return result;
    }

    /**
     *
     * Used to signup or add new user details to
     * the database.
     * @param user
     * @return 
     */
    public boolean doSignUp(Users user) {

        boolean result = false;
        String sql = "INSERT INTO users(emailAddress,password,firstName,lastName,occupation,address,gender,dateOfRegisteration)" + "VALUES(? ,? ,? ,? ,?,?,?,CURDATE())";

        try {
            Connection con = JDBCConnectionManager.getConnection();

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, user.getEmailAddress());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getFirstName());
            preparedStatement.setString(4, user.getLastName());
            preparedStatement.setString(5, user.getOccupation());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, user.getGender());

            System.out.println(preparedStatement);
            int res = preparedStatement.executeUpdate();

            if (res == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + " Duplicate Email Address");
            System.out.println(LocalDateTime.now() + "error code:" + e + "Duplicate Email Address");
        }

        return result;

    }

    /**
     *
     * Used to check if an user already exsists
     * in the database.
     * @param emailAddress
     * @param sessionMap
     * @return 
     */
    public boolean doExsists(String emailAddress, SessionMap sessionMap) {

        boolean result = false;
        Users users = new Users();

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "Select * from users right join role on role.roleId=users.roleId where emailAddress=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, emailAddress);

            System.out.println("LoginService :: " + ps);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                users.setEmailAddress(emailAddress);
                users.setPassword(rs.getString("password"));
                users.setUserId(rs.getString("userId"));
                sessionMap.put("Patient", users);

                result = true;
            }

        } catch (SQLException ex) {
            log.error(LocalDateTime.now() + "Sql Error :" + ex + "Not Found");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }

        return result;
    }

    /**
     *
     * Used to add the user's who sign up
     * using social media to the database
     * @param user
     * @return 
     */
    public boolean doSocialSignUp(Users user) {

        boolean result = false;
        String sql = "INSERT INTO users(emailAddress,password,firstName,lastName,dateOfRegisteration)" + "VALUES(? ,? ,? ,? ,CURDATE())";

        try {
            Connection con = JDBCConnectionManager.getConnection();

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getSub());
            preparedStatement.setString(3, user.getGiven_name());
            preparedStatement.setString(4, user.getFamily_name());

            System.out.println(preparedStatement);
            int res = preparedStatement.executeUpdate();

            if (res == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + " Duplicate Email Address");
            System.out.println(LocalDateTime.now() + "error code:" + e + "Duplicate Email Address");
        }

        return result;

    }

    /**
     *
     * @param profile
     * @return
     */
    public static boolean doFacebook(FbProfile profile) {

        boolean result = false;
        String fullname = profile.getUser_name();
        System.out.println("Hi" + fullname);
        String output[] = fullname.split(" ");
        String firstname = output[0];
        String lastname = output[1];
        System.out.println("Hi F1= " + firstname + "L1=" + lastname);

        String sql = "INSERT INTO users (emailAddress,firstName,lastName,password,dateOfRegisteration)" + "VALUES(? ,? ,? ,?,CURDATE())";

        try {
            Connection con = JDBCConnectionManager.getConnection();

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, profile.getEmail());
            preparedStatement.setString(2, firstname);
            preparedStatement.setString(3, lastname);
            preparedStatement.setString(4, profile.getId());

            System.out.println(preparedStatement);
            int res = preparedStatement.executeUpdate();

            if (res == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + " Duplicate Email Address");
            System.out.println(LocalDateTime.now() + "error code:" + e + "Duplicate Email Address");
        }

        return result;

    }

    /**
     *
     * @param appointment
     */
    public void updateUser(Appointment appointment) {

        boolean result = false;
        try {
            String sql = "update users set patientId=? where emailAddress=? and userId=?";
            Connection con = JDBCConnectionManager.getConnection();

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(2, appointment.getEmailAddress());
            preparedStatement.setString(1, appointment.getPatientId());
            preparedStatement.setString(3, appointment.getUserId());

            System.out.println(preparedStatement);
            int res = preparedStatement.executeUpdate();

            if (res == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + "check user details");
        }

    }

    /**
     *
     * Used to verify the user's who Log In
     * using social media with the information in the database.
     * @param user
     * @return 
     */
    public boolean doSocialLog_in(Users user) {
        boolean result = false;

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "Select * from users right join role on role.roleId=users.roleId where emailAddress=? and password=? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getSub());

            System.out.println("LoginService :: " + ps);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user.setRoleId(rs.getString("roleId"));
                user.setDoctorId(rs.getString("doctorId"));
                user.setPatientId(rs.getString("patientId"));
                user.setUserId(rs.getString("userId"));

                result = true;
            }

        } catch (SQLException ex) {
            log.error(LocalDateTime.now() +"Not Found any social user with given credential");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }
        return result;
    }
    public boolean updatePassword(Users user) {

        boolean result = false;
        try {
            String sql = "update users set password=? where emailAddress=? ";
            Connection con = JDBCConnectionManager.getConnection();

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, user.getPassword());
            preparedStatement.setString(2, user.getEmailAddress());
            System.out.println(preparedStatement);
            int res = preparedStatement.executeUpdate();

            if (res == 1) {
                result = true;
            }
        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + " Error while updating password check email");
            System.out.println(LocalDateTime.now() + "error code:" + e + "Duplicate Email Address");
        }
        return result;
    }

}
