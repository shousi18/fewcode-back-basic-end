package com.fewcode.common.util.excel.bean;

import lombok.Data;

/**
 * @author 文艺倾年
 */
@Data
public class GradeBean {

    private String className;

    private String userName;
    
    private Integer mathGrade;
    
    private Integer chinaGrade;
    
    private Integer englishGrade;
}
