package com.neuedu.his.drug.service;

import com.neuedu.his.common.bean.UserInfo;
import org.springframework.stereotype.Component;

@Component
public class UserInfoFallback implements  UserInfoRemoteService{


    @Override
    public UserInfo find(UserInfo userInfo) {
        return null;
    }
}
