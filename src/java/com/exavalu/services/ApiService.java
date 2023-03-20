/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Users;
import com.exavalu.utils.JDBCUtility;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
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
    public static synchronized ApiService getInstance() {
        if (apiService == null) {
            apiService = new ApiService();
        }
        return apiService;

    }

    /**
     *
     * Used to retrieve the list of medicine from the 3rd party Api
     *
     * @return
     * @throws java.lang.Exception
     */
    public List getAllData() throws Exception {
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
        ArrayList med;
        try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
            String inputLine;
            StringBuffer response = new StringBuffer();
            JSONParser parse = new JSONParser();
            while ((inputLine = in.readLine()) != null) {

                response.append(inputLine);
            }
            JSONObject jsonArray = (JSONObject) parse.parse(response.toString());
            System.out.println(jsonArray);
            System.out.println(jsonArray.size());
            med = (ArrayList) jsonArray.get("drugs");
            System.out.println(med.size());
        }
        return med;

    }

    /**
     *
     * @param user
     * @return @throws Exception
     */
    public boolean getPayment(Users user) throws Exception {
        JDBCUtility jdbcUtility = JDBCUtility.getInstanceOfJDBCUtility();
        String apiUrl = jdbcUtility.getPropertyValue("paymentUrl");

        String cardNumber[] = user.getCardNumber().split(" ");
        String cNumber = "";
        for (String cardNumber1 : cardNumber) {
            cNumber = cNumber + cardNumber1 + "-";
        }
        apiUrl = apiUrl + cNumber.substring(0, cNumber.length() - 1);
        URL obj = new URL(apiUrl);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        // optional default is GET
        con.setRequestMethod("GET");
        //add request header
        con.setRequestProperty("Accept", "application/json");
        int responseCode = con.getResponseCode();
        System.out.println("\nSending 'GET' request to URL : " + apiUrl);
        System.out.println("Response Code : " + responseCode);
        try (InputStreamReader in = new InputStreamReader(con.getInputStream())) {
            try (BufferedReader readData = new BufferedReader(in)) {
                String inputLine;
                StringBuilder response = new StringBuilder();
                JSONParser parse = new JSONParser();
                while ((inputLine = readData.readLine()) != null) {

                    response.append(inputLine);
                }
                JSONArray jsonArray = (JSONArray) parse.parse(response.toString());
                System.out.println(jsonArray.size());
                if(jsonArray.isEmpty()){
                    return false;
                }
                JSONObject myResponse = (JSONObject) jsonArray.get(0);
                if (myResponse.get("CVV").equals(user.getCardCvv())) {
                    System.out.println("verified");
                }
                return true;
            }
        }
    }
}
