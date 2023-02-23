/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Appointment;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;

/**
 *
 * @author anich
 */
public class AppointmentService {

    public static AppointmentService appointmentService = null;
    public static Logger log = Logger.getLogger(AppointmentService.class.getName());

    private AppointmentService() {
    }

    public static AppointmentService getInstance() {
        if (appointmentService == null) {
            return new AppointmentService();
        } else {
            return appointmentService;
        }
    }

    public boolean getAppointment(Appointment appointment) {
        boolean result = false;

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "INSERT INTO appointments (appointmentDate, doctorId, departmentId, statusId) VALUES (?, ?, ?, ?);";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, appointment.getAppointmentDate());
            ps.setString(2, appointment.getDoctorId());
            ps.setString(3, appointment.getDepartmentId());
            ps.setString(4, "2");

            System.out.println("LoginService :: " + ps);

            int rs = ps.executeUpdate();

            if (rs==1) {
                result = true;
            }

        } catch (SQLException ex) {
            log.error("Not Found");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }

        return result;
    }
}


