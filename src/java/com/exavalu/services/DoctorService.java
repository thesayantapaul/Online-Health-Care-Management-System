/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Departments;
import com.exavalu.models.Doctors;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import org.apache.log4j.Logger;

/**
 *
 * @author anich
 */
public class DoctorService {

    public static DoctorService doctorService = null;
    public static Logger log = Logger.getLogger(DoctorService.class.getName());

    private DoctorService() {
    }

    public static DoctorService getInstance() {
        if (doctorService == null) {
            return new DoctorService();
        } else {
            return doctorService;
        }
    }

    public ArrayList getAllDoctors(String departmentId) {
        ArrayList deptLIst = new ArrayList();
        try {

            Connection con = JDBCConnectionManager.getConnection();

            String sql = "Select * from doctors where departmentId=?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, departmentId);

            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Doctors doctors = new Doctors();

                doctors.setDoctorId(rs.getString("doctorId"));
                doctors.setDoctorFirstName(rs.getString("doctorFirstName"));
                doctors.setDoctorLastName(rs.getString("doctorLastName"));

                deptLIst.add(doctors);

            }

        } catch (SQLException ex) {
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + "Error in getting Doctors");
            System.out.println(LocalDateTime.now() + "Sql Error :" + e + "Error in getting Doctors");
        }

        return deptLIst;
    }

}
