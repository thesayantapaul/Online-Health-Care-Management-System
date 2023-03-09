/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.AppointmentService;
import com.exavalu.services.DoctorService;
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
public class Prescription extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

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

    private String medicine;
    private String dosage;
    private String time;
    private String tests;
    private String advice;
    private String date;
    private String appointmentId;
    private String patientId;
    private String doctorId;
    private String status;
    private String symptoms;
    private String patientFirstName;
    private String patientLastName;
    private String emailAddress;
    private String userId;
    private String doctorFirstName;
    private String doctorLastName;
    private String departmentName;

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

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
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

    public String getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(String appointmentId) {
        this.appointmentId = appointmentId;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    public String getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMedicine() {
        return medicine;
    }

    public void setMedicine(String medicine) {
        this.medicine = medicine;
    }

    public String getDosage() {
        return dosage;
    }

    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTests() {
        return tests;
    }

    public void setTests(String tests) {
        this.tests = tests;
    }

    public String getAdvice() {
        return advice;
    }

    public void setAdvice(String advice) {
        this.advice = advice;
    }

    public String doPrescribe() {
        String result = "FALIURE";
        System.out.println("advice" + this.advice);
        System.out.println(this.tests);

        System.out.println(this.time);
        System.out.println(this.dosage);

        System.out.println(this.medicine);
        System.out.println(this.doctorId);
        System.out.println(this.appointmentId);
        System.out.println(this.patientId);
        System.out.println(this.date);
        System.out.println(this.userId);

        boolean success = PrescriptionService.getInstance().addPrescription(this);
        ArrayList prescribedList = PrescriptionService.getInstance().getPrescription(this.doctorId);
        if (success) {
            AppointmentService.getInstance().updateStatus(this.appointmentId);
            ArrayList pendingprescribList = DoctorService.getInstance().doViewtodayAppointments("0", this.doctorId);
            sessionMap.put("DoctorAppointmentListDashBoard", pendingprescribList);
            result = "SUCCESS";
            sessionMap.put("PreviousPrescription", prescribedList);
        }

        return result;
    }
    public String getPatientPrescription() {
        String result = "FALIURE";

        System.out.println(this.appointmentId);
        Prescription prescription = PrescriptionService.getInstance().getParticularPrescription(this.appointmentId);
        if (prescription!=null) {

            sessionMap.put("Prescription", prescription);
            result = "SUCCESS";
        }

        return result;
    }

}
