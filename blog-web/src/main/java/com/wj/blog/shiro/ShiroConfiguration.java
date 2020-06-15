package com.wj.blog.shiro;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.MemoryConstrainedCacheManager;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

import java.util.LinkedHashMap;

@Configuration
public class ShiroConfiguration {
    private static final Log log = LogFactory.getLog(ShiroConfiguration.class);


    /**
     * 用户授权信息Cache
     * */
    @Bean(name = "shiroCacheManager")
    public CacheManager cacheManager(){return new MemoryConstrainedCacheManager();}

    @Bean(name = "securityManager")
    public DefaultSecurityManager securityManager(){
        //这里注意，需要实现DefaultWebSecurityManager
        DefaultSecurityManager sm = new DefaultWebSecurityManager();
        sm.setCacheManager(cacheManager());
        return sm;
    }

    /**
     * shiro核心，拦截器链，顺序执行
     * */
    @Bean(name = "shiroFilter")
    @DependsOn("securityManager")
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(DefaultSecurityManager securityManager, Realm realm){
        securityManager.setRealm(realm);
        //拦截器
        LinkedHashMap<String,String> filterChainDefinitionMap = new LinkedHashMap<>();

        //登出
        filterChainDefinitionMap.put("/user/logout", "logout");

        //<!-- 过滤链定义，从上向下顺序执行，一般将 /**放在最为下边 -->:这是一个坑呢，一不小心代码就不好使了;
        //<!-- authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问-->
        filterChainDefinitionMap.put("/user/**", "authc");
        filterChainDefinitionMap.put("/**", "anon");

        ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
        shiroFilter.setSecurityManager(securityManager);
        shiroFilter.setLoginUrl("/user/toLogin");//未登录跳转
        shiroFilter.setUnauthorizedUrl("/user/toLogin");//未授权跳转
        // 登录成功后要跳转的链接
        shiroFilter.setSuccessUrl("/index");

        filterChainDefinitionMap.put("/user/first","perms[1]");
        log.info("第一链");
        filterChainDefinitionMap.put("/user/second","perms[2]");
        log.info("第二链");
        filterChainDefinitionMap.put("/user/third","perms[3]");
        log.info("第三链");


        log.info("执行顺序 : " + filterChainDefinitionMap);

        shiroFilter.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilter;
    }

    //开启shiro aop注解支持
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager manager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(manager);
        return authorizationAttributeSourceAdvisor;
    }

    /**
     * DefaultAdvisorAutoProxyCreator，Spring的一个bean，由Advisor决定对哪些类的方法进行AOP代理。
     */
    @Bean
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAAP = new DefaultAdvisorAutoProxyCreator();
        defaultAAP.setProxyTargetClass(true);
        return defaultAAP;
    }

}

