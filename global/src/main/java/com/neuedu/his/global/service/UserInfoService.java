package com.neuedu.his.global.service;

import com.neuedu.his.common.bean.UserInfo;
import com.neuedu.his.common.service.BaseService;
import com.neuedu.his.global.dao.UserInfoDao;
import org.springframework.stereotype.Service;

@Service
public class UserInfoService extends BaseService<UserInfo,UserInfoDao> {
}
