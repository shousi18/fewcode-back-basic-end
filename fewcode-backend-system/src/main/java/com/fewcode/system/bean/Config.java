package com.fewcode.system.bean;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fewcode.common.config.bean.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 系统管理-参数配置对象 sys_config
 * 
 * @author 文艺倾年
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_config")
@ApiModel(value = "系统管理-参数配置对象", description = "system-系统管理-参数配置信息表")
public class Config extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "参数名称")
    private String configName;
    
    @ApiModelProperty(value = "参数键名")
    private String configKey;
    
    @ApiModelProperty(value = "参数键值")
    private String configValue;
    
    @ApiModelProperty(value = "是否内置")
    private Boolean configType;
    
    @ApiModelProperty(value = "备注")
    private String remark;

}
