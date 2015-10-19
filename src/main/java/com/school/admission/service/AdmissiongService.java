package com.school.admission.service;

import com.school.admission.dao.AdmissionDAO;
import com.school.admission.model.AdmissionApplication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by safayat on 2/3/15.
 */

@Service
public class AdmissiongService {
    @Autowired
    AdmissionDAO admissionDAO;

    @Transactional
    public void  saveOrUpdate(AdmissionApplication admissionApplication){
        try{
            admissionDAO.saveOrUpdate(admissionApplication);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Transactional
    public List<AdmissionApplication> getAll(){
        return admissionDAO.getAll(AdmissionApplication.class);
    }

}
