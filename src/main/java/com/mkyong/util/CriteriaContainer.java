package com.mkyong.util;

import org.hibernate.criterion.Criterion;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by safayat on 9/24/2014.
 */
public class CriteriaContainer {
   List<Criterion> criterionList;

    private CriteriaContainer() {
        criterionList = new ArrayList<>();
    }

    public static CriteriaContainer get(){
        return new CriteriaContainer();
    }

    public List<Criterion> list() {
        return criterionList;
    }

    public CriteriaContainer add(Criterion criterion) {
        criterionList.add(criterion);
        return this;
    }
}
