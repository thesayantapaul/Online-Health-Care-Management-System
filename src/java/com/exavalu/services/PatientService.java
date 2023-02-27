/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Appointment;
import com.exavalu.models.Users;
import static com.exavalu.services.LoginService.log;
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
        String sql = "select * from appointments a, doctors d, departments dp, patients p, statusofappointments s where a.departmentId=dp.departmentId and a.appointmentId=p.appointmentId and a.patientId=p.patientId and a.statusId=s.statusId and a.patientId=?";
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
        String sql = "select * from appointments a, doctors d, departments dp, patients p, statusofappointments s where a.departmentId=dp.departmentId and a.appointmentId=p.appointmentId and a.patientId=p.patientId and a.statusId=s.statusId and a.patientId=?";

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

}
