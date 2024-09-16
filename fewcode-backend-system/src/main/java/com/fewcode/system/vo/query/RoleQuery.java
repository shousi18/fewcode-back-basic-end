package com.fewcode.system.vo.query;

import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * @author 文艺倾年
 */
@Data
@ApiModel(value = "角色请求对象", description = "用户中心-角色请求对象")
public class RoleQuery {

    private String roleName;

}
