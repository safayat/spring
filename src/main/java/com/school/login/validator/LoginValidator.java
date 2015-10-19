package com.school.login.validator;

import com.school.login.model.Login;
import com.school.util.ApplicationConstants;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by safayat on 4/24/14.
 */
public class LoginValidator implements Validator {


    @Override
    public void validate(Object target, Errors errors) {
        Login login = (Login)target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username",
                "required.username","default msg for user");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"password",
                "required.password","default msg for pass");
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return Login.class.isAssignableFrom(clazz);
    }
}
