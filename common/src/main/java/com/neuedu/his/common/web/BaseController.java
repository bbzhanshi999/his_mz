package com.neuedu.his.common.web;

import com.github.pagehelper.PageInfo;
import com.neuedu.his.common.bean.BaseBean;
import com.neuedu.his.common.dao.BaseDao;
import com.neuedu.his.common.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BaseController<T extends BaseBean, S extends BaseService<T, D>, D extends BaseDao<T>> {

    @Autowired
    protected S service;

    public void insert(T t) {
        service.insert(t);
    }

    public void insertBatch(List<T> list){
        service.insertBatch(list);
    }

    public void update(T t) {
        service.update(t);
    }

    public void delete(T t){
        service.delete(t);
    }

    public void deleteById(String id){
        service.deleteById(id);
    }

    public T findById(String id){
        return service.findById(id);
    }

    public T find(T conditon){
        return service.find(conditon);
    }

    public List<T> findList(T conditon){
        return service.findList(conditon);
    }

    public List<T> findAll(){
        return service.findAll();
    }

    public PageInfo<T> getPage(T conditon,Integer pageNum,Integer pageSize){
        return service.getPage(conditon,pageNum,pageSize);
    }

    public void save(T t){
        service.save(t);
    }

}
