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

            ResultSet rs = ps.executeQuery();

//            if(rs.next()){
//                System.out.println("rs has next");
//            }else{
//                System.out.println("ther is no row in rs");
//            }
            while (rs.next()) {

                Appointment appointment = new Appointment();
                appointment.setPatientId(rs.getString("patientId"));

                System.out.println("patient id= " + appointment.getPatientId());

                appointment.setPatientFirstName(rs.getString("patientFirstName"));
                System.out.println("patient id= " + appointment.getPatientFirstName());
                appointment.setPatientLastName(rs.getString("patientLastName"));
                appointment.setDoctorFirstName(rs.getString("doctorFirstName"));
                appointment.setDoctorLastName(rs.getString("doctorLastName"));
                appointment.setAppointmentDate(rs.getString("appointmentDate"));
                appointment.setAppointmentId(rs.getString("appointmentId"));
                appointment.setStatus(rs.getString("statusName"));
                appointment.setDepartmentName(rs.getString("departmentName"));
                appointment.setStatusOfAppointments(rs.getString("statusName"));
                appointment.setStatusId(rs.getString("statusId"));
                System.out.println("status id = " + appointment.getStatusId());
                appointmentList.add(appointment);
            }
            System.out.println("rs size = " + appointmentList.size());

        } catch (SQLException ex) {
            Logger log = Logger.getLogger(AdminService.class.getName());
            log.error(LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM)) + " " + ex.getMessage());

        }

        return appointmentList;
    }

    public static boolean doCancelAppointments(String appointmentId) {
        boolean result = false;
        String sql = "UPDATE appointments SET statusId = 4 WHERE appointmentId = ?";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, appointmentId);

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

    public static Appointment doViewParticularAppointment(String appointmentId) {
        String sql = "SELECT * FROM appointments a,doctors d,patients p,departments dp,statusofappointments s where a.doctorId=d.doctorId and a.patientId=p.patientId and a.departmentId=dp.departmentId and a.statusId = s.statusId and a.appointmentId=?;";
        Appointment appointment = new Appointment();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, appointmentId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                appointment.setPatientId(rs.getString("patientId"));
                appointment.setPatientFirstName(rs.getString("patientFirstName"));
                //System.out.println("patient id= "+appointment.getPatientFirstName());
                appointment.setPatientLastName(rs.getString("patientLastName"));
                appointment.setDoctorFirstName(rs.getString("doctorFirstName"));
                appointment.setDoctorLastName(rs.getString("doctorLastName"));
                appointment.setAppointmentDate(rs.getString("appointmentDate"));
                appointment.setAppointmentId(rs.getString("appointmentId"));
                appointment.setStatus(rs.getString("statusName"));
                appointment.setDepartmentName(rs.getString("departmentName"));
                appointment.setStatusOfAppointments(rs.getString("statusName"));
                appointment.setStatusId(rs.getString("statusId"));
                appointment.setDepartmentId(rs.getString("departmentId"));

            }

        } catch (SQLException ex) {
            Logger log = Logger.getLogger(AdminService.class.getName());
            log.error(LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM)) + " " + ex.getMessage());

        }

        return appointment;
    }

    public static boolean doUpdateAppointment(Appointment appointment) {
        
        boolean result = false;
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "UPDATE appointments SET departmentId=?,appointmentDate=?,statusId=? WHERE appointmentId=?;";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            

            preparedStatement.setString(1, appointment.getDepartmentId());
            preparedStatement.setString(2, appointment.getAppointmentDate());
            preparedStatement.setString(3, appointment.getStatusId());
            preparedStatement.setString(4, appointment.getAppointmentId());
            System.out.println("ps:"+preparedStatement);
            int row = preparedStatement.executeUpdate();

            if (row == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }

}
