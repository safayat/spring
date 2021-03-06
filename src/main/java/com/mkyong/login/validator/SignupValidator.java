package com.mkyong.login.validator;

import com.mkyong.login.model.Login;
import com.mkyong.util.ApplicationConstants;
import org.springframework.validation.Errors;
import com.mysql.jdbc.StringUtils;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by safayat on 4/24/14.
 */
public class SignupValidator implements Validator {


    @Override
    public void validate(Object target, Errors errors) {
        Login login = (Login)target;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username",
                "required.username","default msg for user");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"password",
                "required.password","default msg for pass");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email",
                "required.email", "default msg for email");

        if(!StringUtils.isNullOrEmpty(login.getEmail())){
            if(!login.getEmail().matches(ApplicationConstants.EMAIL_REGEX)){
                errors.rejectValue("email","required.invalidEmail");
            }
        }

        if(!StringUtils.isNullOrEmpty(login.getPassword())){
            if(!login.getPassword().equals(login.getConfirmPassword())){
                errors.rejectValue("password","required.passwordMissmatch");
            }
        }

    }

    @Override
    public boolean supports(Class<?> clazz) {
        return Login.class.isAssignableFrom(clazz);
    }
}
