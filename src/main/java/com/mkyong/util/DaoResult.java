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
    }

    public void setValues(boolean isSuccessful, String message, int status) {
        this.message = message;
        this.isSuccessful = isSuccessful;
        this.status = status;
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
