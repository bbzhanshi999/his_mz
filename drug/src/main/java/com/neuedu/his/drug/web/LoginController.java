package com.neuedu.his.drug.web;

import com.neuedu.his.common.bean.UserInfo;
import com.neuedu.his.drug.service.UserInfoRemoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class LoginController {

    @Autowired
    private UserInfoRemoteService userInfoRemoteService;


    @RequestMapping("/login")
    public UserInfo login(@RequestBody UserInfo userInfo, HttpSession session){
        //通过微服务的feign接口方式来获取global中提供的userInfo信息
        //1.获得数据
        UserInfo principal = userInfoRemoteService.find(userInfo);
        if(principal!=null){
            session.setAttribute("principal",principal);
        }

        return principal;
    }
}
