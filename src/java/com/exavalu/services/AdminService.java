/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Admin;
import com.exavalu.models.Appointment;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import org.apache.log4j.Logger;

/**
 *
 * @author LenovoRaja
 */
public class AdminService {

    public static ArrayList doViewAppointments() {
        ArrayList appointmentList = new ArrayList();
        String sql = "SELECT * FROM appointments a,doctors d,patients p,departments dp,statusofappointments s where a.doctorId=d.doctorId and a.patientId=p.patientId and a.departmentId=dp.departmentId and a.statusId = s.statusId;";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            System.out.println("PS Output" + ps);

            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setPatientId(rs.getString("patientId"));
                appointment.setPatientFirstName(rs.getString("patientFristName"));
                appointment.setPatientLastName(rs.getString("patientLastName"));
                appointment.setDoctorFirstName(rs.getString("doctorFirstName"));
                appointment.setDoctorLastName(rs.getString("doctorLastName"));
                appointment.setAppointmentDate(rs.getString("appointmentDate"));
                appointment.setAppointmentId(rs.getString("appointmentId"));
                appointment.setStatus(rs.getString("statusName"));
                
                
                appointmentList.add(appointment);
            }
            System.out.println("Appointment2 List Size" + appointmentList.size());

        } catch (SQLException ex) {
            Logger log = Logger.getLogger(AdminService.class.getName());
            log.error(LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM)) + " " + ex.getMessage());

        }

        return appointmentList;
    }
    public static boolean doCancelAppointments(String messageToPatient,String appointmentId) {
       boolean result = false;
        String sql = "UPDATE appointments SET statusId = 4,messagetopatient=? WHERE appointmentId = ?";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, messageToPatient);
            ps.setString(2, appointmentId);

             int row = ps.executeUpdate();

            if (row == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            Logger log = Logger.getLogger(AdminService.class.getName());
            log.error(LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM)) + " " + ex.getMessage());

        }

        return result;
    }
    public static ArrayList doSearchDoctor(Admin doctor) {
            
        ArrayList doctorList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "select * from doctors d, departments dp where d.departmentId=dp.departmentId and having firstName like ? and lastName like ? and gender like ? and departmentName like ? and having doctorId like ?;";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            
            preparedStatement.setString(1, doctor.getFirstName() + "%");
            preparedStatement.setString(2, doctor.getLastName() + "%");
            preparedStatement.setString(3, doctor.getGender() + "%");
            preparedStatement.setString(4, doctor.getDepartmentName() + "%");
            preparedStatement.setString(5, doctor.getDoctorId() + "%");
            
//            System.out.println("sql"+preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println("size of rs="+ rs.getFetchSize());
             
            while (rs.next()) {
                //Doctor doctor = new Doctor();
                //doctor.setDoctorId(rs.getString("dcotorId"));
                //code to set doctor parameters
                
                doctorList.add(doctor);
            }


        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return doctorList;
    }
     

}