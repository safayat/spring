package com.mkyong.profile.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by safayat on 4/24/14.
 */
@Entity
@Table(name = "profile")
public class Profile implements Serializable{

    private int profileId;
    private String firstName;
    private String lastName;
    private String mobileNo;
    private Date dateOfBirth;
  public Profile() {
		// TODO Auto-generated constructor stub
  }

    @Column(name = "dateOfBirth",nullable = true)
    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    @Column(name = "mobileNo",nullable = true,length = 20)
    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    @Column(name = "lastName",nullable = true,length = 64)
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Column(name = "firstName",nullable = true,length = 64)
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    @Id
    @Column(name = "profileId",unique = true,nullable = false)
    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }

    @Override
    public String toString() {
        return "Profile{" +
                "profileId=" + profileId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", mobileNo='" + mobileNo + '\'' +
                ", dateOfBirth='" + dateOfBirth + '\'' +
                '}';
    }
}
