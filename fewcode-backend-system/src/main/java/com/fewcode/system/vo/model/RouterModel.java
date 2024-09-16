package com.fewcode.system.vo.model;

import lombok.Data;

import java.util.List;

/**
 * 路由信息
 *
 * @author 文艺倾年
 */
@Data
public class RouterModel {

    private String component;

    private String name;

    private String path;

    private String redirect;

    private List<RouterModel> children;
}
