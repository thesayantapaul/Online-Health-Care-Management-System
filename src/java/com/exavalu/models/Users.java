/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.AdminService;
import com.exavalu.services.AppointmentService;
import com.exavalu.services.DepartmentService;
import com.exavalu.services.DoctorService;
import com.exavalu.services.LoginService;
import com.exavalu.services.MailServic;
import com.exavalu.services.OtpService;
import com.exavalu.services.PatientService;
import com.exavalu.services.PrescriptionService;
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
 * @author anich
 */
public class Users extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

    private String userId;

    /**
     *
     * @return
     */
    public String getUserId() {
        return userId;
    }

    /**
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    private String emailAddress;
    private String password;
    private String roleId;
    private String status;
    private String roleName;
    private String occupation;
    private String address;
    private String gender;
    private String firstName;
    private String lastName;
    private String doctorId;
    private String patientId;
    private String sub;
    private String email;
    private String family_name;
    private String given_name;
    private String picture;
    private String age;
    private String otp;

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    /**
     *
     * @return
     */
    public String getAge() {
        return age;
    }

    /**
     *
     * @param age
     */
    public void setAge(String age) {
        this.age = age;
    }

    /**
     *
     * @return
     */
    public String getSub() {
        return sub;
    }

    /**
     *
     * @param sub
     */
    public void setSub(String sub) {
        this.sub = sub;
    }

    /**
     *
     * @return
     */
    public String getEmail() {
        return email;
    }

    /**
     *
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     *
     * @return
     */
    public String getFamily_name() {
        return family_name;
    }

    /**
     *
     * @param family_name
     */
    public void setFamily_name(String family_name) {
        this.family_name = family_name;
    }

    /**
     *
     * @return
     */
    public String getGiven_name() {
        return given_name;
    }

    /**
     *
     * @param given_name
     */
    public void setGiven_name(String given_name) {
        this.given_name = given_name;
    }

    /**
     *
     * @return
     */
    public String getPicture() {
        return picture;
    }

    /**
     *
     * @param picture
     */
    public void setPicture(String picture) {
        this.picture = picture;
    }

    /**
     *
     * @return
     */
    public String getDoctorId() {
        return doctorId;
    }

    /**
     *
     * @param doctorId
     */
    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    /**
     *
     * @return
     */
    public String getPatientId() {
        return patientId;
    }

    /**
     *
     * @param patientId
     */
    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    /**
     * @return the emailAddress
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * @param emailAddress the emailAddress to set
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the roleId
     */
    public String getRoleId() {
        return roleId;
    }

    /**
     * @param roleId
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    /**
     *
     * @return
     */
    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();

    /**
     *
     * @param application
     */
    @Override
    public void setApplication(Map<String, Object> application) {
        map = (ApplicationMap) application;
    }

    /**
     *
     * @param session
     */
    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    /**
     * @return the roleName
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * @param roleName the roleName to set
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    /**
     * @return the occupation
     */
    public String getOccupation() {
        return occupation;
    }

    /**
     * @param occupation the occupation to set
     */
    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * doLogin used to validate the credential and role based login
     *
     * @return
     */
    public String doLogin() {
        String result = "FAILURE";
        boolean success = LoginService.getInstance().doLogin(this);
        //MailServic.send("anichakraborty863@gmail.com", "hello javatpoint", "How r u?");
        if (success) {
            if (this.roleId.equals("1")) {
                ArrayList appointment = new ArrayList();
                ArrayList appointment2 = new ArrayList();
                ArrayList activePrescription = new ArrayList();

                System.out.println("this is patiend id :" + this.getUserId());

                appointment = PatientService.doViewParticularUpcomingAppointments(this.getUserId());
                appointment2 = PatientService.doViewParticularMedicalHistory(this.getUserId());
                activePrescription = PrescriptionService.getInstance().getPatientPrescription(this.userId);
                if (appointment != null) {
                    sessionMap.put("PatientUpcomingBooking", appointment);
                    sessionMap.put("PatientMedicalHistory", appointment2);
                    sessionMap.put("PatientPrescription", activePrescription);
                    result = "PATIENTINDEX";
                }
            }
            if (this.roleId.equals("2")) {
                System.out.println(this.doctorId);
                ArrayList appointmentList = DoctorService.getInstance().doViewAppointments(this.doctorId);
                ArrayList pastAppointmentList = DoctorService.getInstance().doViewPastAppointments(this.doctorId);
                sessionMap.put("AppointmentListDoctor", appointmentList);
                sessionMap.put("PastAppointment", pastAppointmentList);
                String todayBooking = DoctorService.getInstance().doViewBookings("0", this.doctorId);
                String day1Booking = DoctorService.getInstance().doViewBookings("-1", this.doctorId);

                //graph data population booking or appointments------------------
                String day2Booking = DoctorService.getInstance().doViewBookings("-2", this.doctorId);
                String day3Booking = DoctorService.getInstance().doViewBookings("-3", this.doctorId);
                String day4Booking = DoctorService.getInstance().doViewBookings("-4", this.doctorId);
                String day5Booking = DoctorService.getInstance().doViewBookings("-5", this.doctorId);
                String day6Booking = DoctorService.getInstance().doViewBookings("-6", this.doctorId);

                if (day2Booking != null) {
                    sessionMap.put("Day2Booking", day2Booking);
                } else {
                    sessionMap.put("Day2Booking", "0");
                }
                if (day3Booking != null) {
                    sessionMap.put("Day3Booking", day3Booking);
                } else {
                    sessionMap.put("Day3Booking", "0");
                }
                if (day4Booking != null) {
                    sessionMap.put("Day4Booking", day4Booking);
                } else {
                    sessionMap.put("Day4Booking", "0");
                }
                if (day5Booking != null) {
                    sessionMap.put("Day5Booking", day5Booking);
                } else {
                    sessionMap.put("Day5Booking", "0");
                }
                if (day6Booking != null) {
                    sessionMap.put("Day6Booking", day6Booking);
                } else {
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
                    sessionMap.put("HigherOrLowerText", "Higher than yesterday");
                    sessionMap.put("TodayBooking", "0");
                    sessionMap.put("Day1Booking", day1Booking);
                }
                String totalTodayRevenue = DoctorService.getInstance().doViewTotalRevenue("0", this.doctorId);
                String day1Revenue = DoctorService.getInstance().doViewTotalRevenue("-1", this.doctorId);

                //graph data population revenue--------------------------------------
                String day2Revenue = DoctorService.getInstance().doViewTotalRevenue("-2", this.doctorId);
                String day3Revenue = DoctorService.getInstance().doViewTotalRevenue("-3", this.doctorId);
                String day4Revenue = DoctorService.getInstance().doViewTotalRevenue("-4", this.doctorId);
                String day5Revenue = DoctorService.getInstance().doViewTotalRevenue("-5", this.doctorId);
                String day6Revenue = DoctorService.getInstance().doViewTotalRevenue("-6", this.doctorId);

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
                        sessionMap.put("TotalRevenue", totalTodayRevenue);
                        sessionMap.put("HigherOrLowerTextRevenue", "Lower than yesterday");
                        sessionMap.put("DecreaseRevenue", "decrease");
                        sessionMap.put("IncreaseRevenue", null);
                    }

                } else {

                    sessionMap.put("HigherOrLowerTextRevenue", "Higher than yesterday");

                }
                ArrayList doctortodayAppointmentList = DoctorService.getInstance().doViewtodayAppointments("0", this.doctorId);
                sessionMap.put("DoctorAppointmentListDashBoard", doctortodayAppointmentList);
                sessionMap.put("doctorId", this.doctorId);
                ArrayList prescribedList = PrescriptionService.getInstance().getPrescription(this.doctorId);
                sessionMap.put("PreviousPrescription", prescribedList);
                ArrayList departmentOccupncyList = AdminService.doGetOccupancyForEachDepartments("0");

                sessionMap.put("OccupancyInDepartments", departmentOccupncyList);

                System.out.println(sessionMap);
                result = "DOCTORINDEX";
            }
            if (this.roleId.equals("3")) {
                ArrayList deptList = DepartmentService.getInstance().getAllDepartments();
                sessionMap.put("DeptList", deptList);

//                booking 
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
                if (Integer.parseInt(todayBooking) > Integer.parseInt(day1Booking)) {

                    sessionMap.put("HigherOrLowerText", "Higher than yesterday");

                    sessionMap.put("IncreaseBooking", "increase");
                    sessionMap.put("DecreaseBooking", null);

                } else {
                    sessionMap.put("HigherOrLowerText", "Lower than yesterday");

                    sessionMap.put("DecreaseBooking", "decrease");
                    sessionMap.put("IncreaseBooking", null);
                }
// revenue---------------------------------------------------------------
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

                //elements for xaxis in dashboard graph -----------------------------------
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

                //----------------------------------------------------------------------------------------------------------
                ArrayList appointmentList = AdminService.doViewAppointments("0");
                ArrayList departmentOccupncyList = AdminService.doGetOccupancyForEachDepartments("0");

                sessionMap.put("OccupancyInDepartments", departmentOccupncyList);

                sessionMap.put("AppointmentListDashBoard", appointmentList);

//-------------------no. of user registeration to show on admin dashboard---------------------------------------------
                String todayRegisteration = AdminService.totalRegisteredUsers("0");
                if (todayRegisteration != null) {
                    sessionMap.put("TodayUsers", todayRegisteration);
                } else {
                    sessionMap.put("TodayUsers", "0");
                }

                String day1User = AdminService.totalRegisteredUsers("-1");
                if (day1User != null) {
                    sessionMap.put("Day1User", day1User);
                } else {
                    sessionMap.put("Day1User", null);
                }

                String day2User = AdminService.totalRegisteredUsers("-2");
                if (day2User != null) {
                    sessionMap.put("Day2User", day2User);
                } else {
                    sessionMap.put("Day2User", null);
                }

                String day3User = AdminService.totalRegisteredUsers("-3");
                if (day3User != null) {
                    sessionMap.put("Day3User", day3User);
                } else {
                    sessionMap.put("Day3User", "0");
                }

                String day4User = AdminService.totalRegisteredUsers("-4");
                if (day4User != null) {
                    sessionMap.put("Day4User", day4User);
                } else {
                    sessionMap.put("Day4User", "0");
                }

                String day5User = AdminService.totalRegisteredUsers("-5");
                if (day5User != null) {
                    sessionMap.put("Day5User", day5User);
                } else {
                    sessionMap.put("Day5User", "0");
                }

                String day6User = AdminService.totalRegisteredUsers("-6");
                if (day6User != null) {
                    sessionMap.put("Day6User", day6User);
                } else {
                    sessionMap.put("Day6User", "0");
                }
//---------------------------------------------------------------------------------------------
                result = "ADMININDEX";
            }

            sessionMap.put("Loggedin", this);
            //System.out.println(DepartmentService.getInstance().getAllDepartments());
            System.out.println(this.roleId);

        } else {
            sessionMap.put("MSG", "Check Your Email or Password");
        }
        return result;
    }

    /**
     * Used to LogOut user and clear the session
     *
     * @return
     * @throws Exception
     */
    public String doLogout() throws Exception {
        String result = "FAILURE";
        sessionMap.clear();
        if (sessionMap.isEmpty()) {
            result = "SUCCESS";
        }
        return result;

    }

    /**
     * Used to Sign Up or add new user
     *
     * @return
     * @throws Exception
     */
    public String doSignUp() throws Exception {
        String result = "FAILURE";
        boolean success = LoginService.getInstance().doSignUp(this);
        boolean res = LoginService.getInstance().doExsists(this.emailAddress, getSessionMap());
        if (success && res) {
            Users user = (Users) getSessionMap().get("Patient");
            boolean res1 = LoginService.getInstance().doInternalLogin(user);
            if (res1) {
                getSessionMap().put("Loggedin", user);
                Appointment appointment = (Appointment) sessionMap.get("Appointment");
                if (appointment != null) {
                    boolean r1 = PatientService.getInstance().insertPatient(appointment, user.getUserId());
                    appointment = PatientService.getInstance().getPatient(appointment, user.getUserId());
                    LoginService.getInstance().updateUser(appointment);
                    boolean insert = AppointmentService.getInstance().getAppointment(appointment);
                    appointment = AppointmentService.getInstance().getAppointmentId(appointment);
                    boolean r2 = PatientService.getInstance().insertPatientAppointment(appointment);

                    if (insert && r1 && r2) {
                        result = "SUCCESS";
                    }

                } else {
                    result = "NORMALSIGNUP";
                }

                sessionMap.put("SuccessSignUp", "Successfully Registered");
                sessionMap.put("SignedUp", this);

            } else {
                sessionMap.put("FailSignUp", "Email All Ready Exsists");
            }
            System.out.println(sessionMap);

        }
        return result;

    }

    /**
     * doSocial used from google social sign up using OAuth2
     *
     * @throws java.lang.Exception
     */
    public String doSocial() throws Exception {
        String result = "FAILURE";
        boolean success = LoginService.getInstance().doSocialSignUp(this);
        this.roleId = "1";

        if (success) {
            Appointment appointment = (Appointment) sessionMap.get("Appointment");
            if (appointment != null) {
                boolean insert = AppointmentService.getInstance().getAppointment(appointment);
                if (insert) {
                    result = "SUCCESS";
                }
            } else {
                result = "SUCCESS";
            }
            sessionMap.put("Loggedin", this);
            sessionMap.put("SuccessSignUp", "Successfully Registered");
            sessionMap.put("SignedUp", this);

        } else {
            sessionMap.put("FailSignUp", "Email All Ready Exsists");
        }
        System.out.println(sessionMap);
        return result;

    }

    /**
     * used from google social Login after validation with BackEnd.
     *
     * @throws java.lang.Exception doSocialLogin
     */
    public String doSocialLogin() throws Exception {
        String result = "FAILURE";
        boolean success = LoginService.getInstance().doSocialLog_in(this);
        this.roleId = "1";

        if (success) {
            ArrayList appointment = new ArrayList();
            ArrayList appointment2 = new ArrayList();
            ArrayList activePrescription = new ArrayList();
            result = "SUCCESS";
            System.out.println("this is user id :" + this.getUserId());

            appointment = PatientService.doViewParticularUpcomingAppointments(this.getUserId());
            appointment2 = PatientService.doViewParticularMedicalHistory(this.getUserId());
            activePrescription = PrescriptionService.getInstance().getPatientPrescription(this.userId);
            if (appointment != null) {
                sessionMap.put("PatientUpcomingBooking", appointment);
                sessionMap.put("PatientMedicalHistory", appointment2);
                sessionMap.put("PatientPrescription", activePrescription);
            }
            Appointment appointments = (Appointment) sessionMap.get("Appointment");
            if (appointments != null) {
                boolean insert = AppointmentService.getInstance().getAppointment(appointments);
                if (insert) {
                    result = "SUCCESS";
                }
            } else {
                result = "SUCCESS";
            }
            sessionMap.put("Loggedin", this);

        } else {
            sessionMap.put("FailSignUp", "Wrong Email or Password");
        }
        System.out.println(sessionMap);
        return result;

    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String doSendOTP() throws Exception {
        String result = "FAILURE";
        boolean success = LoginService.getInstance().doExsists(this.emailAddress, sessionMap);
        if (success) {

            String otp = OtpService.OTP(4);
            sessionMap.put("Otp", otp);
            MailServic.send(this.emailAddress, "One Time Password For Password Reset", otp);
            result = "SUCCESS";
        } else {
            sessionMap.put("FailOtpVerification", "Email Doesn't Exsist");
        }
        System.out.println(sessionMap);
        return result;
    }

    public String doVerifyOTP() throws Exception {
        String result = "FAILURE";
        String userOtp = (String) sessionMap.get("Otp");
        if (this.otp.equals(userOtp)) {
            result = "SUCCESS";
        } else {
            sessionMap.put("FailOtpVerification", "Otp Doesn't match");
        }
        System.out.println(sessionMap);
        return result;
    }

    public String doReset() throws Exception {
        String result = "FAILURE";
        boolean success = LoginService.getInstance().updatePassword(this);
        if (success) {
            result = "SUCCESS";
            sessionMap.put("SuccessSignUp", "Password Changed Please Login now");

        } else {
            sessionMap.put("FailSignUp", "Email Desn't Exsist");
        }
        System.out.println(sessionMap);
        return result;
    }
}
