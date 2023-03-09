package com.exavalu.models;

import com.exavalu.services.AdminService;
import com.exavalu.services.ApiService;
import com.exavalu.services.AppointmentService;
import com.exavalu.services.DoctorService;
import com.exavalu.services.LoginService;
import com.exavalu.services.PatientService;
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
public class Appointment extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

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
        setMap((ApplicationMap) application);
    }

    @Override
    public void setSession(Map<String, Object> session) {
        setSessionMap((SessionMap<String, Object>) (SessionMap) session);

    }

    public String doUpdateAppointment() {
        String result = "FAILURE";
        boolean success = AdminService.doUpdateAppointment(this);

        if (success) {
            ArrayList appointmentList = AdminService.doViewAppointments();

            if (appointmentList.size() > 0) {
                getSessionMap().put("AppointmentList", appointmentList);

            }

            result = "SUCCESS";

        }
        return result;
    }
    private String userId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    private String patientId;
    private String patientFirstName, patientLastName, doctorFirstName, doctorLastName;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getStatusId() {
        return statusId;
    }

    public void setStatusId(String statusId) {
        this.statusId = statusId;
    }

    public String getStatusOfAppointments() {
        return statusOfAppointments;
    }

    public void setStatusOfAppointments(String statusOfAppointments) {
        this.statusOfAppointments = statusOfAppointments;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    public String getPatientFirstName() {
        return patientFirstName;
    }

    public void setPatientFirstName(String patientFirstName) {
        this.patientFirstName = patientFirstName;
    }

    public String getPatientLastName() {
        return patientLastName;
    }

    public void setPatientLastName(String patientLastName) {
        this.patientLastName = patientLastName;
    }

    public String getDoctorFirstName() {
        return doctorFirstName;
    }

    public void setDoctorFirstName(String doctorFirstName) {
        this.doctorFirstName = doctorFirstName;
    }

    public String getDoctorLastName() {
        return doctorLastName;
    }

    public void setDoctorLastName(String doctorLastName) {
        this.doctorLastName = doctorLastName;
    }

    public String getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(String appointmentId) {
        this.appointmentId = appointmentId;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    public String doGetDoctor() throws Exception {
        System.out.println(this.getDepartmentId());
        String result = "FAILURE";
        ArrayList doctorList = DoctorService.getInstance().getAllDoctors(this.getDepartmentId());

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

    public String doPrescribe() throws Exception {
        System.out.println(this.getAppointmentId());
        String result = "FAILURE";

        Appointment user = PatientService.getInstance().getPatientDetail(this.getAppointmentId());
        String doctorId = (String) getSessionMap().get("doctorId");
        Doctors doctor = DoctorService.getInstance().getDoctor(doctorId);
        ArrayList med = ApiService.getInstance().getAllData();
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

    public String getAppointment() throws Exception {
        String result = "FAILURE";
        getSessionMap().clear();
        getSessionMap().put("Appointment", this);

        getSessionMap().put("symptoms", this.getSymptoms());
        System.out.println(this.getEmailAddress());
        boolean success = LoginService.getInstance().doExsists(this.getEmailAddress(), getSessionMap());
        if (!success) {
            result = "SignUp";
        } else {
            Users user = (Users) getSessionMap().get("Patient");
            boolean res = LoginService.getInstance().doLogin(user);
            if (res) {
                getSessionMap().put("Loggedin", user);
                boolean r1 = PatientService.getInstance().insertPatient(this, user.getUserId());
                Appointment appointment = PatientService.getInstance().getPatient(this, user.getUserId());
                boolean insert = AppointmentService.getInstance().getAppointment(appointment);
                appointment = AppointmentService.getInstance().getAppointmentId(appointment);
                boolean r2 = PatientService.getInstance().insertPatientAppointment(appointment);
                LoginService.getInstance().updateUser(appointment);
                ArrayList appointment1 = new ArrayList();
                ArrayList appointment2 = new ArrayList();

                System.out.println("this is patiend id :" + this.getUserId());

                appointment1 = PatientService.doViewParticularUpcomingAppointments(user.getUserId());
                appointment2 = PatientService.doViewParticularMedicalHistory(user.getUserId());
                if (appointment1 != null) {
                    sessionMap.put("PatientUpcomingBooking", appointment1);
                    sessionMap.put("PatientMedicalHistory", appointment2);
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
