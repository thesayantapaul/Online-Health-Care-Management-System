/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Appointment;
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
 * @author anich
 */
public class PatientService {

    /**
     *
     */
    public static PatientService patientService = null;

    /**
     *
     */
    public static Logger log = Logger.getLogger(PatientService.class.getName());

    /**
     *
     * Used to retrieve users medical history from BackEnd.
     *
     * @param userId
     * @return
     */
    public static List<Appointment> doViewParticularMedicalHistory(String userId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ohms_db.appointments right join doctors on doctors.doctorId=appointments.doctorId right join departments on departments.departmentId=appointments.departmentId right join patients on patients.patientId=appointments.patientId right join statusofappointments on statusofappointments.statusId=appointments.statusId right join prescription on prescription.appointmentId=appointments.appointmentId where appointments.userId=? and appointments.appointmentDate<=curdate()";
        ArrayList appointmentList = new ArrayList();
        try {
            con = JDBCConnectionManager.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userId);
            rs = ps.executeQuery();

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
                appointment.setAppointmentId(rs.getString("appointmentId"));
                appointment.setFeedback(rs.getString("advice"));
                appointmentList.add(appointment);
            }
        } catch (SQLException ex) {
           if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        } finally {

            close(rs, ps, con);
        }
        return appointmentList;
    }

    /**
     *
     * Used to retrieve users upcoming bookings from BackEnd.
     *
     * @param userId
     * @return
     */
    public static List<Appointment> doViewParticularUpcomingAppointments(String userId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ohms_db.appointments right join doctors on doctors.doctorId=appointments.doctorId right join departments on departments.departmentId=appointments.departmentId right join patients on patients.patientId=appointments.patientId right join statusofappointments on statusofappointments.statusId=appointments.statusId where appointments.userId=? and appointments.appointmentdate >CURDATE() order by appointments.appointmentDate";

        ArrayList appointmentList = new ArrayList();
        try {
             con = JDBCConnectionManager.getConnection();
             ps = con.prepareStatement(sql);
            ps.setString(1, userId);

             rs = ps.executeQuery();

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
            if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(rs, ps, con);
        }
        return appointmentList;
    }

    private PatientService() {
    }

    /**
     *
     * @return
     */
    public static synchronized PatientService getInstance() {
        if (patientService == null) {
            patientService= new PatientService();
        } 
            return patientService;
        
    }

    /**
     *
     * Used to add new patient to the BackEnd.
     *
     * @param appointment
     * @param userId
     * @return
     */
    public boolean insertPatient(Appointment appointment, String userId) {
        boolean result = false;
        Connection con = null;
        PreparedStatement preparedStatement = null;
        //ResultSet rs = null;

        String sql = "INSERT INTO patients (patientFirstName,patientLastName, age, gender,userId) VALUES (?, ?, ?, ?,?);";
        try {
             con = JDBCConnectionManager.getConnection();

             preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, appointment.getPatientFirstName());
            preparedStatement.setString(2, appointment.getPatientLastName());
            preparedStatement.setString(3, appointment.getAge());
            preparedStatement.setString(4, appointment.getGender());
            preparedStatement.setString(5, userId);

            System.out.println(preparedStatement);
            int res = preparedStatement.executeUpdate();

            if (res == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(null, preparedStatement, con);
        }

        return result;

    }

    /**
     *
     * Used to get a patient detail from the BackEnd.
     *
     * @param appointment
     * @param userId
     * @return
     */
    public Appointment getPatient(Appointment appointment, String userId) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet res = null;
        String sql = "select * from patients where patientFirstName=? and patientLastName=? and gender=? and age=? and userId=?";
        try {
             con = JDBCConnectionManager.getConnection();

             preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, appointment.getPatientFirstName());
            preparedStatement.setString(2, appointment.getPatientLastName());
            preparedStatement.setString(4, appointment.getAge());
            preparedStatement.setString(3, appointment.getGender());
            preparedStatement.setString(5, userId);

            System.out.println(preparedStatement);
             res = preparedStatement.executeQuery();
            System.out.println(res);

            if (res.next()) {
                appointment.setPatientId(res.getString("patientId"));
                appointment.setUserId(userId);
                System.out.println(appointment.getPatientId());
            }

        } catch (SQLException ex) {
           if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(res, preparedStatement, con);
        }

        return appointment;

    }

    /**
     *
     * Used to update a the appointment detail in the patient BackEnd.
     *
     * @param appointment
     * @return
     */
    public boolean insertPatientAppointment(Appointment appointment) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        //ResultSet rs = null;
        boolean result = false;
        try {
            String sql = "update patients set appointmentId=? where patientId=?";
             con = JDBCConnectionManager.getConnection();

             preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, appointment.getAppointmentId());
            preparedStatement.setString(2, appointment.getPatientId());
            System.out.println(preparedStatement);
            int res = preparedStatement.executeUpdate();

            if (res == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(null, preparedStatement, con);
        }

        return result;

    }

    /**
     *
     * Used to obtain a patients detail from the BackEnd.
     *
     * @param appointmentId
     * @return
     */
    public Appointment getPatientDetail(String appointmentId) {
        Appointment users = new Appointment();
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet res = null;
        String sql = "select * from appointments right join patients on patients.patientId=appointments.patientId left join users on users.userId=patients.userId where appointments.appointmentId=?";
        try {
             con = JDBCConnectionManager.getConnection();

             preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, appointmentId);

            System.out.println(preparedStatement);
             res = preparedStatement.executeQuery();
            System.out.println(res);

            if (res.next()) {
                users.setPatientId(res.getString("patientId"));
                users.setUserId(res.getString("userId"));
                users.setPatientFirstName(res.getString("patientFirstName"));
                users.setPatientLastName(res.getString("patientLastName"));
                users.setAge(res.getString("age"));
                users.setGender(res.getString("gender"));
                users.setSymptoms(res.getString("symptoms"));
                users.setDoctorId(res.getString("doctorId"));
                users.setAppointmentId(res.getString("appointmentId"));
                users.setAppointmentDate(res.getString("appointmentDate"));
                users.setEmailAddress(res.getString("emailAddress"));

                System.out.println(users.getPatientId());
            }

        } catch (SQLException ex) {
            if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(res, preparedStatement, con);
        }
        return users;
    }

}
