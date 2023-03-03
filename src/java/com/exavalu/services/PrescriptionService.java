/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Appointment;
import com.exavalu.models.Prescription;
import static com.exavalu.services.AppointmentService.log;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.log4j.Logger;

/**
 *
 * @author anich
 */
public class PrescriptionService {

    public static PrescriptionService prescriptionService = null;
    public static Logger log = Logger.getLogger(PrescriptionService.class.getName());

    private PrescriptionService() {
    }

    public static PrescriptionService getInstance() {
        if (prescriptionService == null) {
            return new PrescriptionService();
        } else {
            return prescriptionService;
        }
    }

    public boolean addPrescription(Prescription prescription) {

        boolean result = false;

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "INSERT INTO prescription (date, symptoms, test, medicine, dosage, timetotake, appointmentId,doctorId, patientId) VALUES (?,?,?,?,?,?,?,?,?);";
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

            System.out.println("PrescriptionService add:: " + ps);

            int rs = ps.executeUpdate();

            if (rs == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            log.error("Cannot be Addes");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }

        return result;
    }

    public ArrayList getPrescription(String doctorId) {

        boolean result = false;
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
            log.error("Cannot be Addes");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }

        return prescribedList;
    }

}
