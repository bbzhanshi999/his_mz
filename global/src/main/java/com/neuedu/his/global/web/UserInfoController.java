package com.neuedu.his.global.web;

import com.neuedu.his.common.bean.UserInfo;
import com.neuedu.his.common.web.BaseController;
import com.neuedu.his.global.dao.UserInfoDao;
import com.neuedu.his.global.service.UserInfoService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class UserInfoController extends BaseController<UserInfo, UserInfoService,UserInfoDao> {

    /**
     * 登录判断，如果登录成果，将对象放入session，并且向前台返回{status：success}
     * @param userInfo
     * @return
     */
    @PostMapping("/login")
    public UserInfo login(@RequestBody UserInfo userInfo, HttpSession session){
        UserInfo principal = service.find(userInfo);
        //判断principal是否为空，不为空代表登录成功
        if(principal!=null){
            //将principal存入session域
            session.setAttribute("principal",principal);
            return principal;
        }
        return null;
    }
}
