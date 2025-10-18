package com.example.medicexpert.service;

import com.example.medicexpert.dao.SpecialityDao;
import com.example.medicexpert.entity.Speciality;

import java.util.List;

public class SpecialityService {

    private SpecialityDao specialityDao;

    public SpecialityService(SpecialityDao specialityDao){
        this.specialityDao = specialityDao;
    }

    public List<Speciality> getAllSpecialities(){

        List<Speciality> specialities = specialityDao.findAll();

        return specialities;
    }
}
