/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.ApiService;
import com.exavalu.services.PrescriptionService;
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
public class Report extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

    private String name;
    private String alanin;
    private String sodium;
    private String platelets;
    private String potassium;
    private String hemoglobin;
    private String protin;
    private String red_blood;
    private String white_blood;
    private String nitrogen;

    /**
     *
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     *
     * @return
     */
    public String getAlanin() {
        return alanin;
    }

    /**
     *
     * @param alanin
     */
    public void setAlanin(String alanin) {
        this.alanin = alanin;
    }

    /**
     *
     * @return
     */
    public String getSodium() {
        return sodium;
    }

    /**
     *
     * @param sodium
     */
    public void setSodium(String sodium) {
        this.sodium = sodium;
    }

    /**
     *
     * @return
     */
    public String getPlatelets() {
        return platelets;
    }

    /**
     *
     * @param platelets
     */
    public void setPlatelets(String platelets) {
        this.platelets = platelets;
    }

    /**
     *
     * @return
     */
    public String getPotassium() {
        return potassium;
    }

    /**
     *
     * @param potassium
     */
    public void setPotassium(String potassium) {
        this.potassium = potassium;
    }

    /**
     *
     * @return
     */
    public String getHemoglobin() {
        return hemoglobin;
    }

    /**
     *
     * @param hemoglobin
     */
    public void setHemoglobin(String hemoglobin) {
        this.hemoglobin = hemoglobin;
    }

    /**
     *
     * @return
     */
    public String getProtin() {
        return protin;
    }

    /**
     *
     * @param protin
     */
    public void setProtin(String protin) {
        this.protin = protin;
    }

    /**
     *
     * @return
     */
    public String getRed_blood() {
        return red_blood;
    }

    /**
     *
     * @param red_blood
     */
    public void setRed_blood(String red_blood) {
        this.red_blood = red_blood;
    }

    /**
     *
     * @return
     */
    public String getWhite_blood() {
        return white_blood;
    }

    /**
     *
     * @param white_blood
     */
    public void setWhite_blood(String white_blood) {
        this.white_blood = white_blood;
    }

    /**
     *
     * @return
     */
    public String getNitrogen() {
        return nitrogen;
    }

    /**
     *
     * @param nitrogen
     */
    public void setNitrogen(String nitrogen) {
        this.nitrogen = nitrogen;
    }

    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    /**
     *
     * @return
     */
    public SessionMap<String, Object> getSessionMap() {
        return sessionMap;
    }

    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();

    /**
     *
     * @param application
     */
    @Override
    public void setApplication(Map<String, Object> application) {
        map = (ApplicationMap) application;
    }

    /**
     *
     * @param session
     */
    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    /**
     *
     * @return
     * @throws Exception
     */
    public String getReport() throws Exception {
        String result = "SUCCESS";
        System.out.println("Report");
        Report report = ApiService.getInstance().getReport();
        System.out.print(report.getName());
        if (report != null) {

            sessionMap.put("Report", report);
            result = "SUCCESS";
            System.out.print(sessionMap);
       }

        return result;
    }
}
