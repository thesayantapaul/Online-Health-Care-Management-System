/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Status;
import static com.exavalu.services.AdminService.close;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author LenovoRaja
 */

public class StatusService {
    public static Logger log = Logger.getLogger(StatusService.class.getName());
    
    /**
     *
     * @return
     */
    public static List<Status> getAllStatus() {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        ArrayList statusList = new ArrayList();
        try {

             con = JDBCConnectionManager.getConnection();

            String sql = "Select * from statusofappointments";

             preparedStatement = con.prepareStatement(sql);

             rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Status status = new Status();

               status.setStatusId(rs.getString("statusId"));
               status.setStatusName(rs.getString("statusName"));

                statusList.add(status);

            }

        } catch (SQLException ex) {
            if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(rs, preparedStatement, con);
        }

        return statusList;
    }
    
}
