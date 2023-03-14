/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Prescription;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import org.apache.log4j.Logger;

/**
 *
 * @author anich
 */
public class PrescriptionService {

    /**
     *
     */
    public static PrescriptionService prescriptionService = null;

    /**
     *
     */
    public static Logger log = Logger.getLogger(PrescriptionService.class.getName());

    private PrescriptionService() {
    }

    /**
     *
     * @return
     */
    public static PrescriptionService getInstance() {
        if (prescriptionService == null) {
            return new PrescriptionService();
        } else {
            return prescriptionService;
        }
    }

    /**
     *
     * Used to add a particular
     * prescription to the database
     * @param prescription
     * @return 
     */
    public boolean addPrescription(Prescription prescription) {

        boolean result = false;

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "INSERT INTO prescription (date, symptoms, test, medicine, dosage, timetotake, appointmentId,doctorId, patientId,userId,advice) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, prescription.getDate());
            ps.setString(2, prescription.getSymptoms());
            ps.setString(3, prescription.getTests());
            ps.setString(4, prescription.getMedicine());
            ps.setString(5, prescription.getDosage());
            ps.setString(6, prescription.getTime());
            ps.setString(7, prescription.getAppointmentId());
            ps.setString(8, prescription.getDoctorId());
            ps.setString(9, prescription.getPatientId());
            ps.setString(10, prescription.getUserId());
            ps.setString(11, prescription.getAdvice());

            System.out.println("PrescriptionService add:: " + ps);

            int rs = ps.executeUpdate();

            if (rs == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            log.error(LocalDateTime.now()+" sql Error"+ex.getErrorCode()+"Cannot add");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }

        return result;
    }

    /**
     *
     * Used to retrieve all the
     * prescription prescribed by a particular doctor prescription to the
     * database
     * @param doctorId
     * @return 
     */
    public ArrayList getPrescription(String doctorId) {

        ArrayList prescribedList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "SELECT * FROM prescription left join patients on patients.patientId=prescription.patientId left join users on patients.userId=users.userId where prescription.doctorId=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, doctorId);
            ResultSet rs = ps.executeQuery();
            System.out.println("PrescriptionService getprescription:: " + ps);

            while (rs.next()) {
                Prescription prescribed = new Prescription();
                prescribed.setDate(rs.getString("date"));
                prescribed.setPatientFirstName(rs.getString("patientFirstName"));
                prescribed.setPatientLastName(rs.getString("patientLastName"));
                prescribed.setAppointmentId(rs.getString("appointmentId"));
                prescribed.setSymptoms(rs.getString("symptoms"));
                prescribed.setTests(rs.getString("test"));
                prescribed.setMedicine(rs.getString("medicine"));
                prescribed.setDosage(rs.getString("dosage"));
                prescribed.setTime(rs.getString("timetotake"));
                prescribed.setStatus(rs.getString("status"));
                prescribed.setEmailAddress(rs.getString("emailAddress"));

                prescribedList.add(prescribed);
            }
        } catch (SQLException ex) {
            log.error(LocalDateTime.now()+" sql Error"+ex.getErrorCode()+"Cannot be found");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }

        return prescribedList;
    }

    /**
     *
     * Used to retrieve all
     * previous prescriptions of a user retrieve the medical history
     * @param userId
     * @return 
     */
    public ArrayList getPatientPrescription(String userId) {

        ArrayList prescribedList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "SELECT * FROM prescription left join doctors on doctors.doctorId=prescription.doctorId left join departments on doctors.departmentId=departments.departmentId left join users on prescription.userId=users.userId where prescription.userId=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();
            System.out.println("PrescriptionService getprescription:: " + ps);

            while (rs.next()) {
                Prescription prescribed = new Prescription();
                prescribed.setDate(rs.getString("date"));
                prescribed.setDoctorFirstName(rs.getString("doctorFirstName"));
                prescribed.setDoctorLastName(rs.getString("doctorLastName"));
                prescribed.setAppointmentId(rs.getString("appointmentId"));
                prescribed.setSymptoms(rs.getString("symptoms"));
                prescribed.setTests(rs.getString("test"));
                prescribed.setMedicine(rs.getString("medicine"));
                prescribed.setDosage(rs.getString("dosage"));
                prescribed.setTime(rs.getString("timetotake"));
                prescribed.setStatus(rs.getString("status"));
                prescribed.setDepartmentName(rs.getString("departmentName"));
                prescribed.setDate(rs.getString("date"));
                prescribed.setAdvice(rs.getString("advice"));

                prescribedList.add(prescribed);
            }
        } catch (SQLException ex) {
            log.error(LocalDateTime.now()+" sql Error"+ex.getErrorCode()+"no record Found");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }

        return prescribedList;
    }

    /**
     *
     * Used to retrieve a
     * prescriptions of a user according to appointmentId
     * @param appointmentId
     * @return 
     */
    public Prescription getParticularPrescription(String appointmentId) {
        Prescription prescribed = new Prescription();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "SELECT * FROM prescription left join doctors on doctors.doctorId=prescription.doctorId left join departments on doctors.departmentId=departments.departmentId left join users on prescription.userId=users.userId left join patients on patients.patientId=prescription.patientId where prescription.appointmentId=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, appointmentId);
            ResultSet rs = ps.executeQuery();
            System.out.println("PrescriptionService Particular Appointment:: " + ps);
            if (rs.next()) {
                prescribed.setDate(rs.getString("date"));
                prescribed.setDoctorFirstName(rs.getString("doctorFirstName"));
                prescribed.setDoctorLastName(rs.getString("doctorLastName"));
                prescribed.setAppointmentId(rs.getString("appointmentId"));
                prescribed.setSymptoms(rs.getString("symptoms"));
                prescribed.setTests(rs.getString("test"));
                prescribed.setMedicine(rs.getString("medicine"));
                prescribed.setDosage(rs.getString("dosage"));
                prescribed.setTime(rs.getString("timetotake"));
                prescribed.setStatus(rs.getString("status"));
                prescribed.setDepartmentName(rs.getString("departmentName"));
                prescribed.setAdvice(rs.getString("advice"));
                prescribed.setPatientFirstName(rs.getString("patientFirstName"));
                prescribed.setPatientLastName(rs.getString("patientLastName"));
                System.out.println("valid row checking = true");
            }else{
                prescribed = null;
            }
        } catch (SQLException ex) {
            log.error(LocalDateTime.now()+" sql Error"+ex.getErrorCode()+"Cannot be Found");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }

        return prescribed;
    }

}
