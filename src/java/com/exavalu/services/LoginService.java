/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Users;
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

    public static LoginService loginService = null;
    public static Logger log = Logger.getLogger(LoginService.class.getName());

    private LoginService() {
    }

    public static LoginService getInstance() {
        if (loginService == null) {
            return new LoginService();
        } else {
            return loginService;
        }
    }

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
                result = true;
            }

        } catch (SQLException ex) {
            log.error("Not Found");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }
        return result;
    }

    public boolean doSignUp(Users user) {

        boolean result = false;
        String sql = "INSERT INTO users(emailAddress,password,firstName,lastName,occupation,address,gender,patientId,dateOfRegisteration)" + "VALUES(? ,? ,? ,? ,?,?,?,?,CURDATE())";

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
            preparedStatement.setString(8, user.getPatientId());

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
                sessionMap.put("Patient", users);

                result = true;
            }

        } catch (SQLException ex) {
            log.error("Not Found");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }

        return result;
    }

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

}
