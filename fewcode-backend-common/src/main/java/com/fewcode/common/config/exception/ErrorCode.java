package com.fewcode.common.config.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 统一异常信息枚举类
 *
 * @author 文艺倾年
 */
@AllArgsConstructor
@Getter
public enum ErrorCode {

    /**
     * 异常信息
     */

    NO_TOKEN("1001", "用户未登录"),
    TOKEN_EXPIRE("1002", "登录超时，请重新登录"),
    TOKEN_EXCHANGE("1003", "账号在其他地方登录，账号被踢出"),
    USER_LOGIN_ERROR("2001", "用户名或密码错误"),
    USER_STATUS_ERROR("2002", "用户已被停用，请联系管理员"),

    ARTICLE_CHECK_ERROR("3003", "资源不存在"),
    PARAM_ERROR("9001", "请求参数有误，请重试"),
    NOT_FIND_DATA("9002", "数据不存在，请刷新后重试"),
    /**
     * 抛出此异常码，请重新在{@link ErrorMsg}定义msg
     */
    COMMON_ERROR("9998", "文艺倾年太懒，居然没有定义异常原因"),
    OTHER_ERROR("9999", "未知异常，请联系文艺倾年：https://文艺倾年");

    private final String code;

    private final String msg;
}
