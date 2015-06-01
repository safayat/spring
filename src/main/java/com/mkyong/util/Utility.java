package com.mkyong.util;

import org.springframework.http.HttpRequest;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.security.SecureRandom;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

/**
 * Created by safayat on 1/7/15.
 */
public class Utility {
   public static final  Format formatter = new SimpleDateFormat("yyyy-MM-dd");
   public static final SimpleDateFormat simpleDateformatter = new SimpleDateFormat("dd/MM/yyyy");

   public static Date toDate(String dateString){
       if(dateString!=null && dateString.isEmpty()==false){
           try{
               return simpleDateformatter.parse(dateString);
           }catch (Exception e){
               e.printStackTrace();
           }
       }
        return null;

   }
   public static String getUniqueKey(){
       Random r = new SecureRandom();
       byte[] b = new byte[16];
       r.nextBytes(b);
       String s = org.apache.commons.codec.binary.Base64.encodeBase64String(b);

       return s.substring(0, 16).replace("+","p");
   }
   public static int  getCurrentDateInfo(int param){
      Calendar calendar = Calendar.getInstance();
      calendar.setTime(new Date());
      return calendar.get(param);
   }

    public static String convertMinutesToHourAndMinutes(int minutes){
        String h = minutes/60 + "";
        String m = minutes%60 + "";
        System.out.println("h:" + h + " m:" + m);
        if(h.length()<2)h="0"+h;
        if(m.length()<2)m=m+"0";
        return h + " : " + m;
    }

   public static void main(String[] args){
       SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
       try {

           formatter.parse("");
       }catch (Exception e){

       }

   }

}
