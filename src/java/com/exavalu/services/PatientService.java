/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Appointment;
import com.exavalu.models.Users;
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
 * @author anich
 */
public class PatientService {

    public static PatientService patientService = null;
    public static Logger log = Logger.getLogger(PatientService.class.getName());

    public static ArrayList doViewParticularMedicalHistory(String patientId) {
        String sql = "SELECT * FROM ohms_db.appointments right join doctors on doctors.doctorId=appointments.doctorId right join departments on departments.departmentId=appointments.departmentId right join patients on patients.patientId=appointments.patientId right join statusofappointments on statusofappointments.statusId=appointments.statusId where appointments.patientId=? AND appointments.statusId=3";
        ArrayList appointmentList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, patientId);
            ResultSet rs = ps.executeQuery();

            System.out.println("Prepared Statement" + ps);
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setPatientId(rs.getString("patientId"));
                appointment.setPatientFirstName(rs.getString("patientFirstName"));
                appointment.setPatientLastName(rs.getString("patientLastName"));
                appointment.setDoctorFirstName(rs.getString("doctorFirstName"));
                appointment.setDoctorLastName(rs.getString("doctorLastName"));
                appointment.setAppointmentDate(rs.getString("appointmentDate"));
                appointment.setDepartmentName(rs.getString("departmentName"));
                appointment.setStatusOfAppointments(rs.getString("statusName"));
                appointment.setFeedback(rs.getString("messagetopatient"));
                appointmentList.add(appointment);
            }
        } catch (SQLException ex) {
            Logger log = Logger.getLogger(AdminService.class.getName());
            log.error(LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM)) + " " + ex.getMessage());
            System.out.println(ex);
        }
        return appointmentList;
    }

    public static ArrayList doViewParticularUpcomingAppointments(String patientId) {
        String sql = "SELECT * FROM ohms_db.appointments right join doctors on doctors.doctorId=appointments.doctorId right join departments on departments.departmentId=appointments.departmentId right join patients on patients.patientId=appointments.patientId right join statusofappointments on statusofappointments.statusId=appointments.statusId where appointments.patientId=? AND appointments.appointmentDate>=curdate()";

        ArrayList appointmentList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, patientId);

            ResultSet rs = ps.executeQuery();

            System.out.println("Prepared Statement" + ps);
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setPatientId(rs.getString("patientId"));
                appointment.setPatientFirstName(rs.getString("patientFirstName"));
                appointment.setPatientLastName(rs.getString("patientLastName"));
                appointment.setDoctorFirstName(rs.getString("doctorFirstName"));
                appointment.setDoctorLastName(rs.getString("doctorLastName"));
                appointment.setAppointmentDate(rs.getString("appointmentDate"));
                appointment.setAppointmentId(rs.getString("appointmentId"));
                appointment.setDepartmentName(rs.getString("departmentName"));
                appointment.setStatusOfAppointments(rs.getString("statusName"));
                appointment.setFeedback(rs.getString("messagetopatient"));
                appointmentList.add(appointment);
            }
        } catch (SQLException ex) {
            Logger log = Logger.getLogger(AdminService.class.getName());
            log.error(LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM)) + " " + ex.getMessage());
            System.out.println(ex);
        }
        return appointmentList;
    }

    private PatientService() {
    }

    public static PatientService getInstance() {
        if (patientService == null) {
            return new PatientService();
        } else {
            return patientService;
        }
    }

    public boolean insertPatient(Appointment appointment) {
        boolean result = false;

        String sql = "INSERT INTO patients (patientFirstName,patientLastName, age, gender) VALUES (?, ?, ?, ?);";
        try {
            Connection con = JDBCConnectionManager.getConnection();

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, appointment.getPatientFirstName());
            preparedStatement.setString(2, appointment.getPatientLastName());
            preparedStatement.setString(3, appointment.getAge());
            preparedStatement.setString(4, appointment.getGender());

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

    public Appointment getPatient(Appointment appointment) {
        String sql = "select * from patients where patientFirstName=? and patientLastName=? and gender=? and age=?";
        try {
            Connection con = JDBCConnectionManager.getConnection();

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, appointment.getPatientFirstName());
            preparedStatement.setString(2, appointment.getPatientLastName());
            preparedStatement.setString(4, appointment.getAge());
            preparedStatement.setString(3, appointment.getGender());

            System.out.println(preparedStatement);
            ResultSet res = preparedStatement.executeQuery();
            System.out.println(res);

            if (res.next()) {
                appointment.setPatientId(res.getString("patientId"));
                System.out.println(appointment.getPatientId());
            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + " Duplicate Email Address");
            System.out.println(LocalDateTime.now() + "error code:" + e + "Duplicate Email Address");
        }

        return appointment;

    }

    public boolean insertPatientAppointment(Appointment appointment) {

        boolean result = false;
        try {
            String sql = "update patients set appointmentId=? where patientId=?";
            Connection con = JDBCConnectionManager.getConnection();

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, appointment.getAppointmentId());
            preparedStatement.setString(2, appointment.getPatientId());
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

    public boolean insertNewPatient(Users user) {
        
        boolean result = false;

        String sql = "INSERT INTO patients (patientFirstName,patientLastName, gender) VALUES (?, ?, ?);";
        try {
            Connection con = JDBCConnectionManager.getConnection();

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
//            preparedStatement.setString(3, user.getAge());
            preparedStatement.setString(3, user.getGender());

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
    
    public Users getNewPatient(Users users) {
        String sql = "select * from patients where patientFirstName=? and patientLastName=? and gender=? ";
        try {
            Connection con = JDBCConnectionManager.getConnection();

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, users.getFirstName());
            preparedStatement.setString(2, users.getLastName());
            preparedStatement.setString(3, users.getGender());

            System.out.println(preparedStatement);
            ResultSet res = preparedStatement.executeQuery();
            System.out.println(res);

            if (res.next()) {
                users.setPatientId(res.getString("patientId"));
                System.out.println(users.getPatientId());
            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + " Duplicate Email Address");
            System.out.println(LocalDateTime.now() + "error code:" + e + "Duplicate Email Address");
        }

        return users;

    }


}
