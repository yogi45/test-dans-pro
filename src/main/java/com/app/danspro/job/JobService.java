package com.app.danspro.job;

import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;
import com.google.gson.GsonBuilder;

@Service
public class JobService {

   public Map[] getlistJob(){
	   
	   Map[] map = null;
	   
	   CloseableHttpClient client = HttpClients.createDefault();
       HttpGet httpget = new HttpGet("http://dev3.dansmultipro.co.id/api/recruitment/positions.json");
       
       httpget.setHeader("Accept", "application/json");
       httpget.setHeader("Accept", "application/json");
       httpget.setHeader("Content-type", "application/json");

       try (CloseableHttpClient httpClient = HttpClients.createDefault();
            CloseableHttpResponse rspn = httpClient.execute(httpget)) {

           HttpEntity entity = rspn.getEntity();
           if (entity != null) {
               String json = EntityUtils.toString(rspn.getEntity());
               GsonBuilder gson = new GsonBuilder();
               map = gson.create().fromJson(json,Map[].class);
           }
           client.close();
           return map;
       }catch (Exception e) {
    	   return map;
       }
	   
   }
   
   public Map getDetailJob(String id){
	   
	   Map map = null;
	   
	   CloseableHttpClient client = HttpClients.createDefault();
       HttpGet httpget = new HttpGet("http://dev3.dansmultipro.co.id/api/recruitment/positions/"+id);
       
       httpget.setHeader("Accept", "application/json");
       httpget.setHeader("Accept", "application/json");
       httpget.setHeader("Content-type", "application/json");

       try (CloseableHttpClient httpClient = HttpClients.createDefault();
            CloseableHttpResponse rspn = httpClient.execute(httpget)) {

           HttpEntity entity = rspn.getEntity();
           if (entity != null) {
               String json = EntityUtils.toString(rspn.getEntity());
               GsonBuilder gson = new GsonBuilder();
               map = gson.create().fromJson(json,Map.class);
               
           }
           client.close();
           return map;
       }catch (Exception e) {
    	   return map;
       }
	   
   }

}
