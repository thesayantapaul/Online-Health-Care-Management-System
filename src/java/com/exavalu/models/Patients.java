/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

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
 * @author SAYANTA PAUL
 */
public class Patients extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

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
     *
     * Used to retrieve the user's medical history.
     *
     * @return
     */
    public String doViewParticularMedicalHistory() {
        String result = "FAILURE";
        ArrayList appointment = new ArrayList();
        Users patient = (Users) sessionMap.get("Loggedin");
        System.out.println("this is patiend id :" + patient.getUserId());

        appointment = PatientService.doViewParticularMedicalHistory(patient.getUserId());
        if (appointment != null) {
            sessionMap.put("PatientMedicalHistory", appointment);
            result = "SUCCESS";
        }
        return result;
    }

    /**
     *
     * Used to retrieve user's upcoming appointment.
     *
     * @return
     */
    public String doViewParticularUpcomingAppointments() {
        String result = "FAILURE";
        ArrayList appointment = new ArrayList();
        Users patient = (Users) sessionMap.get("Loggedin");
        System.out.println("this is patiend id :" + patient.getUserId());

        appointment = PatientService.doViewParticularUpcomingAppointments(patient.getUserId());
        if (appointment != null) {
            sessionMap.put("PatientUpcomingBooking", appointment);
            result = "SUCCESS";
        }
        return result;
    }

    private String patientId;
    private String patientFirstName;
    private String patientLastName;
    private String age;
    private String gender;
    private String appointmentId;
    private String address;
    private String dateOfRegisteration;

    /**
     *
     * @return
     */
    public String getAddress() {
        return address;
    }

    /**
     *
     * @param address
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     *
     * @return
     */
    public String getDateOfRegisteration() {
        return dateOfRegisteration;
    }

    /**
     *
     * @param dateOfRegisteration
     */
    public void setDateOfRegisteration(String dateOfRegisteration) {
        this.dateOfRegisteration = dateOfRegisteration;
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

    /**
     * @return the patientFirstName
     */
    public String getPatientFirstName() {
        return patientFirstName;
    }

    /**
     * @param patientFirstName the patientFirstName to set
     */
    public void setPatientFirstName(String patientFirstName) {
        this.patientFirstName = patientFirstName;
    }

    /**
     * @return the patientLastName
     */
    public String getPatientLastName() {
        return patientLastName;
    }

    /**
     * @param patientLastName the patientLastName to set
     */
    public void setPatientLastName(String patientLastName) {
        this.patientLastName = patientLastName;
    }

    /**
     * @return the age
     */
    public String getAge() {
        return age;
    }

    /**
     * @param age the age to set
     */
    public void setAge(String age) {
        this.age = age;
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
}
