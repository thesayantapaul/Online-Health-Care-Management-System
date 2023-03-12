package com.exavalu.services;

import com.exavalu.models.Appointment;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import org.apache.log4j.Logger;

/**
 *
 * @author anich
 */
public class AppointmentService {

    public static AppointmentService appointmentService = null;
    public static Logger log = Logger.getLogger(AppointmentService.class.getName());

    private AppointmentService() {
    }

    public static AppointmentService getInstance() {
        if (appointmentService == null) {
            return new AppointmentService();
        } else {
            return appointmentService;
        }
    }

    public boolean getAppointment(Appointment appointment) {
        boolean result = false;
        Date date = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "INSERT INTO appointments (appointmentDate, doctorId, departmentId, statusId,patientId,userId,symptoms,bookingDate) VALUES (DATE_ADD(CURDATE(), INTERVAL ? DAY) , ?, ?, ?,?,?,?,curdate());";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(2, appointment.getDoctorId());
            ps.setString(3, appointment.getDepartmentId());
            ps.setString(4, "2");
            ps.setString(5, appointment.getPatientId());
            ps.setString(6, appointment.getUserId());
            ps.setString(7, appointment.getSymptoms());
            if(appointment.getWeekDays().equals("Monday"))
            {
                dayOfWeek=9-dayOfWeek;
            }
            else if(appointment.getWeekDays().equals("Tuesday"))
            {
                dayOfWeek=10-dayOfWeek;
            }
            else if(appointment.getWeekDays().equals("Wednesday"))
            {
                dayOfWeek=11-dayOfWeek;
            }
            else if(appointment.getWeekDays().equals("Thursday"))
            {
                dayOfWeek=12-dayOfWeek;
            }
            
            else if(appointment.getWeekDays().equals("Friday"))
            {
                dayOfWeek=13-dayOfWeek;
            }
            else if(appointment.getWeekDays().equals("Saturday"))
            {
                dayOfWeek=14-dayOfWeek;
            }
            else{
                dayOfWeek=15-dayOfWeek;
            }
            ps.setString(1, Integer.toString(dayOfWeek));
            System.out.println("AppointmentService GetAppointment :: " + ps);

            int rs = ps.executeUpdate();

            if (rs == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            log.error("Not Found");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }

        return result;
    }

    public Appointment getAppointmentId(Appointment appointment) {

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "select * from appointments where appointmentDate=? and doctorId=? and departmentId=? and patientId=? and userId=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, appointment.getAppointmentDate());
            ps.setString(2, appointment.getDoctorId());
            ps.setString(3, appointment.getDepartmentId());
            ps.setString(4, appointment.getPatientId());
            ps.setString(5, appointment.getUserId());

            System.out.println(ps);
            ResultSet res = ps.executeQuery();
            System.out.println(res);

            if (res.next()) {
                appointment.setAppointmentId(res.getString("appointmentId"));
                System.out.println(appointment.getAppointmentId());
            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e);
            System.out.println(LocalDateTime.now() + "error code:" + e);
        }

        return appointment;
    }

    public void updateStatus(String appointmentId) {

        boolean result = false;

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "UPDATE ohms_db.appointments SET statusId = 3 WHERE appointmentId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, appointmentId);
            System.out.println("AppointmentService UpdateStatus:: " + ps);

            int rs = ps.executeUpdate();

            if (rs == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            log.error("Not Found");
            System.out.println(ex.getErrorCode());
            ex.printStackTrace();
        }

    }
}
