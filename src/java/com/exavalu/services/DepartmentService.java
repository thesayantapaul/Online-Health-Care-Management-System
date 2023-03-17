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
import java.time.LocalDateTime;
import java.util.ArrayList;
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
    public static DepartmentService getInstance() {
        if (departmentService == null) {
            return new DepartmentService();
        } else {
            return departmentService;
        }
    }

    /**
     *
     * Used to retrieve all the department and their details from the database
     * @return 
     */
    public ArrayList getAllDepartments() {
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
            int e = ex.getErrorCode();
            log.error(LocalDateTime.now() + "Sql Error :" + e + "Error in getting departments");
            System.out.println(LocalDateTime.now() + "Sql Error :" + e + "Error in getting departments");
        }finally {

            close(rs, preparedStatement, con);
        }

        return deptLIst;
    }

}
