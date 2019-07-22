package com.neuedu.his.drug;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients //运行当前项目利用feign来对其他服务进行接口式调用
public class DrugApplication {


    public static void main(String[] args) {
        SpringApplication.run(DrugApplication.class,args);
    }
}
