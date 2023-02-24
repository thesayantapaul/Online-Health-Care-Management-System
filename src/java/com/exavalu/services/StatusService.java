/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Status;
import static com.exavalu.services.LoginService.log;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author LenovoRaja
 */
public class StatusService {
    
    public static ArrayList getAllStatus() {
        ArrayList statusList = new ArrayList();
        try {

            Connection con = JDBCConnectionManager.getConnection();

            String sql = "Select * from statusofappointments";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Status status = new Status();

               status.setStatusId(rs.getString("statusId"));
               status.setStatusName(rs.getString("statusName"));

                statusList.add(status);

            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + "Error in getting status");
            System.out.println(LocalDateTime.now() + "Sql Error :" + e + "Error in getting status");
        }

        return statusList;
    }
    
}
