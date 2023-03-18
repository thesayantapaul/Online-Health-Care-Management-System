/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Appointment;
import com.exavalu.models.Doctors;
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
    public static synchronized DoctorService getInstance() {
        if (doctorService == null) {
            doctorService= new DoctorService();
        } 
            return doctorService;
        
    }

    /**
     *
     * Used to retrieve all doctors according to the department
     *
     * @param departmentId
     * @return
     */
    public List<Doctors> getAllDoctors(String departmentId) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        ArrayList deptLIst = new ArrayList();
        try {

             con = JDBCConnectionManager.getConnection();

            String sql = "Select * from doctors where departmentId=?";

             preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, departmentId);

            System.out.println(preparedStatement);

             rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Doctors doctors = new Doctors();

                doctors.setDoctorId(rs.getString("doctorId"));
                doctors.setDoctorFirstName(rs.getString("doctorFirstName"));
                doctors.setDoctorLastName(rs.getString("doctorLastName"));

                deptLIst.add(doctors);

            }

        } catch (SQLException ex) {
            if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(rs, preparedStatement, con);
        }

        return deptLIst;
    }

    /**
     *
     * Used to retrieve all the available days of a doctor
     *
     * @param doctorId
     * @return
     */
    public String[] getAllWeekDays(String doctorId) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Doctors doctors = new Doctors();

        try {

             con = JDBCConnectionManager.getConnection();

            String sql = "Select * from doctors where doctorId=?";

             preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, doctorId);

            System.out.println(preparedStatement);

             rs = preparedStatement.executeQuery();

            while (rs.next()) {

                doctors.setWeekDays(rs.getString("weekdays"));

            }

        } catch (SQLException ex) {
            if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(rs, preparedStatement, con);
        }

        return doctors.getWeekDays().split(",");
    }

    /**
     *
     * Used to retrieve the visiting hours
     *
     * @param weekdays
     * @param doctorId
     * @return
     */
    public String getAllTime(String weekdays, String doctorId) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Doctors doctors = new Doctors();
        String res = "";
        try {

             con = JDBCConnectionManager.getConnection();

            String sql = "Select * from doctors where doctorId=?";

             preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, doctorId);

            System.out.println("getAllTime" + preparedStatement);

             rs = preparedStatement.executeQuery();

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
           if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(rs, preparedStatement, con);
        }

        return res;
    }

    /**
     *
     * Used to retrieve the upcoming appointments of an doctor from the database
     *
     * @param doctorId
     * @return
     */
    public List doViewAppointments(String doctorId) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        ArrayList appointmentList = new ArrayList();
        try {

             con = JDBCConnectionManager.getConnection();

            String sql = "SELECT * FROM ohms_db.appointments right join doctors on doctors.doctorId=appointments.doctorId right join departments on departments.departmentId=appointments.departmentId right join patients on patients.patientId=appointments.patientId right join statusofappointments on statusofappointments.statusId=appointments.statusId where appointments.doctorId=? and appointments.appointmentDate>=CURDATE()";

             preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, doctorId);

             rs = preparedStatement.executeQuery();

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
            if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(rs, preparedStatement, con);
        }

        return appointmentList;
    }

    /**
     *
     * Used to retrieve the previous appointments of an doctor from the database
     *
     * @param doctorId
     * @return
     */
    public List doViewPastAppointments(String doctorId) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        ArrayList appointmentList = new ArrayList();
        try {

             con = JDBCConnectionManager.getConnection();

            String sql = "SELECT * FROM ohms_db.appointments right join doctors on doctors.doctorId=appointments.doctorId right join departments on departments.departmentId=appointments.departmentId right join patients on patients.patientId=appointments.patientId right join statusofappointments on statusofappointments.statusId=appointments.statusId where appointments.doctorId=? and appointments.appointmentDate<CURDATE()";

             preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, doctorId);

             rs = preparedStatement.executeQuery();

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
            if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(rs, preparedStatement, con);
        }

        return appointmentList;
    }

    /**
     *
     * Used to retrieve the number of appointments of an doctor in last few days
     * from the database
     *
     * @param interval
     * @param doctorId
     * @return
     */
    public String doViewBookings(String interval, String doctorId) {
        String totalBookings = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
             con = JDBCConnectionManager.getConnection();
            String sql = "SELECT COUNT(appointmentId) as bookings FROM appointments WHERE appointmentDate = DATE_ADD(CURDATE(), INTERVAL ? DAY) and doctorId=?";

             ps = con.prepareStatement(sql);
            ps.setString(1, interval);
            ps.setString(2, doctorId);

            System.out.println("ps:" + ps);
             rs = ps.executeQuery();
            if (rs.next()) {
                totalBookings = rs.getString("bookings");
            }

        } catch (SQLException ex) {
            if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(rs, ps, con);
        }
        return totalBookings;

    }

    /**
     *
     * Used to retrieve the income of an doctor in last few days from the
     * database
     *
     * @param interval
     * @param doctorId
     * @return
     */
    public String doViewTotalRevenue(String interval, String doctorId) {

        String totalRevenue = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
             con = JDBCConnectionManager.getConnection();
            String sql = "SELECT SUM(amount) as totalRevenue FROM appointments where appointmentDate = DATE_ADD(CURDATE(), INTERVAL ? DAY) and doctorId=?";

             ps = con.prepareStatement(sql);
            ps.setString(1, interval);
            ps.setString(2, doctorId);

            System.out.println("ps:" + ps);

             rs = ps.executeQuery();

            if (rs.next()) {
                totalRevenue = rs.getString("totalRevenue");
            }

        } catch (SQLException ex) {
           if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(rs, ps, con);
        }
        return totalRevenue;
    }

    /**
     *
     * Used to retrieve todays appointment detail of an doctor from the database
     *
     * @param interval
     * @param doctorId
     * @return
     */
    public List doViewtodayAppointments(String interval, String doctorId) {

        ArrayList appointmentList = new ArrayList();
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {

             con = JDBCConnectionManager.getConnection();

            String sql = "SELECT * FROM ohms_db.appointments right join doctors on doctors.doctorId=appointments.doctorId right join departments on departments.departmentId=appointments.departmentId right join patients on patients.patientId=appointments.patientId right join statusofappointments on statusofappointments.statusId=appointments.statusId where appointments.doctorId=? and  appointmentDate = DATE_ADD(CURDATE(), INTERVAL ? DAY) and appointments.statusId=2";

             preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, doctorId);
            preparedStatement.setString(2, interval);
            System.out.println(preparedStatement);

             rs = preparedStatement.executeQuery();

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
            if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(rs, preparedStatement, con);
        }

        return appointmentList;
    }

    /**
     *
     * Used to retrieve doctors information from the database
     *
     * @param doctorId
     * @return
     */
    public Doctors getDoctor(String doctorId) {

        Doctors doctor = new Doctors();
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {

             con = JDBCConnectionManager.getConnection();

            String sql = "SELECT * FROM doctors right join departments on departments.departmentId=doctors.departmentId where doctorId=?";

             preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, doctorId);

             rs = preparedStatement.executeQuery();

            while (rs.next()) {
                doctor.setDoctorFirstName(rs.getString("doctorFirstName"));
                doctor.setDoctorLastName(rs.getString("doctorLastName"));
                doctor.setDepartmentName(rs.getString("departmentName"));

            }

        } catch (SQLException ex) {
            if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(rs, preparedStatement, con);
        }

        return doctor;
    }

}
