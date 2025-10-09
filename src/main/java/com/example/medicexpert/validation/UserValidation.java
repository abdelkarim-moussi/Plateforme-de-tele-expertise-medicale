package com.example.medicexpert.validation;

public class UserValidation {

    public static Boolean isValidEmail(String email){

        String pattern = "^[a-zA-Z-0-9%+_-]+@[a-zA-z0-9.-]+\\.[a-zA-Z]{2,}$";

        if(email == null) return false;
        return email.matches(pattern);

    }

    public static Boolean isValidPhone(String phone){
        String pattern = "^\\+0[0-9]{9}$";

        if(phone == null) return false;
        return phone.matches(pattern);
    }

    public static Boolean isValidName(String name){

        String pattern = "^[a-zA-Z]{3}";

        if(name == null) return false;
        return name.matches(pattern);
    }
}
