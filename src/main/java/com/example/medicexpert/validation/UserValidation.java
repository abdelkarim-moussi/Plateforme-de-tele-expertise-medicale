package com.example.medicexpert.validation;

import com.example.medicexpert.util.exception.StringValidationException;

public class UserValidation {

    public static String emailValidator(String email){

        String pattern = "^[a-zA-Z-0-9%+_-]+@[a-zA-z0-9.-]+\\.[a-zAz-]{2,}$";
        String validatedEmail = "";

        try{

            if(email.matches(pattern)){
                validatedEmail = email;
            }else throw new StringValidationException("The provided email format not match roles (ex : example@gmail.com)");

        }catch (StringValidationException e){
            e.getMessage();
        }

        return validatedEmail;

    }

    public static String numberValidator(String number){
        String pattern = "^\\+0[0-9]{9}$";
        String validatedNumber = "";

        try{
            if(number.matches(pattern)){
                validatedNumber = number;
            }else throw new StringValidationException("The provided number doesn't match our roles (ex : 0612345678)");

        }catch (StringValidationException e){
            e.getMessage();
        }

        return validatedNumber;
    }

    public static String nameValidator(String name){
        String pattern = "^[a-zA-Z]{3}";
        String validatedName = "";

        try{
            if(name.matches(pattern)){
                validatedName = name;
            }else throw new StringValidationException("name must have at least 3 characters a-z or A-Z");

        } catch (StringValidationException e) {
            e.getMessage();
        }

        return validatedName;
    }
}
