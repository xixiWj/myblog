package com.wj.blog.shiro;

import com.wj.blog.common.utils.Base64Utils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.junit.platform.commons.logging.Logger;
import org.junit.platform.commons.logging.LoggerFactory;
import org.springframework.stereotype.Component;


public class CredentialsMatcher  extends SimpleCredentialsMatcher {

    private final static Logger LOGGER = LoggerFactory.getLogger(CredentialsMatcher.class);

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        UsernamePasswordToken authcToken = (UsernamePasswordToken) token;
        Object tokenCredentials = null;
        try {
            tokenCredentials = Base64Utils.decode(authcToken.getUsername()+String.valueOf(authcToken.getPassword()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        Object accountCredentials = getCredentials(info);
        return accountCredentials.equals(tokenCredentials);
    }
}
