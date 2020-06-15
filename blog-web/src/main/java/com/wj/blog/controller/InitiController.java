package com.wj.blog.controller;

import com.wj.blog.common.domain.WebInfo;
import com.wj.blog.service.BlogService;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("config")
public class InitiController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private ServletContext context;

    @RequestMapping("/initi")
    public String initi(HttpServletRequest request){
        WebInfo webInfo = blogService.getWebInfo();
        /* 换算运行时间 转换为天数 */
        Date nowDate = new Date();
        Date startDate = (Date) context.getAttribute("runTime");
        Long runTimeLong =  nowDate.getTime() - startDate .getTime();
        long runTime = runTimeLong/86400000;
        webInfo.setServerRunTime(runTime);
        webInfo.setBrowseTotal((Long) context.getAttribute("browseCount"));
        request.setAttribute("webInfo",webInfo);
        return "index";
    }
}
