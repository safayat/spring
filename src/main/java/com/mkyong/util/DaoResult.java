package com.mkyong.util;

/**
 * Created by safayat on 9/24/2014.
 */
public class DaoResult {
    public static final int VALIDATION_ERROR=2;
    public static final int EXCEPTION=3;
    public static final int DONE=1;
    private String message;
    private boolean isSuccessful ;
    private int status;

    public DaoResult() {
        message = "operation successfule";
        isSuccessful = true;
        status = 1;
    }

    public DaoResult setValues(boolean isSuccessful, String message, int status) {
        this.message = message;
        this.isSuccessful = isSuccessful;
        this.status = status;
        return this;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isSuccessful() {
        return isSuccessful;
    }

    public void setSuccessful(boolean isSuccessful) {
        this.isSuccessful = isSuccessful;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "DaoResult{" +
                "message='" + message + '\'' +
                ", isSuccessful=" + isSuccessful +
                ", status='" + status + '\'' +
                '}';
    }
}
