package com.neuedu.his.drug.service;

import com.neuedu.his.common.bean.UserInfo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@FeignClient(name="global",fallback = UserInfoFallback.class)
public interface UserInfoRemoteService {

    //将{useranme：password}条件发给 global，global提供数据给drug
    @RequestMapping(value = "/user/find",method = RequestMethod.POST)
    UserInfo find(UserInfo userInfo);

}
