package com.school.user.validator;

import com.school.login.validator.SignupValidator;
import com.school.user.model.Student;
import com.school.user.model.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.*;

/**
 * Created by safayat on 4/24/14.
 */
@Component
public class StudentValidator implements Validator {
    @Autowired
    SignupValidator signupValidator;
    @Override
    public void validate(Object target, Errors errors) {
        Student student = (Student)target;
        if(student.getUserId() == 0)
            SignupValidator.signupValidate(student, errors);
        if(errors.hasErrors())return;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "classId",
                "required.className","default msg for user");
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return Teacher.class.isAssignableFrom(clazz);
    }
}
