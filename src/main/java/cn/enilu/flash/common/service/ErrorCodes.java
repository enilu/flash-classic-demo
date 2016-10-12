package cn.enilu.flash.common.service;


import cn.enilu.flash.web.exception.ErrorCode;

public interface ErrorCodes {



    ErrorCode INVALID_ARGUMENT = new ErrorCode(1, "参数错误");

    ErrorCode USER_FROZE = new ErrorCode(10002, "账号已被冻结");

    ErrorCode USERNAME_EXISTS = new ErrorCode(10003, "账号已被占用");

}
