package com.school.admission.model;


import com.fasterxml.jackson.annotation.JsonManagedReference;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name = "admissionApplication")
public class AdmissionApplication {
    private Long admissionApplicationId;
    private Integer admissionYear;
    private Integer classId;
    private String firstName;
    private String lastName;
    private String father;
    private String mother;
    private String currentSchool;
    private String emailAddress;
    private String currentAddress;
    private String permanentAddress;
    private String gurdian;
    private String relationShipWithGuardian;
    private String latestExamResult;
    private String religion;
    private String gender;
    private String yearlyFamilyIncome;
    private Date dateOfBirth;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getAdmissionApplicationId() {
        return admissionApplicationId;
    }

    public void setAdmissionApplicationId(Long admissionApplicationId) {
        this.admissionApplicationId = admissionApplicationId;
    }

    public Integer getAdmissionYear() {
        return admissionYear;
    }

    public void setAdmissionYear(Integer admissionYear) {
        this.admissionYear = admissionYear;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFather() {
        return father;
    }

    public void setFather(String father) {
        this.father = father;
    }

    public String getMother() {
        return mother;
    }

    public void setMother(String mother) {
        this.mother = mother;
    }

    public String getCurrentSchool() {
        return currentSchool;
    }

    public void setCurrentSchool(String currentSchool) {
        this.currentSchool = currentSchool;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getCurrentAddress() {
        return currentAddress;
    }

    public void setCurrentAddress(String currentAddress) {
        this.currentAddress = currentAddress;
    }

    public String getPermanentAddress() {
        return permanentAddress;
    }

    public void setPermanentAddress(String permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    public String getGurdian() {
        return gurdian;
    }

    public void setGurdian(String gurdian) {
        this.gurdian = gurdian;
    }

    public String getRelationShipWithGuardian() {
        return relationShipWithGuardian;
    }

    public void setRelationShipWithGuardian(String relationShipWithGuardian) {
        this.relationShipWithGuardian = relationShipWithGuardian;
    }

    public String getLatestExamResult() {
        return latestExamResult;
    }

    public void setLatestExamResult(String latestExamResult) {
        this.latestExamResult = latestExamResult;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getYearlyFamilyIncome() {
        return yearlyFamilyIncome;
    }

    public void setYearlyFamilyIncome(String yearlyFamilyIncome) {
        this.yearlyFamilyIncome = yearlyFamilyIncome;
    }

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
