package com.neuedu.his.global.interceptors;

import com.neuedu.his.common.bean.UserInfo;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthInterceptor implements HandlerInterceptor {

    /**
     * 登录权限验证
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //拿到session
        HttpSession session = request.getSession();
        UserInfo userInfo = (UserInfo) session.getAttribute("principal");

        //如果session中包含userinfo，那么代表登录成功
        if(userInfo!=null){
            return true;
        }

        //如果没有登录。我们将状态码设置为403：设置返回数据为403：access denied
        response.setStatus(403);
        response.getWriter().write("access denied");
        return false;
    }
}
