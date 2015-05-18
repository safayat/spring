package com.mkyong.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.google.gson.Gson;
import com.mkyong.login.model.Login;
import com.mkyong.user.model.Student;

/**
 * Created by safayat on 3/8/15.
 */
public class JsonStringToObjectConvereter {
    private static JsonStringToObjectConvereter jsonStringToObjectConvereter = null;
    private Gson gson;
    private ObjectMapper objectMapper;
    private ObjectWriter ow;
    private JsonStringToObjectConvereter() {
        gson = new Gson();
        objectMapper = new HibernateAwareObjectMapper();
        ow = objectMapper.writer();
    }

    public static synchronized void createInstance(){
        if(jsonStringToObjectConvereter == null){
            jsonStringToObjectConvereter = new JsonStringToObjectConvereter();
        }
    }

    public static JsonStringToObjectConvereter getInstance(){
        if(jsonStringToObjectConvereter == null){
            createInstance();
        }
        return jsonStringToObjectConvereter;
    }

    public Object getObject(String jsonString, Class clazz){
        return gson.fromJson(jsonString, clazz);

    }

    public String objectToJson(Object ob) throws Exception{
        return ow.writeValueAsString(ob);

    }



}
