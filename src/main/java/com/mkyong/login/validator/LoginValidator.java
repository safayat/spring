package com.mkyong.login.validator;

import com.mkyong.login.model.Login;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by safayat on 4/24/14.
 */
public class LoginValidator implements Validator {
    @Override
    public void validate(Object target, Errors errors) {

    }

    @Override
    public boolean supports(Class<?> clazz) {
        return Login.class.isAssignableFrom(clazz);
    }
}
