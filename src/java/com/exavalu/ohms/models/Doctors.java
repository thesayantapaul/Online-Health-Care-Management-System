/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.ohms.models;

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
public class Doctors extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

    private SessionMap<String, Object> sessionmap = (SessionMap<String, Object>) ActionContext.getContext().getSession();

    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();

    @Override
    public void setApplication(Map<String, Object> application) {
        setMap((ApplicationMap) application);
    }

    @Override
    public void setSession(Map<String, Object> session) {
        setSessionmap((SessionMap<String, Object>) (SessionMap) session);
    }
    
    private String doctorName;
    private String doctroId;
    private String departmentId;

    /**
     * @return the sessionmap
     */
    public SessionMap<String, Object> getSessionmap() {
        return sessionmap;
    }

    /**
     * @param sessionmap the sessionmap to set
     */
    public void setSessionmap(SessionMap<String, Object> sessionmap) {
        this.sessionmap = sessionmap;
    }

    /**
     * @return the map
     */
    public ApplicationMap getMap() {
        return map;
    }

    /**
     * @param map the map to set
     */
    public void setMap(ApplicationMap map) {
        this.map = map;
    }

    /**
     * @return the doctorName
     */
    public String getDoctorName() {
        return doctorName;
    }

    /**
     * @param doctorName the doctorName to set
     */
    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    /**
     * @return the doctroId
     */
    public String getDoctroId() {
        return doctroId;
    }

    /**
     * @param doctroId the doctroId to set
     */
    public void setDoctroId(String doctroId) {
        this.doctroId = doctroId;
    }

    /**
     * @return the departmentId
     */
    public String getDepartmentId() {
        return departmentId;
    }

    /**
     * @param departmentId the departmentId to set
     */
    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }
    

}
