package com.neuedu.his.global.web;

import com.github.pagehelper.PageInfo;
import com.neuedu.his.common.bean.Department;
import com.neuedu.his.common.web.BaseController;
import com.neuedu.his.global.dao.DepartmentDao;
import com.neuedu.his.global.service.DepartmentService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/department")
public class DepartmentController extends BaseController<Department,DepartmentService,DepartmentDao> {

    //alt+insert 快速覆盖函数，创建构造函数，get set方法 toString equal hashCode

    @Override
    @RequestMapping("list") //url:/api/global/department/list
    public List<Department> findList(@RequestBody Department conditon) {
        return super.findList(conditon);
    }

    @Override
    @RequestMapping("page") //url:/api/global/department/page
    public PageInfo<Department> getPage(Department conditon, Integer pageNum, Integer pageSize) {
        return super.getPage(conditon, pageNum, pageSize);
    }
}
