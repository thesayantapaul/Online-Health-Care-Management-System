package com.exavalu.models;

import com.exavalu.services.AdminService;
import com.exavalu.services.AppointmentService;
import com.exavalu.services.DoctorService;
import com.exavalu.services.LoginService;
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
        map = (ApplicationMap) application;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;

    }

    public String doUpdateAppointment() {
        String result = "FAILURE";
        boolean success = AdminService.doUpdateAppointment(this);

        if (success) {
            ArrayList appointmentList = AdminService.doViewAppointments();

            if (appointmentList.size() > 0) {
                sessionMap.put("AppointmentList", appointmentList);

            }

            result = "SUCCESS";

        }
        return result;
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
        System.out.println(this.departmentId);
        String result = "FAILURE";
        ArrayList doctorList = DoctorService.getInstance().getAllDoctors(this.departmentId);

        if (!doctorList.isEmpty()) {
            result = "SUCCESS";
            sessionMap.put("DoctorList", doctorList);

        } else {
            sessionMap.put("FailSignUp", "Email All Ready Exsists");
        }
        System.out.println(sessionMap);
        return result;

    }

    public String getAppointment() throws Exception {
        String result = "FAILURE";
        sessionMap.put("Appointment", this);

        sessionMap.put("symptoms", this.getSymptoms());
        System.out.println(this.getEmailAddress());
        boolean success = LoginService.getInstance().doExsists(this.getEmailAddress(), sessionMap);
        if (!success) {
            result = "SignUp";
        } else {
            Users user = (Users) sessionMap.get("Patient");
            boolean res = LoginService.getInstance().doLogin(user);
            if (res) {
                sessionMap.put("Loggedin", user);
                boolean insert = AppointmentService.getInstance().getAppointment(this);
                if (insert) {
                    result = "SUCCESS";
                }
            }

        }

        System.out.println(sessionMap);
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

}
