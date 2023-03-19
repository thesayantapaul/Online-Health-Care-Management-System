package com.exavalu.models;

import com.exavalu.services.AdminService;
import com.exavalu.services.ApiService;
import com.exavalu.services.AppointmentService;
import com.exavalu.services.DoctorService;
import com.exavalu.services.LoginService;
import com.exavalu.services.MailServic;
import com.exavalu.services.PatientService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author anich
 */
public class Appointment extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

    /**
     *
     * @return
     */
    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    /**
     *
     * @param sessionMap
     */
    public void setSessionMap(SessionMap<String, Object> sessionMap) {
        this.sessionMap = sessionMap;
    }

    /**
     *
     * @return
     */
    public ApplicationMap getMap() {
        return map;
    }

    /**
     *
     * @param map
     */
    public void setMap(ApplicationMap map) {
        this.map = map;
    }

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();
    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();

    /**
     *
     * @param application
     */
    @Override
    public void setApplication(Map<String, Object> application) {
        setMap((ApplicationMap) application);
    }

    /**
     *
     * @param session
     */
    @Override
    public void setSession(Map<String, Object> session) {
        setSessionMap((SessionMap<String, Object>) (SessionMap) session);

    }

    /**
     * Used to get the list of appointment author anich
     *
     * @return
     */
    public String doUpdateAppointment() {
        String result = "FAILURE";
        boolean success = AdminService.doUpdateAppointment(this);

        if (success) {
            List<Appointment> appointmentList = AdminService.doViewAppointments();

            if (!appointmentList.isEmpty()) {
                getSessionMap().put("AppointmentList", appointmentList);

            }

            result = "SUCCESS";

        }
        return result;
    }
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

    private String patientId;
    private String patientFirstName; 
    private String patientLastName;
    private String doctorFirstName; 
    private String doctorLastName;
    private String appointmentId;
    private String appointmentDate;
    private String status;
    private String report;
    private String departmentName;
    private String statusOfAppointments;
    private String statusId;
    private String departmentId;
    private String doctorId;
    private String emailAddress;
    private String symptoms;
    private String gender;
    private String age;
    private String feedback;
    private String weekDays;
    private String time;

    /**
     *
     * @return
     */
    public String getTime() {
        return time;
    }

    /**
     *
     * @param time
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     *
     * @return
     */
    public String getWeekDays() {
        return weekDays;
    }

    /**
     *
     * @param weekDays
     */
    public void setWeekDays(String weekDays) {
        this.weekDays = weekDays;
    }

    /**
     *
     * @return
     */
    public String getGender() {
        return gender;
    }

    /**
     *
     * @param gender
     */
    public void setGender(String gender) {
        this.gender = gender;
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
    public String getDepartmentId() {
        return departmentId;
    }

    /**
     *
     * @param departmentId
     */
    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    /**
     *
     * @return
     */
    public String getStatusId() {
        return statusId;
    }

    /**
     *
     * @param statusId
     */
    public void setStatusId(String statusId) {
        this.statusId = statusId;
    }

    /**
     *
     * @return
     */
    public String getStatusOfAppointments() {
        return statusOfAppointments;
    }

    /**
     *
     * @param statusOfAppointments
     */
    public void setStatusOfAppointments(String statusOfAppointments) {
        this.statusOfAppointments = statusOfAppointments;
    }

    /**
     *
     * @return
     */
    public String getDepartmentName() {
        return departmentName;
    }

    /**
     *
     * @param departmentName
     */
    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
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
     *
     * @return
     */
    public String getPatientFirstName() {
        return patientFirstName;
    }

    /**
     *
     * @param patientFirstName
     */
    public void setPatientFirstName(String patientFirstName) {
        this.patientFirstName = patientFirstName;
    }

    /**
     *
     * @return
     */
    public String getPatientLastName() {
        return patientLastName;
    }

    /**
     *
     * @param patientLastName
     */
    public void setPatientLastName(String patientLastName) {
        this.patientLastName = patientLastName;
    }

    /**
     *
     * @return
     */
    public String getDoctorFirstName() {
        return doctorFirstName;
    }

    /**
     *
     * @param doctorFirstName
     */
    public void setDoctorFirstName(String doctorFirstName) {
        this.doctorFirstName = doctorFirstName;
    }

    /**
     *
     * @return
     */
    public String getDoctorLastName() {
        return doctorLastName;
    }

    /**
     *
     * @param doctorLastName
     */
    public void setDoctorLastName(String doctorLastName) {
        this.doctorLastName = doctorLastName;
    }

    /**
     *
     * @return
     */
    public String getAppointmentId() {
        return appointmentId;
    }

    /**
     *
     * @param appointmentId
     */
    public void setAppointmentId(String appointmentId) {
        this.appointmentId = appointmentId;
    }

    /**
     *
     * @return
     */
    public String getAppointmentDate() {
        return appointmentDate;
    }

    /**
     *
     * @param appointmentDate
     */
    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    /**
     *
     * @return
     */
    public String getStatus() {
        return status;
    }

    /**
     *
     * @param status
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     *
     * @return
     */
    public String getReport() {
        return report;
    }

    /**
     *
     * @param report
     */
    public void setReport(String report) {
        this.report = report;
    }

    /**
     *
     * retrieve the List of Doctor under a particular department author anich .
     *
     * @return
     * @throws java.lang.Exception
     */
    public String doGetDoctor() throws Exception {
        System.out.println(this.getDepartmentId());
        String result = "FAILURE";
        List<Doctors> doctorList = DoctorService.getInstance().getAllDoctors(this.getDepartmentId());

        if (!doctorList.isEmpty()) {
            result = "SUCCESS";
            getSessionMap().put("DoctorList", doctorList);
            getSessionMap().put("User", this);

        } else {
            getSessionMap().put("FailSignUp", "Email All Ready Exsists");
        }
        System.out.println(getSessionMap());
        return result;

    }

    /**
     *
     * Used to get the schedule of a particular doctor author anich
     *
     * @return
     * @throws java.lang.Exception
     */
    public String doGetWeekdays() throws Exception {
        System.out.println(this.getDepartmentId());
        String result = "FAILURE";
        String[] weekDays = DoctorService.getInstance().getAllWeekDays(this.getDoctorId());

        if (weekDays.length > 0) {
            result = "SUCCESS";
            getSessionMap().put("weekDaysList", weekDays);
            getSessionMap().put("User", this);
            getSessionMap().put("DoctorId", this.getDoctorId());

        } else {
            getSessionMap().put("FailSignUp", "Email All Ready Exsists");
        }
        System.out.println(getSessionMap());
        return result;

    }

    /**
     *
     * Used to get the visiting hour of a doctor
     *
     * @return
     * @throws java.lang.Exception
     */
    public String doGetTime() throws Exception {
        System.out.println(this.getWeekDays());
        String result = "FAILURE";
        String timeofAppointmrnt = DoctorService.getInstance().getAllTime(this.getWeekDays(), (String) (getSessionMap().get("DoctorId")));

        if (timeofAppointmrnt != null) {
            result = "SUCCESS";
            getSessionMap().put("timeOfAppointmrnt", timeofAppointmrnt);
            getSessionMap().put("User", this);

        } else {
            getSessionMap().put("FailSignUp", "Email All Ready Exsists");
        }
        System.out.println(getSessionMap());
        return result;

    }

    /**
     *
     * Used to initialize the prescription with patient and doctor's information
     *
     * @return
     * @throws java.lang.Exception
     */
    public String doPrescribe() throws Exception {
        System.out.println(this.getAppointmentId());
        String result = "FAILURE";

        Appointment user = PatientService.getInstance().getPatientDetail(this.getAppointmentId());
        String doctorId = (String) getSessionMap().get("doctorId");
        Doctors doctor = DoctorService.getInstance().getDoctor(doctorId);
        List med = ApiService.getInstance().getAllData();
        if (user != null) {
            result = "SUCCESS";
            getSessionMap().put("PatientDetail", user);
            getSessionMap().put("DoctorDetail", doctor);
            getSessionMap().put("MedList", med);

        } else {
            getSessionMap().put("FailSignUp", "Email All Ready Exsists");
        }
        System.out.println(getSessionMap());
        return result;

    }

    /**
     *
     * Used by user's to book an appointment
     *
     * @return
     * @throws java.lang.Exception
     */
    public String getAppointment() throws Exception {
        String result = "FAILURE";
        getSessionMap().clear();
        getSessionMap().put("Appointment", this);

        getSessionMap().put("symptoms", this.getSymptoms());
        boolean success = LoginService.getInstance().doExsists(this.getEmailAddress(), getSessionMap());
        if (!success) {
            result = "SignUp";
        } else {
            Users user = (Users) getSessionMap().get("Patient");
            boolean res = LoginService.getInstance().doInternalLogin(user);
            if (res) {
                getSessionMap().put("Loggedin", user);
                boolean r1 = PatientService.getInstance().insertPatient(this, user.getUserId());
                Appointment appointment = PatientService.getInstance().getPatient(this, user.getUserId());
                boolean insert = AppointmentService.getInstance().getAppointment(appointment);
                appointment = AppointmentService.getInstance().getAppointmentId(appointment);
                boolean r2 = PatientService.getInstance().insertPatientAppointment(appointment);
                MailServic.sendAppointment(appointment);
                LoginService.getInstance().updateUser(appointment);
                System.out.println("this is patiend id :" + this.getUserId());

                List<Appointment> upcomingAppointment = PatientService.doViewParticularUpcomingAppointments(user.getUserId());
                List<Appointment> appointmentHistory = PatientService.doViewParticularMedicalHistory(user.getUserId());
                if (upcomingAppointment != null) {
                    sessionMap.put("PatientUpcomingBooking", upcomingAppointment);
                    sessionMap.put("PatientMedicalHistory", appointmentHistory);
                }
                if (insert && r1 && r2) {
                    System.out.println("SUcess");
                    result = "SUCCESS";
                }
            }

        }

        System.out.println(getSessionMap());
        return result;

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
     * @return the symptoms
     */
    public String getSymptoms() {
        return symptoms;
    }

    /**
     * @param symptoms the symptoms to set
     */
    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    /**
     * @return the feedback
     */
    public String getFeedback() {
        return feedback;
    }

    /**
     * @param feedback the feedback to set
     */
    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

}
