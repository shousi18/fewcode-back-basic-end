package com.fewcode.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 用户类型枚举
 *
 * @author 文艺倾年
 */
@Getter
@AllArgsConstructor
public enum UserTypeEnum {

    /**
     * 用户类型枚举
     */
    SYSTEM_USER("00", "系统用户"),
    APPLET_USER("01", "小程序用户"),
    ;


    private final String code;

    private final String desc;
}
