/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.models;

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

    private String appointmentId;

    private String appointmentDate;

    private String doctorId;

    private String patientId;

    private String departmentId;

    private String emailAddress;

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    private String statusId;

    private String messagetopatient;

    private String symptoms;

    private String time;

    /**
     * @return the appointmentId
     */
    public String getAppointmentId() {
        return appointmentId;
    }

    /**
     * @param appointmentId the appointmentId to set
     */
    public void setAppointmentId(String appointmentId) {
        this.appointmentId = appointmentId;
    }

    /**
     * @return the appointmentDate
     */
    public String getAppointmentDate() {
        return appointmentDate;
    }

    /**
     * @param appointmentDate the appointmentDate to set
     */
    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    /**
     * @return the doctorId
     */
    public String getDoctorId() {
        return doctorId;
    }

    /**
     * @param doctorId the doctorId to set
     */
    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    /**
     * @return the patientId
     */
    public String getPatientId() {
        return patientId;
    }

    /**
     * @param patientId the patientId to set
     */
    public void setPatientId(String patientId) {
        this.patientId = patientId;
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

    /**
     * @return the statusId
     */
    public String getStatusId() {
        return statusId;
    }

    /**
     * @param statusId the statusId to set
     */
    public void setStatusId(String statusId) {
        this.statusId = statusId;
    }

    /**
     * @return the messagetopatient
     */
    public String getMessagetopatient() {
        return messagetopatient;
    }

    /**
     * @param messagetopatient the messagetopatient to set
     */
    public void setMessagetopatient(String messagetopatient) {
        this.messagetopatient = messagetopatient;
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
     * @return the time
     */
    public String getTime() {
        return time;
    }

    /**
     * @param time the time to set
     */
    public void setTime(String time) {
        this.time = time;
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

        sessionMap.put("symptoms", this.symptoms);
        System.out.println(this.emailAddress);
        boolean success = LoginService.getInstance().doExsists(this.emailAddress, sessionMap);
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
}
