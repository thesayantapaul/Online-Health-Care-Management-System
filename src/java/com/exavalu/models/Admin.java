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
            ArrayList deptList = DepartmentService.getInstance().getAllDepartments();
            ArrayList statusList = StatusService.getAllStatus();
            sessionMap.put("DeptList", deptList);
            sessionMap.put("StatusList", statusList);
            sessionMap.put("appointment", appointment);
            System.out.println("appointmentdate= "+appointment.getAppointmentDate());
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
            sessionMap.put("Appointments", doctorList);
            result = "SUCCESS";

        }
        return result;
    }

    private String messageToPatient;
    private String appointmentId;
    private String firstName;
    private String lastName;
    private String gender;
    private String departmentName;
    private String doctorId;
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
