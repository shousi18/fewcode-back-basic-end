package com.fewcode.system.vo.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.Set;

/**
 * 用户信息
 *
 * @author 文艺倾年
 */
@Data
@Builder
@AllArgsConstructor
@RequiredArgsConstructor
public class UserInfo {

    private UserModel userModel;

    private Set<String> roles;
}
