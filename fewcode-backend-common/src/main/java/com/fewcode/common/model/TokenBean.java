package com.fewcode.common.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;

/**
 * @author ZhangFZ
 * @Data:10
 **/
@Builder
@RequiredArgsConstructor
@AllArgsConstructor
@Data
public class TokenBean {

    /**
     * 是否管理员用户，授予admin权限为管理员
     */
    private Boolean isAdmin;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * openId
     */
    private String openId;

    /**
     * 小程序sessionKey
     */
    private String sessionKey;

    /**
     * 用户账号
     */
    private String account;

    /**
     * 用户类型
     */
    private String userType;

    /**
     * 角色ID拼接字符串
     */
    private String roleIdList;

    /**
     * 角色信息拼接字符串
     */
    private String roleList;
}
