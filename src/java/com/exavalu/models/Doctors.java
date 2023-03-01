package com.exavalu.models;

import com.exavalu.services.DoctorService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

public class Doctors extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

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

        ArrayList appointmentList = DoctorService.getInstance().doViewAppointments(this.doctorId);

        if (appointmentList.size() > 0) {

            sessionMap.put("AppointmentListDoctor", appointmentList);
            result = "SUCCESS";
        }

        return result;

    }

    private String doctorFirstName;
    private String doctorLastName;

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

    public String getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    private String doctorId;
    private String departmentId;
    private String departmentName;
    private String doctorAge;
    private String doctorGender;

    public String getDoctorAge() {
        return doctorAge;
    }

    public void setDoctorAge(String doctorAge) {
        this.doctorAge = doctorAge;
    }

    public String getDoctorGender() {
        return doctorGender;
    }

    public void setDoctorGender(String doctorGender) {
        this.doctorGender = doctorGender;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String doViewHome() {
        String result="SUCCESS";
        String doctrId=(String) sessionMap.get("doctorId");
        ArrayList appointmentList = DoctorService.getInstance().doViewAppointments(doctrId);
        sessionMap.put("AppointmentListDoctor", appointmentList);
        String todayBooking = DoctorService.getInstance().doViewBookings("0", doctrId);
        String day1Booking = DoctorService.getInstance().doViewBookings("-1", doctrId);

        //graph data population booking or appointments------------------
        String day2Booking = DoctorService.getInstance().doViewBookings("-2", doctrId);
        String day3Booking = DoctorService.getInstance().doViewBookings("-3", doctrId);
        String day4Booking = DoctorService.getInstance().doViewBookings("-4", doctrId);
        String day5Booking = DoctorService.getInstance().doViewBookings("-5", doctrId);
        String day6Booking = DoctorService.getInstance().doViewBookings("-6", doctrId);

        if (day2Booking != null) {
            sessionMap.put("Day2Booking", day2Booking);
        } else {
            sessionMap.put("Day2Booking", "0");
        }
        if (day3Booking != null) {
            sessionMap.put("Day3Booking", day3Booking);
        } else {
            sessionMap.put("Day3Booking", "0");
        }
        if (day4Booking != null) {
            sessionMap.put("Day4Booking", day4Booking);
        } else {
            sessionMap.put("Day4Booking", "0");
        }
        if (day5Booking != null) {
            sessionMap.put("Day5Booking", day5Booking);
        } else {
            sessionMap.put("Day5Booking", "0");
        }
        if (day6Booking != null) {
            sessionMap.put("Day6Booking", day6Booking);
        } else {
            sessionMap.put("Day6Booking", "0");
        }

        //compare booking to show in dashboard
        if (todayBooking != null && day1Booking != null) {

            if (Integer.parseInt(todayBooking) >= Integer.parseInt(day1Booking)) {

                sessionMap.put("HigherOrLowerText", "Higher than yesterday");
                sessionMap.put("TodayBooking", todayBooking);
                sessionMap.put("IncreaseBooking", "increase");
                sessionMap.put("DecreaseBooking", null);

            } else {
                sessionMap.put("HigherOrLowerText", "Lower than yesterday");
                sessionMap.put("TodayBooking", todayBooking);
                sessionMap.put("DecreaseBooking", "decrease");
                sessionMap.put("IncreaseBooking", null);
            }
            sessionMap.put("Day1Booking", day1Booking);
        } else {
            sessionMap.put("HigherOrLowerText", "Higher than yesterday");
            sessionMap.put("TodayBooking", "0");
            sessionMap.put("Day1Booking", day1Booking);
        }
        String totalTodayRevenue = DoctorService.getInstance().doViewTotalRevenue("0", doctrId);
        String day1Revenue = DoctorService.getInstance().doViewTotalRevenue("-1", doctrId);

        //graph data population revenue--------------------------------------
        String day2Revenue = DoctorService.getInstance().doViewTotalRevenue("-2", doctrId);
        String day3Revenue = DoctorService.getInstance().doViewTotalRevenue("-3", doctrId);
        String day4Revenue = DoctorService.getInstance().doViewTotalRevenue("-4", doctrId);
        String day5Revenue = DoctorService.getInstance().doViewTotalRevenue("-5", doctrId);
        String day6Revenue = DoctorService.getInstance().doViewTotalRevenue("-6", doctrId);

        if (totalTodayRevenue != null) {
            sessionMap.put("TodayRevenue", totalTodayRevenue);
        } else {
            sessionMap.put("TodayRevenue", "0");
        }

        if (day1Revenue != null) {
            sessionMap.put("Day1Revenue", day1Revenue);
        } else {
            sessionMap.put("Day1Revenue", "0");
        }
        if (day2Revenue != null) {
            sessionMap.put("Day2Revenue", day2Revenue);
        } else {
            sessionMap.put("Day2Revenue", "0");
        }
        if (day3Revenue != null) {
            sessionMap.put("Day3Revenue", day3Revenue);
        } else {
            sessionMap.put("Day3Revenue", "0");
        }
        if (day4Revenue != null) {
            sessionMap.put("Day4Revenue", day4Revenue);
        } else {
            sessionMap.put("Day4Revenue", "0");
        }
        if (day5Revenue != null) {
            sessionMap.put("Day5Revenue", day5Revenue);
        } else {
            sessionMap.put("Day5Revenue", "0");
        }
        if (day6Revenue != null) {
            sessionMap.put("Day6Revenue", day6Revenue);
        } else {
            sessionMap.put("Day6Revenue", "0");
        }

        //compare revenue
        if (totalTodayRevenue != null && day1Revenue != null) {
            if (Integer.parseInt(totalTodayRevenue) >= Integer.parseInt(day1Revenue)) {
                sessionMap.put("HigherOrLowerTextRevenue", "Higher than yesterday");
                sessionMap.put("IncreaseRevenue", "increase");
                sessionMap.put("DecreaseRevenue", null);

            } else {
                sessionMap.put("TotalRevenue", totalTodayRevenue);
                sessionMap.put("HigherOrLowerTextRevenue", "Lower than yesterday");
                sessionMap.put("DecreaseRevenue", "decrease");
                sessionMap.put("IncreaseRevenue", null);
            }

        } else {

            sessionMap.put("HigherOrLowerTextRevenue", "Higher than yesterday");

        }
        return result;

    }

}
