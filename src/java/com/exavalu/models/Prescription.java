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


    /**
     *
     * @param application
     */
    @Override
    public void setApplication(Map<String, Object> application) {
    }

    /**
     *
     * @param session
     */
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

    /**
     *
     * @return
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     *
     * @param emailAddress
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
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
    public String getSymptoms() {
        return symptoms;
    }

    /**
     *
     * @param symptoms
     */
    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    /**
     *
     * @return
     */
    public String getDate() {
        return date;
    }

    /**
     *
     * @param date
     */
    public void setDate(String date) {
        this.date = date;
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
    public String getMedicine() {
        return medicine;
    }

    /**
     *
     * @param medicine
     */
    public void setMedicine(String medicine) {
        this.medicine = medicine;
    }

    /**
     *
     * @return
     */
    public String getDosage() {
        return dosage;
    }

    /**
     *
     * @param dosage
     */
    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

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
    public String getTests() {
        return tests;
    }

    /**
     *
     * @param tests
     */
    public void setTests(String tests) {
        this.tests = tests;
    }

    /**
     *
     * @return
     */
    public String getAdvice() {
        return advice;
    }

    /**
     *
     * @param advice
     */
    public void setAdvice(String advice) {
        this.advice = advice;
    }

    /**
     * doPrescribe used by the doctor to prescribe the
     * medicine,timing,dosage,test etc.
     * @return
     */
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

    /**
     * used to retrieve a particular prescription data from the BackEnd.
     * @return 
     */
    public String getPatientPrescription() {
        String result = "FAILURE";

        System.out.println(this.appointmentId);
        Prescription prescription = PrescriptionService.getInstance().getParticularPrescription(this.appointmentId);

//        System.out.println(med[0]);
//        System.out.println(med[1]);
        //System.out.println(prescription.getMedicine());

        if (prescription != null) {
            //System.out.println("hellow from if prescription is null");
            String[] med = prescription.getMedicine().split(",");
            String[] dos = prescription.getDosage().split(",");
            String[] tim = prescription.getTime().split(",");

            sessionMap.put("Prescription", prescription);
            sessionMap.put("Med", med);

            sessionMap.put("Dos", dos);
            sessionMap.put("Times", tim);
            System.out.println("sessionmap from prescription = " + sessionMap);

            result = "MODAL";
        }

        return result;
    }

}
