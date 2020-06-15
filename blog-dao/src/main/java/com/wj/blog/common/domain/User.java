package com.wj.blog.common.domain;

public class User {
    private String userId;

    private String userName;

    private String userPassword;

    private String userEmail;

    private String verifyCode;

    private short userStatus;

    private Integer userRId;

    private Userinfo userinfo;

    private Long  userUpdated ;

    private Long userCreated;

    private String userUpdatedTxt;

    private String userCreatedTxt;

    public String getUserUpdatedTxt() {
        return userUpdatedTxt;
    }

    public Long getUserUpdated() {
        return userUpdated;
    }

    public String getUserCreatedTxt() {
        return userCreatedTxt;
    }

    public void setUserUpdated(Long userUpdated) {
        this.userUpdated = userUpdated;
    }

    public Long getUserCreated() {
        return userCreated;
    }

    public void setUserCreated(Long userCreated) {
        this.userCreated = userCreated;
    }

    private Role userRole;

    public short getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(short userStatus) {
        this.userStatus = userStatus;
    }

    public Integer getUserRId() {
        return userRId;
    }

    public void setUserRId(Integer userRId) {
        this.userRId = userRId;
    }

    public Role getUserRole() {
        return userRole;
    }

    public void setUserRole(Role userRole) {
        this.userRole = userRole;
    }

    public Userinfo getUserinfo() {
        return userinfo;
    }

    public void setUserinfo(Userinfo userinfo) {
        this.userinfo = userinfo;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }
}