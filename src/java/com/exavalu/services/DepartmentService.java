/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Departments;
import static com.exavalu.services.AdminService.close;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author anich
 */
public class DepartmentService {

    /**
     *
     */
    public static DepartmentService departmentService = null;

    /**
     *
     */
    public static Logger log = Logger.getLogger(DepartmentService.class.getName());

    private DepartmentService() {
    }

    /**
     *
     * @return
     */
    public static synchronized DepartmentService getInstance() {
        if (departmentService == null) {
            departmentService= new DepartmentService();
        } 
            return departmentService;
        
    }

    /**
     *
     * Used to retrieve all the department and their details from the database
     * @return 
     */
    public List getAllDepartments() {
        ArrayList deptLIst = new ArrayList();
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {

             con = JDBCConnectionManager.getConnection();

            String sql = "Select * from departments";

             preparedStatement = con.prepareStatement(sql);

             rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Departments dept = new Departments();

                dept.setDepartmentId(rs.getString("departmentId"));
                dept.setDepartmentName(rs.getString("departmentName"));

                deptLIst.add(dept);

            }

        } catch (SQLException ex) {
            if (log.isEnabledFor(Level.ERROR)) {
                String errorMessage = "Error message: " + ex.getMessage() + " | Date: " + new Date();
                log.error(errorMessage);
            }
        }finally {

            close(rs, preparedStatement, con);
        }

        return deptLIst;
    }

}
