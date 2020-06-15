package com.wj.blog.controller;

import cn.itcast.commons.CommonUtils;
import com.sun.mail.smtp.SMTPAddressFailedException;
import com.wj.blog.common.domain.User;
import com.wj.blog.common.domain.UserException;
import com.wj.blog.common.utils.IdGenerator;
import com.wj.blog.common.utils.RSAUtils;
import com.wj.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.PublicKey;
import java.security.interfaces.RSAPublicKey;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

@Controller
@RequestMapping("/user")
public class UserController {

    //注入用户服务
    @Autowired
    UserService userService  ;

    /**
     * 用户退出
     * @param req
     */
    @RequestMapping("exit")
    @ResponseBody
    public Object exit(HttpServletRequest req) {
        Map<String,Object> map = new HashMap<>();
        try {
            //清楚session中保存的用户信息 实现用户退出
            req.getSession().invalidate();
            map.put("result", true);
        } catch (Exception e) {
            map.put("result", false);
            e.printStackTrace();
        }finally {
            return map;
        }
    }

    /**
     * 注册用户时 检查用户名是否已经存在
     * @param userName 注册的用户名
     */
    @RequestMapping("checkName")
    @ResponseBody
    public Object checkName(String userName) {
        Map<String,Boolean> map = new HashMap<>();
        boolean result = true;
        try {
          result = checkNamePvt(userName);
        }catch (Exception e){
            result =false;
        }finally {
            map.put("valid", result);
            return map;
        }
    }

    /**
     * 检查用户名
     * @param userName
     * @return
     * @throws Exception
     */
    private boolean checkNamePvt (String userName) throws Exception{
        boolean rs = true;
        List<User> users = userService.findAllUser();
        for (User user : users) {
            if(user.getUserName().equals(userName)) {
                rs = false;
                return rs;
            }
        }
        return rs;
    }

    /**
     * 检查邮箱
     * @param userEmail
     * @return
     * @throws Exception
     */
    private boolean checkEmailPvt (String userEmail) throws Exception{
        boolean rs = true;
        List<User> users = userService.findAllUser();
        for (User user : users) {
            if(user.getUserEmail().equals(userEmail)) {
                rs = false;
                break;
            }
        }
        return rs;
    }



    /**
     * 注册时邮箱是否已经注册
     * @param userEmail
     */
    @RequestMapping("checkEmail")
    @ResponseBody
    public Object checkEmail(String userEmail) {
        Map<String,Object> map = new HashMap<>();
        boolean result = true;
        String msg = "";
        try{
         result = checkEmailPvt(userEmail);
         if(result==false){
             msg = "邮箱已存在！";
         }
        }catch (Exception e){
            result=false;
            msg = "服务器拉闸了";
            e.printStackTrace();
        }finally {
            map.put("valid", result);
            map.put("msg",msg);
            return map;
        }

    }

    /**
     * 注册用户
     * @param user
     */
    @RequestMapping("register")
    @ResponseBody
    public Object register(User user,HttpServletRequest req) {
        Map<String,Object> map = new HashMap<>();
        try{
            String userCode = user.getVerifyCode();
            String vCode = (String) req.getSession().getAttribute("verifyCode");
            /* 判断验证码是否正确 */
            if(!userCode.equalsIgnoreCase(vCode)) {
                map.put("valid", false);
                map.put("msg","验证码错误！");
                return map;
            }
            /* 判断用户名是否多次注册 */
            if(!checkNamePvt(user.getUserName())) {
                map.put("valid", false);
                map.put("msg","用户已注册！");
                return map;
            }
            /* 判断邮箱是否多次注册 */
            if(!checkEmailPvt(user.getUserEmail())) {
                map.put("valid", false);
                map.put("msg","邮箱已注册！");
                return map;
            }
            //通过工具类生成UUID
            user.setUserId(IdGenerator.getID());
            //注册用户
            userService.register(user);
            map.put("valid", true);
            map.put("msg","用户注册成功！");
        }catch (Exception e){
            map.put("valid", false);
            map.put("msg","服务器拉闸！");
        }finally {
            return map;
        }
    }

    /**
     * 登陆用户
     * @param
     */
    @RequestMapping("getPublicKey")
    @ResponseBody
    public Object getPublicKey(String key,String userName,HttpServletRequest req) {
        Map<String,Object> keyMap =null ;
        Map<String,Object> res = new HashMap<>();
        try {
            keyMap = RSAUtils.genKeyPair();
            //获取公钥
            String publicKey = RSAUtils.getPublicKey(keyMap);
            //私钥
            String privateKey= RSAUtils.getPrivateKey(keyMap);

            req.getServletContext().setAttribute(userName,privateKey);

            //返回公钥
            res.put("publicKey",publicKey);
            //
            res.put("rel",1);


        } catch (Exception e) {

        }finally {
           return res;
        }
    }


    /**
     * 登陆用户
     * @param
     */
    @RequestMapping("login")
    @ResponseBody
    public Object login(String userName ,String userPassword,HttpServletRequest req) {
        Map<String,Object> res = new HashMap<>();
        int i = 0;
        int y;
        try {
            System.out.println("-----------------------------"+userPassword);
            //获取私钥
            String privateKey = (String) req.getServletContext().getAttribute(userName);
            String up = userPassword.trim().replaceAll(" ","+");
            System.out.println("输出私钥："+privateKey);
          //  userPassword = userPassword.replaceAll(" ", "+");
            String userPwdByte =  RSAUtils.decryptDataOnJava(up,privateKey);
            System.out.println("解密"+new String(userPwdByte));

            res.put("rel",1);

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            return res;
        }
    }


    /**
     * 注册邮箱 验证码发送
     *
     * @param req
     */
    @RequestMapping("emailCode")
    @ResponseBody
    public Object emailCode(String userEmail,HttpServletRequest req) {
        Map<String,Object> map = new HashMap<>();
        if (userEmail==null||userEmail.equals("")){
            map.put("valid",false);
            map.put("msg","邮箱不能为空");
            return map;
        }
        Properties properties = new Properties();
        //创建Session
        properties.setProperty("mail.host", "smtp.qq.com");
        properties.setProperty("mail.smtp.auth", "true");
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // TODO Auto-generated method stub
                return new PasswordAuthentication("936933494","irnobcskpifdbeha");
            }
        };
        Session session = Session.getInstance(properties, authenticator);

        MimeMessage message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress("936933494@qq.com"));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            message.setSubject("来自源流博客的注册验证码");
            String code=  CommonUtils.uuid().substring(0,6);
            System.out.println(code);
            message.setContent("本次验证码为：<font color='red'>"+code+"</font>,非本人操作请无视！",
                    "text/html;charset=utf-8");
            Transport.send(message);
            req.getSession().setAttribute("verifyCode",code);
            map.put("valid",true);
        } catch (Exception e) {
            if(e instanceof SendFailedException){
                map.put("msg","邮箱不存在！请确认");
            }else {
                map.put("msg","服务器拉闸！");
            }
            map.put("valid",false);
            e.printStackTrace();

        }finally {
            return map;
        }

    }

}
