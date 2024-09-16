package com.fewcode.common.util.excel.bean;

import lombok.Data;

import java.io.Serializable;

/**
 * @author 文艺倾年
 */
@Data
public class UserBean implements Serializable {


    private String className;

    private String userName;

    private String sex;

    private Integer age;

    private Integer scope;

    private String remark;

    private String remark2;
}
