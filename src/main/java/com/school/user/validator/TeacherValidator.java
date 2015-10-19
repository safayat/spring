package com.school.user.validator;

import com.school.login.model.Login;
import com.school.login.validator.SignupValidator;
import com.school.user.model.Teacher;
import com.school.util.ApplicationConstants;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by safayat on 4/24/14.
 */
@Component
public class TeacherValidator implements Validator {
    @Override
    public void validate(Object target, Errors errors) {
        Teacher teacher = (Teacher)target;
        if(teacher.getUserId() == 0)
            SignupValidator.signupValidate(teacher, errors);
        if(errors.hasErrors())return;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "joiningDate",
                "required.joiningDate","default msg for user");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "destination",
                "required.destination","default msg for user");

    }

    @Override
    public boolean supports(Class<?> clazz) {
        return Teacher.class.isAssignableFrom(clazz);
    }
}
