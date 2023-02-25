package com.exavalu.models;

import com.exavalu.services.AdminService;
import com.exavalu.services.DepartmentService;
import com.exavalu.services.StatusService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author LenovoRaja
 */
public class Admin extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    public void setSessionMap(SessionMap<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }

    public ApplicationMap getMap() {
        return map;
    }

    public void setMap(ApplicationMap map) {
        this.map = map;
    }

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();
    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();

    @Override
    public void setApplication(Map<String, Object> application) {
        map = (ApplicationMap) application;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;

    }

    public String doViewAppointments() {
        String result = "FAILURE";
        ArrayList appointmentList = AdminService.doViewAppointments();

        if (appointmentList.size() > 0) {
            sessionMap.put("AppointmentList", appointmentList);
            result = "SUCCESS";

        }
        return result;
    }
//doViewParticularAppointment

    public String doViewParticularAppointment() {
        String result = "FAILURE";
        Appointment appointment = new Appointment();
        appointment = AdminService.doViewParticularAppointment(this.appointmentId);

        if (appointment != null) {
            result = "EDITAPPOINTENTJSP";
            ArrayList deptList = DepartmentService.getInstance().getAllDepartments();
            ArrayList statusList = StatusService.getAllStatus();
            sessionMap.put("DeptList", deptList);
            sessionMap.put("StatusList", statusList);
            sessionMap.put("appointment", appointment);
            System.out.println("appointmentdate= " + appointment.getAppointmentDate());
        }
        return result;
    }

    public String doCancelAppointment() {
        String result = "FAILURE";
        boolean success = AdminService.doCancelAppointments(this.appointmentId);

        if (success) {

            result = "APPOINTMENTTABLE";
            doViewAppointments();

        }
        return result;
    }
    //doUpdateAppointment

    public String doSearchDoctor() {
        String result = "FAILURE";
        ArrayList doctorList = AdminService.doSearchDoctor(this);

        if (doctorList.size() >= 0) {
            sessionMap.put("Appointments", doctorList);
            result = "SUCCESS";

        }
        return result;
    }

    public String doViewDashboard() {
        String result = "SUCCESS";

        String todayBooking = AdminService.doViewBookings("0");
        String day1Booking = AdminService.doViewBookings("-1");
        
        //graph data population booking or appointments------------------
        String day2Booking = AdminService.doViewBookings("-2");
        String day3Booking = AdminService.doViewBookings("-3");
        String day4Booking = AdminService.doViewBookings("-4");
        String day5Booking = AdminService.doViewBookings("-5");
        String day6Booking = AdminService.doViewBookings("-6");
        
        if(day2Booking != null){
            sessionMap.put("Day2Booking", day2Booking);
        }else{
            sessionMap.put("Day2Booking", "0");
        }
        if(day3Booking != null){
            sessionMap.put("Day3Booking", day3Booking);
        }else{
            sessionMap.put("Day3Booking", "0");
        }
        if(day4Booking != null){
            sessionMap.put("Day4Booking", day4Booking);
        }else{
            sessionMap.put("Day4Booking", "0");
        }
        if(day5Booking != null){
            sessionMap.put("Day5Booking", day5Booking);
        }else{
            sessionMap.put("Day5Booking", "0");
        }
        if(day6Booking != null){
            sessionMap.put("Day6Booking", day6Booking);
        }else{
            sessionMap.put("Day6Booking", "0");
        }
        
        
        
        //compare booking to show in dashboard
        if (todayBooking != null && day1Booking != null) {

            if (Integer.parseInt(todayBooking) >= Integer.parseInt(day1Booking)) {

                sessionMap.put("HigherOrLowerText", "Higher than yesterday");
                sessionMap.put("TodayBooking", todayBooking);
                sessionMap.put("IncreaseBooking", "increase");
                sessionMap.put("DecreaseBooking", null);

            } else {
                sessionMap.put("HigherOrLowerText", "Lower than yesterday");
                sessionMap.put("TodayBooking", todayBooking);
                sessionMap.put("DecreaseBooking", "decrease");
                 sessionMap.put("IncreaseBooking", null);
            }
            sessionMap.put("Day1Booking", day1Booking);
            
            
        } else {
            sessionMap.put("Day1Booking", "0");
            sessionMap.put("HigherOrLowerText", "Higher than yesterday");
            sessionMap.put("TodayBooking", "0");
        }

        String totalTodayRevenue = AdminService.doViewTotalRevenue("0");
        String day1Revenue = AdminService.doViewTotalRevenue("-1");
         //graph data population revenue--------------------------------------
        String day2Revenue = AdminService.doViewTotalRevenue("-2");
        String day3Revenue = AdminService.doViewTotalRevenue("-3");
        String day4Revenue = AdminService.doViewTotalRevenue("-4");
        String day5Revenue = AdminService.doViewTotalRevenue("-5");
        String day6Revenue = AdminService.doViewTotalRevenue("-6");
        
        if(day2Revenue != null){
            sessionMap.put("Day2Revenue", day2Revenue);
        }else{
            sessionMap.put("Day2Revenue", "0");
        }
        if(day3Revenue != null){
            sessionMap.put("Day3Revenue", day3Revenue);
        }else{
            sessionMap.put("Day3Revenue", "0");
        }
        if(day4Revenue != null){
            sessionMap.put("Day4Revenue", day4Revenue);
        }else{
            sessionMap.put("Day4Revenue", "0");
        }
        if(day5Revenue != null){
            sessionMap.put("Day5Revenue", day5Revenue);
        }else{
            sessionMap.put("Day5Revenue", "0");
        }
        if(day6Revenue != null){
            sessionMap.put("Day6Revenue", day6Revenue);
        }else{
            sessionMap.put("Day6Revenue", "0");
        }

        //compare revenue
        if (totalTodayRevenue != null && day1Revenue != null) {
            if (Integer.parseInt(totalTodayRevenue) >= Integer.parseInt(day1Revenue)) {

                sessionMap.put("TotalRevenue", totalTodayRevenue);
                sessionMap.put("HigherOrLowerTextRevenue", "Higher than yesterday");
                sessionMap.put("IncreaseRevenue", "increase");
                sessionMap.put("DecreaseRevenue", null);

            } else {
                sessionMap.put("IncreaseRevenue", null);
                sessionMap.put("DecreaseRevenue", "decrease");
                sessionMap.put("TotalRevenue", totalTodayRevenue);
                sessionMap.put("HigherOrLowerTextRevenue", "Lower than yesterday");
            }
            sessionMap.put("Day1Revenue", day1Revenue);
        } else {
            sessionMap.put("TotalRevenue", "0");
            sessionMap.put("Day1Revenue", "0");
            sessionMap.put("HigherOrLowerTextRevenue", "Higher than yesterday");
        }

        ArrayList appointmentList = AdminService.doViewAppointments("0");

        sessionMap.put("AppointmentListDashBoard", appointmentList);
        String totalRegisteredUsers = AdminService.totalRegisteredUsers();
        sessionMap.put("TotalRegisteredUsers", totalRegisteredUsers);

        return result;
    }
    

    private String messageToPatient;
    private String appointmentId;
    private String firstName;
    private String lastName;
    private String gender;
    private String departmentName;
    private String doctorId;
    private String appointmentDate;

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getMessageToPatient() {
        return messageToPatient;
    }

    public void setMessageToPatient(String messageToPatient) {
        this.messageToPatient = messageToPatient;
    }

    public String getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(String appointmentId) {
        this.appointmentId = appointmentId;
    }

}
