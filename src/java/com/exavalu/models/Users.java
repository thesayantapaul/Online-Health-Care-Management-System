/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.AppointmentService;
import com.exavalu.services.DepartmentService;
import com.exavalu.services.LoginService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
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

    public String getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    public String getPatientId() {
        return patientId;
    }

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

    public String doLogin() {
        String result = "FAILURE";
        boolean success = LoginService.getInstance().doLogin(this);

        if (success) {
            if (this.roleId.equals("1")) {
                result = "SUCCESS";
            }
            if (this.roleId.equals("2")) {
                result = "SUCCESS";
            }
            if (this.roleId.equals("3")) {
                result = "ADMININDEX";
            }
            
            sessionMap.put("Loggedin", this);
            System.out.println(DepartmentService.getInstance().getAllDepartments());
            System.out.println(this.roleId);

        }
        return result;
    }

    public String doLogout() throws Exception {
        String result = "FAILURE";
        sessionMap.clear();
        if (sessionMap.isEmpty()) {
            result = "SUCCESS";
        }
        return result;

    }

    public String doSignUp() throws Exception {
        String result = "FAILURE";
        boolean success = LoginService.getInstance().doSignUp(this);

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

            sessionMap.put("SuccessSignUp", "Successfully Registered");
            sessionMap.put("SignedUp", this);

        } else {
            sessionMap.put("FailSignUp", "Email All Ready Exsists");
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

}
