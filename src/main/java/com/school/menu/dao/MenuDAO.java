package com.school.menu.dao;

import com.school.common.dao.impl.CommonDaoImpl;
import com.school.menu.model.Menu;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by safayat on 2/3/15.
 */
@Repository
public class MenuDAO extends CommonDaoImpl {
    public List<Menu> getAllMenu(){
        return getAllWithOpenSession(Menu.class);
    }


}
