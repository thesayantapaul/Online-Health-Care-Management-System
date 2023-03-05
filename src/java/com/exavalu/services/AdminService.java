package com.exavalu.services;

import com.exavalu.models.Admin;
import com.exavalu.models.Appointment;
import com.exavalu.models.Departments;
import com.exavalu.models.Doctors;
import com.exavalu.models.Patients;
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
                appointment.setDepartmentId(rs.getString("departmentId"));
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

    public static ArrayList doViewAppointments(String interval) {
        ArrayList appointmentList = new ArrayList();
        String sql = "SELECT * FROM appointments a,doctors d,patients p,departments dp,statusofappointments s where a.doctorId=d.doctorId and a.patientId=p.patientId and a.departmentId=dp.departmentId and a.statusId = s.statusId and appointmentDate = DATE_ADD(CURDATE(), INTERVAL ? DAY)";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, interval);

            ResultSet rs = ps.executeQuery();

//            if(rs.next()){
//                System.out.println("rs has next");
//            }else{
//                System.out.println("ther is no row in rs");
//            }
            while (rs.next()) {

                Appointment appointment = new Appointment();
                appointment.setPatientId(rs.getString("patientId"));

                //System.out.println("patient id= " + appointment.getPatientId());
                appointment.setPatientFirstName(rs.getString("patientFirstName"));
                //System.out.println("patient id= " + appointment.getPatientFirstName());
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

    public static ArrayList doSearchDoctor(Admin adminDoctor) {

        ArrayList doctorList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            //String sql = "select * from doctors d, departments dp where d.departmentId=dp.departmentId and having doctorFirstName like ? and doctorLastName like ? and doctorGender like ? and departmentName like ? and having doctorId like ?";
            String sql = "select d.doctorId,doctorFirstName,doctorLastName, departmentName,gender,age,contactEmail from doctors d, departments dp,users u where d.doctorId=u.doctorId and d.departmentId=dp.departmentId and doctorFirstName like ? and doctorLastName like ? and gender like ? and d.departmentId like ? and d.doctorId like ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, adminDoctor.getFirstName() + "%");
            preparedStatement.setString(2, adminDoctor.getLastName() + "%");
            preparedStatement.setString(3, adminDoctor.getGender() + "%");
            preparedStatement.setString(4, adminDoctor.getDepartmentId() + "%");
            preparedStatement.setString(5, adminDoctor.getDoctorId() + "%");
            System.out.println("sql search doctor = " + preparedStatement);

//            System.out.println("sql"+preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println("size of rs="+ rs.getFetchSize());

            while (rs.next()) {
                Doctors doctor = new Doctors();
                doctor.setDoctorId(rs.getString("doctorId"));
                doctor.setDoctorFirstName(rs.getString("doctorFirstName"));
                doctor.setDoctorLastName(rs.getString("doctorLastName"));
                doctor.setDepartmentName(rs.getString("departmentName"));
                doctor.setDoctorAge(rs.getString("age"));
                doctor.setDoctorGender(rs.getString("gender"));
                doctor.setContactEmail(rs.getString("contactEmail"));
                //code to set doctor parameters

                doctorList.add(doctor);
            }

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return doctorList;
    }

    //search patient
    public static ArrayList doSearchPatient(Admin adminPatient) {

        ArrayList patientList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            //String sql = "select * from doctors d, departments dp where d.departmentId=dp.departmentId and having doctorFirstName like ? and doctorLastName like ? and doctorGender like ? and departmentName like ? and having doctorId like ?";
            String sql = "select * from patients p, users u where p.userId = u.userId and patientFirstName like ? and patientLastName like ? and p.gender like ? and appointmentId like ? and p.patientId like ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, adminPatient.getFirstName() + "%");
            preparedStatement.setString(2, adminPatient.getLastName() + "%");
            preparedStatement.setString(3, adminPatient.getGender() + "%");
            preparedStatement.setString(4, adminPatient.getAppointmentId() + "%");
            preparedStatement.setString(5, adminPatient.getPatientId() + "%");
            System.out.println("sql search doctor = " + preparedStatement);

//            System.out.println("sql"+preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println("size of rs="+ rs.getFetchSize());

            while (rs.next()) {
                Patients patient = new Patients();
                patient.setPatientId(rs.getString("patientId"));
                patient.setAppointmentId(rs.getString("appointmentId"));
                patient.setPatientFirstName(rs.getString("patientFirstName"));
                patient.setPatientLastName(rs.getString("patientLastName"));
                patient.setAge(rs.getString("age"));
                patient.setGender(rs.getString("gender"));
                patient.setAddress(rs.getString("address"));
                patient.setDateOfRegisteration(rs.getString("dateOfRegisteration"));

                //code to set doctor parameters
                patientList.add(patient);
            }

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return patientList;
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
            System.out.println("ps:" + preparedStatement);
            int row = preparedStatement.executeUpdate();

            if (row == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public static String doViewBookings(String interval) {
        String totalBookings = null;

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "SELECT COUNT(appointmentId) as bookings FROM appointments WHERE appointmentDate = DATE_ADD(CURDATE(), INTERVAL ? DAY)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, interval);

            System.out.println("ps:" + ps);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalBookings = rs.getString("bookings");
            } else {
                totalBookings = "0";
            }

        } catch (SQLException ex) {
            Logger log = Logger.getLogger(AdminService.class.getName());
            log.error(LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM)) + " " + ex.getMessage());

        }
        return totalBookings;
    }

    public static String doViewTotalRevenue(String interval) {
        String totalRevenue = null;

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "SELECT SUM(amount) as totalRevenue FROM appointments where bookingDate = DATE_ADD(CURDATE(), INTERVAL ? DAY);";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, interval);

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

    //chart data x axis dashboard admin--------------------------------------------------------------------------------
    public static String elementsForXaxis(String interval) {
        String date = null;

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "select DATE_ADD(CURDATE(), INTERVAL ? DAY) as Date";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, interval);

            System.out.println("ps:" + ps);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                date = rs.getString("Date");
            }

        } catch (SQLException ex) {
            Logger log = Logger.getLogger(AdminService.class.getName());
            log.error(LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM)) + " " + ex.getMessage());

        }
        return date;
    }
    //-------------------------------------------------------------------------------------------------------

    public static String totalRegisteredUsers(String interval) {
        String totalUsers = null;

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "SELECT COUNT(emailAddress) as totalRegisteredUsersToday FROM users where dateofregisteration = DATE_ADD(CURDATE(), INTERVAL ? DAY);";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, interval);

            System.out.println("ps:" + ps);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                totalUsers = rs.getString("totalRegisteredUsersToday");
            } else {
                totalUsers = "0";
            }

        } catch (SQLException ex) {
            Logger log = Logger.getLogger(AdminService.class.getName());
            log.error(LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM)) + " " + ex.getMessage());

        }
        return totalUsers;
    }

    //doGetOccupancyForEachDepartments
    public static ArrayList doGetOccupancyForEachDepartments(String interval) {
        ArrayList departmentList = new ArrayList();

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "SELECT a.departmentId,departmentName, COUNT(appointmentId) as numberOfPatients FROM appointments a,departments d where a.departmentId = d.departmentId and appointmentDate = DATE_ADD(CURDATE(), INTERVAL ? DAY) group by departmentId";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, interval);

            System.out.println("ps:" + ps);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Departments department = new Departments();
                department.setDepartmentId(rs.getString("departmentId"));
                department.setDepartmentName(rs.getString("departmentName"));
                department.setNumberOfPatients(rs.getString("numberOfPatients"));
                departmentList.add(department);
                //System.out.println("numberOfpatients = " + department.getNumberOfPatients());
            }

        } catch (SQLException ex) {
            Logger log = Logger.getLogger(AdminService.class.getName());
            log.error(LocalDateTime.now().format(DateTimeFormatter.ofLocalizedDateTime(FormatStyle.FULL, FormatStyle.MEDIUM)) + " " + ex.getMessage());

        }
        return departmentList;
    }
// check email

    public static boolean doCheckEmail(String emailAddress) {

        boolean result = true;
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "SELECT * FROM users where emailAddress = ?;";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, emailAddress);

            ResultSet rs = ps.executeQuery();
            
            if (!rs.next()) {
                    result = false;
                    System.out.println("result of query = "+result);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public static boolean doAddDoctorInDoctors(Admin doctor) {

        boolean result = false;
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "INSERT INTO doctors (doctorFirstName,doctorLastName,departmentId,emailAddress,contactEmail) VALUES (?, ?, ?,?,?);";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, doctor.getFirstName());
            ps.setString(2, doctor.getLastName());
            ps.setString(3, doctor.getDepartmentId());
            ps.setString(4, doctor.getEmailAddress());
            ps.setString(5,doctor.getContactEmail());

            int res = ps.executeUpdate();

            if (res == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }
    public static boolean doAddDoctorInUsers(Admin doctor) {

        boolean result = false;
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "INSERT INTO users (emailAddress,firstName,lastName,password,dateOfRegisteration,gender,roleId,occupation,address,doctorId,age) VALUES (?,?,?,?,curdate(),?,?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, doctor.getEmailAddress());
            ps.setString(2, doctor.getFirstName());
            ps.setString(3, doctor.getLastName());
            ps.setString(4, doctor.getPassword());
           // ps.setString(5, "");
            ps.setString(5, doctor.getGender());
            ps.setString(6, doctor.getRoleId());
            ps.setString(7, doctor.getOccupation());
            ps.setString(8, doctor.getAddress());
            ps.setString(9, doctor.getDoctorId());
            ps.setString(10, doctor.getAge());
           

            int res = ps.executeUpdate();

            if (res == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }
    public static boolean doAddAdminInUsers(Admin admin) {

        boolean result = false;
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "INSERT INTO users (emailAddress,firstName,lastName,password,dateOfRegisteration,gender,roleId,occupation,address,age) VALUES (?,?,?,?,curdate(),?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, admin.getEmailAddress());
            ps.setString(2, admin.getFirstName());
            ps.setString(3, admin.getLastName());
            ps.setString(4, admin.getPassword());
           // ps.setString(5, "");
            ps.setString(5, admin.getGender());
            ps.setString(6, admin.getRoleId());
            ps.setString(7, admin.getOccupation());
            ps.setString(8, admin.getAddress());
          
            ps.setString(9, admin.getAge());
           

            int res = ps.executeUpdate();

            if (res == 1) {
                result = true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }
     public static String doSearchDoctorUsingEmail(String emailAddress) {

        String doctorId = "";
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "select * from doctors where emailAddress = ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, emailAddress);
          
            System.out.println("sql search doctor = " + preparedStatement);

//            System.out.println("sql"+preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println("size of rs="+ rs.getFetchSize());

            while (rs.next()) {
                
                doctorId = rs.getString("doctorId");
                
            }

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return doctorId;
    }
}
