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

            ArrayList statusList = StatusService.getAllStatus();

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
            sessionMap.put("SearchedDoctorList", doctorList);
            result = "SUCCESS";

        }
        return result;
    }

    public String doSearchPatient() {
        String result = "FAILURE";
        ArrayList patientList = AdminService.doSearchPatient(this);

        if (patientList.size() >= 0) {
            sessionMap.put("SearchResult", patientList);
            result = "SUCCESS";
        }

        return result;
    }

    public String doViewDashboard() {
        String result = "SUCCESS";

        String todayBooking = AdminService.doViewBookings("0");
        sessionMap.put("TodayBooking", todayBooking);
        String day1Booking = AdminService.doViewBookings("-1");
        sessionMap.put("Day1Booking", day1Booking);

        //graph data population booking or appointments------------------
        String day2Booking = AdminService.doViewBookings("-2");
        sessionMap.put("Day2Booking", day2Booking);
        String day3Booking = AdminService.doViewBookings("-3");
        sessionMap.put("Day3Booking", day3Booking);
        String day4Booking = AdminService.doViewBookings("-4");
        sessionMap.put("Day4Booking", day4Booking);
        String day5Booking = AdminService.doViewBookings("-5");
        sessionMap.put("Day5Booking", day5Booking);
        String day6Booking = AdminService.doViewBookings("-6");
        sessionMap.put("Day6Booking", day6Booking);

        //compare booking to show in dashboard
        if (Integer.parseInt(todayBooking) >= Integer.parseInt(day1Booking)) {

            sessionMap.put("HigherOrLowerText", "Higher than yesterday");

            sessionMap.put("IncreaseBooking", "increase");
            sessionMap.put("DecreaseBooking", null);

        } else {
            sessionMap.put("HigherOrLowerText", "Lower than yesterday");

            sessionMap.put("DecreaseBooking", "decrease");
            sessionMap.put("IncreaseBooking", null);
        }

        String totalTodayRevenue = AdminService.doViewTotalRevenue("0");
        String day1Revenue = AdminService.doViewTotalRevenue("-1");
        //graph data population revenue--------------------------------------
        String day2Revenue = AdminService.doViewTotalRevenue("-2");
        String day3Revenue = AdminService.doViewTotalRevenue("-3");
        String day4Revenue = AdminService.doViewTotalRevenue("-4");
        String day5Revenue = AdminService.doViewTotalRevenue("-5");
        String day6Revenue = AdminService.doViewTotalRevenue("-6");

        if (totalTodayRevenue != null) {
            sessionMap.put("TodayRevenue", totalTodayRevenue);
        } else {
            sessionMap.put("TodayRevenue", "0");
        }

        if (day1Revenue != null) {
            sessionMap.put("Day1Revenue", day1Revenue);
        } else {
            sessionMap.put("Day1Revenue", "0");
        }

        if (day2Revenue != null) {
            sessionMap.put("Day2Revenue", day2Revenue);
        } else {
            sessionMap.put("Day2Revenue", "0");
        }
        if (day3Revenue != null) {
            sessionMap.put("Day3Revenue", day3Revenue);
        } else {
            sessionMap.put("Day3Revenue", "0");
        }
        if (day4Revenue != null) {
            sessionMap.put("Day4Revenue", day4Revenue);
        } else {
            sessionMap.put("Day4Revenue", "0");
        }
        if (day5Revenue != null) {
            sessionMap.put("Day5Revenue", day5Revenue);
        } else {
            sessionMap.put("Day5Revenue", "0");
        }
        if (day6Revenue != null) {
            sessionMap.put("Day6Revenue", day6Revenue);
        } else {
            sessionMap.put("Day6Revenue", "0");
        }

        //compare revenue
        if (totalTodayRevenue != null && day1Revenue != null) {
            if (Integer.parseInt(totalTodayRevenue) >= Integer.parseInt(day1Revenue)) {

                sessionMap.put("HigherOrLowerTextRevenue", "Higher than yesterday");
                sessionMap.put("IncreaseRevenue", "increase");
                sessionMap.put("DecreaseRevenue", null);

            } else {
                sessionMap.put("IncreaseRevenue", null);
                sessionMap.put("DecreaseRevenue", "decrease");
                sessionMap.put("HigherOrLowerTextRevenue", "Lower than yesterday");

            }

        } else {
            if (totalTodayRevenue != null) {
                sessionMap.put("IncreaseRevenue", "increase");
                sessionMap.put("DecreaseRevenue", null);
                sessionMap.put("HigherOrLowerTextRevenue", "Higher than yesterday");
            } else {
                sessionMap.put("IncreaseRevenue", null);
                sessionMap.put("DecreaseRevenue", "decrease");
                sessionMap.put("HigherOrLowerTextRevenue", "Lower than yesterday");
            }
            sessionMap.put("TotalRevenue", "0");

        }

//elements for x-axis in dashboard graph --------------------------------------------------------------
        String todayDateElement = AdminService.elementsForXaxis("0");
        sessionMap.put("CurrentDay", todayDateElement);
        String day1 = AdminService.elementsForXaxis("-1");
        sessionMap.put("Day1", day1);
        String day2 = AdminService.elementsForXaxis("-2");
        sessionMap.put("Day2", day2);
        String day3 = AdminService.elementsForXaxis("-3");
        sessionMap.put("Day3", day3);
        String day4 = AdminService.elementsForXaxis("-4");
        sessionMap.put("Day4", day4);
        String day5 = AdminService.elementsForXaxis("-5");
        sessionMap.put("Day5", day5);
        String day6 = AdminService.elementsForXaxis("-6");
        sessionMap.put("Day6", day6);

        //-----------------------------------------------------------------------
        ArrayList appointmentList = AdminService.doViewAppointments("0");

        sessionMap.put("AppointmentListDashBoard", appointmentList);
        //---------------------departmentList with occupancy start---------------------------------------------------------------   

        ArrayList departmentOccupncyList = AdminService.doGetOccupancyForEachDepartments("0");

        sessionMap.put("OccupancyInDepartments", departmentOccupncyList);
        //--------------------------------------------------------------------------------------------------------

        String todayRegisteration = AdminService.totalRegisteredUsers("0");
        sessionMap.put("TodayUsers", todayRegisteration);
        String day1User = AdminService.totalRegisteredUsers("-1");
        sessionMap.put("Day1User", day1User);
        String day2User = AdminService.totalRegisteredUsers("-2");
        sessionMap.put("Day2User", day2User);
        String day3User = AdminService.totalRegisteredUsers("-3");
        sessionMap.put("Day3User", day3User);

        String day4User = AdminService.totalRegisteredUsers("-4");
        sessionMap.put("Day4User", day4User);

        String day5User = AdminService.totalRegisteredUsers("-5");
        sessionMap.put("Day5User", day5User);

        String day6User = AdminService.totalRegisteredUsers("-6");
        sessionMap.put("Day6User", day6User);

        return result;
    }
   public String showAdminAddDoctor(){
       String result = "SUCCESS";
       return result;
   }

    public String doAddDoctor() {
        String result = "ALERT";

        boolean success1 = AdminService.doAddDoctorInDoctors(this);

        if (success1) {

            this.doctorId = AdminService.doSearchDoctorUsingEmail(this.emailAddress);
            
            boolean success2 = AdminService.doAddDoctorInUsers(this);
            if (success2) {
                sessionMap.put("CheckEmail","Successfully Registered!");
                result = "ALERT";
            }
        }else{
            sessionMap.put("CheckEmail","Bhai kar kya rha hai tu ! Email already exist hai bola tha na");
            result = "ALERT";
        }
        return result;
    }

    public String doCheckEmail() {
        String result = "FAILURE";
        System.out.println("email to verify = " + this.emailAddress);

        boolean success = AdminService.doCheckEmail(this.emailAddress);
        if (success) {
            String myString = "email already exist!";
            System.out.println(myString);
             sessionMap.put("CheckEmail",myString);
            result = "SUCCESS";
            //sessionMap.put("emailExist",true);

        }else{
            sessionMap.put("CheckEmail","Entered enail is available continue!");
            result = "SUCCESS";
        }
        //sessionMap.put("emailExist",false);

        return result;
    }
    
    private String messageToPatient;
    private String appointmentId;
    private String firstName;
    private String lastName;
    private String gender, age;

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }
    private String departmentName;
    private String doctorId;
    private String departmentId;
    private String patientId;
    private String emailAddress;
    private String password;
    private String roleId;
    private String occupation;
    private String address;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }
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
