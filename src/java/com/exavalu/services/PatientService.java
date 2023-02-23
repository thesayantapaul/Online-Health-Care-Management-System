/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Appointment;
import com.exavalu.models.Users;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.apache.log4j.Logger;

/**
 *
 * @author anich
 */
public class PatientService {

     public static PatientService patientService = null;
    public static Logger log = Logger.getLogger(PatientService.class.getName());

    private PatientService() {
    }

    public static PatientService getInstance() {
        if (patientService == null) {
            return new PatientService();
        } else {
            return patientService;
        }
    }

    public boolean insertPatient(Users user) {
        boolean result = false;

            Connection con = JDBCConnectionManager.getConnection();
            String sql = "INSERT INTO patients (patientFirstName,patientLastName, age, gender) VALUES (?, ?, ?, ?);";
           


        

        return result;
    }
}



