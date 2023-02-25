/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Appointment;
import com.exavalu.models.Patients;
import com.exavalu.models.Users;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import org.apache.log4j.Logger;

/**
 *
 * @author anich
 */
public class PatientService {

    public static PatientService patientService = null;
    public static Logger log = Logger.getLogger(PatientService.class.getName());

    public static Appointment doViewParticularMedicalHistory(String patientId) {

        String sql = "select * from appointments a, doctors d, departments dp, patients p where a.departmentId=dp.departmentId and a.appointmentId=p.appointmentId and a.patientId=p.patientId;";
        Appointment appointment = new Appointment();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, patientId);

            ResultSet rs = ps.executeQuery();

            System.out.println("Prepared Statement" + ps);
            if (rs.next()) {

                appointment.setPatientId(rs.getString("patientId"));
                appointment.setPatientFirstName(rs.getString("patientFirstName"));
                //System.out.println("patient id= "+appointment.getPatientFirstName());
                appointment.setPatientLastName(rs.getString("patientLastName"));
                appointment.setDoctorFirstName(rs.getString("doctorFirstName"));
                appointment.setDoctorLastName(rs.getString("doctorLastName"));
                appointment.setAppointmentDate(rs.getString("appointmentDate"));
//                appointment.setAppointmentId(rs.getString("appointmentId"));
//                appointment.setStatus(rs.getString("statusName"));
                appointment.setDepartmentName(rs.getString("departmentName"));
//                appointment.setStatusOfAppointments(rs.getString("statusName"));
//                appointment.setStatusId(rs.getString("statusId"));
//                appointment.setDepartmentId(rs.getString("departmentId"));

            }

        } catch (SQLException ex) {
            Logger log = Logger.getLogger(AdminService.class.getName());
            log.error(LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM)) + " " + ex.getMessage());

        }

        return appointment;
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

    public boolean insertPatient(Users user) {
        boolean result = false;

        Connection con = JDBCConnectionManager.getConnection();
        String sql = "INSERT INTO patients (patientFirstName,patientLastName, age, gender) VALUES (?, ?, ?, ?);";

        return result;
    }

}
