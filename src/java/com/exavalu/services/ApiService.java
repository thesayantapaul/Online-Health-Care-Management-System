/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
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
        ArrayList med;
        try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
            String inputLine;
            StringBuffer response = new StringBuffer();
            JSONParser parse = new JSONParser();
            while ((inputLine = in.readLine()) != null) {
                
                response.append(inputLine);
            }   JSONObject jsonArray = (JSONObject) parse.parse(response.toString());
            System.out.println(jsonArray);
            System.out.println(jsonArray.size());
            med = (ArrayList) jsonArray.get("drugs");
            System.out.println(med.size());
        }
        return med;
        
    }

}
