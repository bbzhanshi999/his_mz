package com.neuedu.his.common.bean;

import lombok.Data;

@Data
public class UserInfo extends BaseBean {


    private String username;
    private String password;
    private Employee employee;
}
