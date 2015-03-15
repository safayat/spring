package com.mkyong.util;

import com.google.gson.Gson;
import com.mkyong.login.model.Login;
import com.mkyong.user.model.Student;

/**
 * Created by safayat on 3/8/15.
 */
public class JsonStringToObjectConvereter {
    private static JsonStringToObjectConvereter jsonStringToObjectConvereter = null;
    private Gson gson;

    private JsonStringToObjectConvereter() {
        gson = new Gson();
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



}
