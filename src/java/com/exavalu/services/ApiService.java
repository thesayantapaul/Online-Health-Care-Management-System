/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Report;
import com.exavalu.utils.JDBCUtility;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author anich
 */
public class ApiService {

    /**
     *
     */
    public static ApiService apiService = null;

    /**
     *
     * @return
     */
    public static ApiService getInstance() {
        if (apiService == null) {
            return new ApiService();
        } else {
            return apiService;
        }
    }
    static int f = 0;

    /**
     *
     * Used to retrieve the list of medicine
     * from the 3rd party Api
     * @return 
     * @throws java.lang.Exception
     */
    public ArrayList getAllData() throws Exception {
        String apiUrl = "https://mocki.io/v1/59184e09-68a6-4e3f-a44a-6bc50682d7a8";

        URL obj = new URL(apiUrl);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        // optional default is GET
        con.setRequestMethod("GET");
        //add request header
        con.setRequestProperty("Accept", "application/json");
        int responseCode = con.getResponseCode();
        System.out.println("\nSending 'GET' request to URL : " + apiUrl);
        System.out.println("Response Code : " + responseCode);
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
        JSONParser parse = new JSONParser();
        while ((inputLine = in.readLine()) != null) {

            response.append(inputLine);
        }
        JSONObject jsonArray = (JSONObject) parse.parse(response.toString());
        System.out.println(jsonArray);
        System.out.println(jsonArray.size());
        ArrayList med = (ArrayList) jsonArray.get("drugs");
        System.out.println(med.size());
        return med;
    }

    /**
     *
     * @return
     * @throws Exception
     */
    public Report getReport() throws Exception {
        System.out.println("HI");
        JDBCUtility jdbcUtility = JDBCUtility.getInstanceOfJDBCUtility();
        String apiUrl = jdbcUtility.getPropertyValue("apiUrl");

        URL obj = new URL(apiUrl);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        // optional default is GET
        con.setRequestMethod("GET");
        //add request header
        con.setRequestProperty("Accept", "application/json");
        int responseCode = con.getResponseCode();
        System.out.println("\nSending 'GET' request to URL : " + apiUrl);
        System.out.println("Response Code : " + responseCode);
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
        int c = 0;
        JSONParser parse = new JSONParser();
        while ((inputLine = in.readLine()) != null) {

            response.append(inputLine);
        }
        Report report = new Report();
        System.out.println(response);
        JSONArray jsonArray = (JSONArray) parse.parse(response.toString());
        System.out.println(jsonArray.size());
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject myResponse = (JSONObject) jsonArray.get(i);
            System.out.print(myResponse.get("id"));
            if (f == 0) {
                report.setAlanin(Long.toString((long) myResponse.get("Alanin")));
                report.setName((String) myResponse.get("Name"));
                report.setHemoglobin(Long.toString((long) myResponse.get("Hemoglobin")));
                report.setWhite_blood(Long.toString((long) myResponse.get("White Blood Cells")));
                report.setRed_blood(Long.toString((long) myResponse.get("Red Blood Cells")));
                report.setSodium(Long.toString((long) myResponse.get("Sodium")));
                report.setPlatelets(Long.toString((long) myResponse.get("Platelets")));
                report.setNitrogen(Long.toString((long) myResponse.get("Blood urea nitrogen")));
                report.setPotassium(Long.toString((long) myResponse.get("Potassium")));
                report.setProtin(Long.toString((long) myResponse.get("Total Protin")));
                System.out.println("SENDING");
                f++;
                return report;
            }

        }

        in.close();

        //print in String
        return null;

    }
}
