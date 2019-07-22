package com.neuedu.his.global.web;

import com.github.pagehelper.PageInfo;
import com.neuedu.his.common.bean.Dict;
import com.neuedu.his.common.web.BaseController;
import com.neuedu.his.global.dao.DictDao;
import com.neuedu.his.global.service.DictService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/dict")
public class DictController extends BaseController<Dict,DictService,DictDao> {

    @Override
    @RequestMapping("/findList")
    public List<Dict> findList(@RequestBody Dict conditon) {
        return super.findList(conditon);
    }

    @Override
    @RequestMapping("/page")
    public PageInfo<Dict> getPage(Dict conditon, Integer pageNum, Integer pageSize) {
        return super.getPage(conditon, pageNum, pageSize);
    }
}
