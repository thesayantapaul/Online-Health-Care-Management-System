/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Appointment;
import com.exavalu.models.Departments;
import com.exavalu.models.Doctors;
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
public class DoctorService {

    /**
     *
     */
    public static DoctorService doctorService = null;

    /**
     *
     */
    public static Logger log = Logger.getLogger(DoctorService.class.getName());

    private DoctorService() {
    }

    /**
     *
     * @return
     */
    public static DoctorService getInstance() {
        if (doctorService == null) {
            return new DoctorService();
        } else {
            return doctorService;
        }
    }

    /**
     *
     * Used to retrieve all doctors
     * according to the department
     * @param departmentId
     * @return 
     */
    public ArrayList getAllDoctors(String departmentId) {
        ArrayList deptLIst = new ArrayList();
        try {

            Connection con = JDBCConnectionManager.getConnection();

            String sql = "Select * from doctors where departmentId=?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, departmentId);

            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Doctors doctors = new Doctors();

                doctors.setDoctorId(rs.getString("doctorId"));
                doctors.setDoctorFirstName(rs.getString("doctorFirstName"));
                doctors.setDoctorLastName(rs.getString("doctorLastName"));

                deptLIst.add(doctors);

            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + " Sql Error :" + e + "Error in getting Doctors");
            System.out.println(LocalDateTime.now() + " Sql Error :" + e + "Error in getting Doctors");
        }

        return deptLIst;
    }

    /**
     *
     * Used to retrieve all the available
     * days of a doctor
     * @param doctorId
     * @return 
     */
    public String[] getAllWeekDays(String doctorId) {
        Doctors doctors = new Doctors();

        try {

            Connection con = JDBCConnectionManager.getConnection();

            String sql = "Select * from doctors where doctorId=?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, doctorId);

            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {

                doctors.setWeekDays(rs.getString("weekdays"));

            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + " Sql Error :" + e + "Error in getting Doctors");
            System.out.println(LocalDateTime.now() + " Sql Error :" + e + "Error in getting Doctors");
        }

        return doctors.getWeekDays().split(",");
    }

    /**
     *
     * Used to retrieve the visiting hours
     * @param weekdays
     * @param user
     * @return 
     */
    public String getAllTime(String weekdays, String  doctorId) {
        Doctors doctors = new Doctors();
        String res = "";
        try {

            Connection con = JDBCConnectionManager.getConnection();

            String sql = "Select * from doctors where doctorId=?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, doctorId);

            System.out.println("getAllTime"+preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {

                doctors.setWeekDays(rs.getString("weekdays"));
                System.out.println(doctors.getWeekDays());

                String[] weekday = doctors.getWeekDays().split(",");
                System.out.println(weekday[0]);
                doctors.setTime(rs.getString("vsitingtime"));

                String[] time = doctors.getTime().split(",");

                for (int i = 0; i < weekday.length; i++) {
                    System.out.println(weekday[i]);
                    if (weekday[i].equals(weekdays)) {
                        res = time[i];
                    }
                }

            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + " Sql Error :" + e + "Error in getting Doctors");
            System.out.println(LocalDateTime.now() + " Sql Error :" + e + "Error in getting Doctors");
        }

        return res;
    }

    /**
     *
     * Used to retrieve the upcoming
     * appointments of an doctor from the database
     * @param doctorId
     * @return 
     */
    public ArrayList doViewAppointments(String doctorId) {

        ArrayList appointmentList = new ArrayList();
        try {

            Connection con = JDBCConnectionManager.getConnection();

            String sql = "SELECT * FROM ohms_db.appointments right join doctors on doctors.doctorId=appointments.doctorId right join departments on departments.departmentId=appointments.departmentId right join patients on patients.patientId=appointments.patientId right join statusofappointments on statusofappointments.statusId=appointments.statusId where appointments.doctorId=? and appointments.appointmentDate>=CURDATE()";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, doctorId);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Appointment appointment = new Appointment();

                appointment.setAppointmentId(rs.getString("appointmentId"));
                appointment.setAppointmentDate(rs.getString("appointmentDate"));

                appointment.setPatientFirstName(rs.getString("patientFirstName"));
                appointment.setPatientLastName(rs.getString("patientLastName"));
                appointment.setGender(rs.getString("gender"));
                appointment.setAge(rs.getString("age"));
                appointment.setDepartmentName(rs.getString("departmentName"));
                //appointment.setSymptoms(rs.getString("symptoms"));

                appointmentList.add(appointment);

            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + "Error in getting Doctors");
            System.out.println(LocalDateTime.now() + "Sql Error :" + e + "Error in getting Doctors");
        }

        return appointmentList;
    }

    /**
     *
     * Used to retrieve the
     * previous appointments of an doctor from the database
     * @param doctorId
     * @return 
     */
    public ArrayList doViewPastAppointments(String doctorId) {

        ArrayList appointmentList = new ArrayList();
        try {

            Connection con = JDBCConnectionManager.getConnection();

            String sql = "SELECT * FROM ohms_db.appointments right join doctors on doctors.doctorId=appointments.doctorId right join departments on departments.departmentId=appointments.departmentId right join patients on patients.patientId=appointments.patientId right join statusofappointments on statusofappointments.statusId=appointments.statusId where appointments.doctorId=? and appointments.appointmentDate<CURDATE()";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, doctorId);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Appointment appointment = new Appointment();

                appointment.setAppointmentId(rs.getString("appointmentId"));
                appointment.setAppointmentDate(rs.getString("appointmentDate"));

                appointment.setPatientFirstName(rs.getString("patientFirstName"));
                appointment.setPatientLastName(rs.getString("patientLastName"));
                appointment.setGender(rs.getString("gender"));
                appointment.setAge(rs.getString("age"));
                appointment.setDepartmentName(rs.getString("departmentName"));
                //appointment.setSymptoms(rs.getString("symptoms"));

                appointmentList.add(appointment);

            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + "Error in getting Doctors");
            System.out.println(LocalDateTime.now() + "Sql Error :" + e + "Error in getting Doctors");
        }

        return appointmentList;
    }

    /**
     *
     * Used to retrieve the number of
     * appointments of an doctor in last few days from the database
     * @param interval
     * @param doctorId
     * @return 
     */
    public String doViewBookings(String interval, String doctorId) {
        String totalBookings = null;

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "SELECT COUNT(appointmentId) as bookings FROM appointments WHERE appointmentDate = DATE_ADD(CURDATE(), INTERVAL ? DAY) and doctorId=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, interval);
            ps.setString(2, doctorId);

            System.out.println("ps:" + ps);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalBookings = rs.getString("bookings");
            }

        } catch (SQLException ex) {
            Logger log = Logger.getLogger(AdminService.class.getName());
            log.error(LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM)) + " " + ex.getMessage());

        }
        return totalBookings;

    }

    /**
     *
     * Used to retrieve the income of
     * an doctor in last few days from the database
     * @param interval
     * @param doctorId
     * @return 
     */
    public String doViewTotalRevenue(String interval, String doctorId) {

        String totalRevenue = null;

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "SELECT SUM(amount) as totalRevenue FROM appointments where appointmentDate = DATE_ADD(CURDATE(), INTERVAL ? DAY) and doctorId=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, interval);
            ps.setString(2, doctorId);

            System.out.println("ps:" + ps);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                totalRevenue = rs.getString("totalRevenue");
            }

        } catch (SQLException ex) {
            Logger log = Logger.getLogger(AdminService.class.getName());
            log.error(LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM)) + " " + ex.getMessage());

        }
        return totalRevenue;
    }

    /**
     *
     * Used to retrieve todays
     * appointment detail of an doctor from the database
     * @param interval
     * @param doctorId
     * @return 
     */
    public ArrayList doViewtodayAppointments(String interval, String doctorId) {

        ArrayList appointmentList = new ArrayList();
        try {

            Connection con = JDBCConnectionManager.getConnection();

            String sql = "SELECT * FROM ohms_db.appointments right join doctors on doctors.doctorId=appointments.doctorId right join departments on departments.departmentId=appointments.departmentId right join patients on patients.patientId=appointments.patientId right join statusofappointments on statusofappointments.statusId=appointments.statusId where appointments.doctorId=? and  appointmentDate = DATE_ADD(CURDATE(), INTERVAL ? DAY) and appointments.statusId=1";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, doctorId);
            preparedStatement.setString(2, interval);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Appointment appointment = new Appointment();

                appointment.setAppointmentId(rs.getString("appointmentId"));
                appointment.setAppointmentDate(rs.getString("appointmentDate"));
                appointment.setPatientId(rs.getString("patientId"));
                appointment.setPatientFirstName(rs.getString("patientFirstName"));
                appointment.setPatientLastName(rs.getString("patientLastName"));
                appointment.setGender(rs.getString("gender"));
                appointment.setAge(rs.getString("age"));
                appointment.setDepartmentName(rs.getString("departmentName"));
                appointment.setDoctorFirstName(rs.getString("doctorFirstName"));
                appointment.setDoctorLastName(rs.getString("doctorLastName"));
                appointment.setStatusId(rs.getString("statusId"));
                appointment.setStatus(rs.getString("statusName"));
                appointment.setSymptoms(rs.getString("symptoms"));
                appointment.setUserId(rs.getString("userId"));

                //appointment.setSymptoms(rs.getString("symptoms"));
                appointmentList.add(appointment);

            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + "Error in getting Doctors");
            System.out.println(LocalDateTime.now() + "Sql Error :" + e + "Error in getting Doctors");
        }

        return appointmentList;
    }

    /**
     *
     * Used to retrieve doctors
     * information from the database
     * @param doctorId
     * @return 
     */
    public Doctors getDoctor(String doctorId) {

        Doctors doctor = new Doctors();
        try {

            Connection con = JDBCConnectionManager.getConnection();

            String sql = "SELECT * FROM doctors right join departments on departments.departmentId=doctors.departmentId where doctorId=?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, doctorId);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                doctor.setDoctorFirstName(rs.getString("doctorFirstName"));
                doctor.setDoctorLastName(rs.getString("doctorLastName"));
                doctor.setDepartmentName(rs.getString("departmentName"));

            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + "Error in getting Doctors");
            System.out.println(LocalDateTime.now() + "Sql Error :" + e + "Error in getting Doctors");
        }

        return doctor;
    }

}
