package com.school.accounting.model;


import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.school.login.model.Login;
import com.school.user.model.Student;
import org.hibernate.annotations.ForeignKey;

import javax.persistence.*;
import java.util.List;


@Entity
@Table(name = "salaryInfo")
public class SalaryInfo {
    private Integer userId;
    private Integer salary;
    private Login user;

    @Id
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    @OneToOne(fetch = FetchType.EAGER, targetEntity = Login.class)
    @JoinColumn(insertable = false, updatable = false, name = "userId", referencedColumnName = "userId")
    @ForeignKey(name="none")
    @JsonManagedReference
    public Login getUser() {
        return user;
    }

    public void setUser(Login user) {
        this.user = user;
    }
}
