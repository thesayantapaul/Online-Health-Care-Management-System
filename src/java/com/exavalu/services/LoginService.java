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
        String sql = "INSERT INTO users(emailAddress,password,name,occupation,address,gender)" + "VALUES(? ,? ,? ,?,?,?)";

        try {
            Connection con = JDBCConnectionManager.getConnection();

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, user.getEmailAddress());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getFirstName()+user.getLastName());
            preparedStatement.setString(4, user.getOccupation());
            preparedStatement.setString(5, user.getAddress());
            preparedStatement.setString(6, user.getGender());

            System.out.println(preparedStatement);
            int res = preparedStatement.executeUpdate();

            if (res == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now()+"Sql Error :"+e+" Duplicate Email Address");
            System.out.println(LocalDateTime.now()+"error code:"+e+"Duplicate Email Address" );
        }

        return result;

    }

    
}
