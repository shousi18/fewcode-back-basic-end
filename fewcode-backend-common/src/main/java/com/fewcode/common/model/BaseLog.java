package com.fewcode.common.model;

import com.fewcode.common.enums.BusinessTypeEnum;
import com.fewcode.common.enums.OperateTypeEnum;

import java.lang.annotation.*;

/**
 * @author 文艺倾年
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface BaseLog {

    // 0网站用户 1后台用户 2小程序 3其他
    OperateTypeEnum operateType() default OperateTypeEnum.OTHER;

    // 0查询 1新增 2修改 3删除 4其他
    BusinessTypeEnum businessType() default BusinessTypeEnum.SELECT;
    
    // 返回保存结果是否落库，没用的大结果可以不记录，比如分页查询等等，设为false即可
    boolean saveResult() default true;
}