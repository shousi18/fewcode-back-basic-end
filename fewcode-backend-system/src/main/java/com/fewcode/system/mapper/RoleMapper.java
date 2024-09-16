package com.fewcode.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fewcode.system.bean.Role;
import com.fewcode.system.vo.model.RoleModel;
import org.apache.ibatis.annotations.Param;

/**
 * 用户中心-角色信息Mapper接口
 *
 * @author 文艺倾年
 */
public interface RoleMapper extends BaseMapper<Role>{
    /**
     * 查询用户中心-角色信息列表
     *
     * @param page 分页信息
     * @param role 用户中心-角色信息
     * @return 用户中心-角色信息集合
     */
    IPage<RoleModel> getPageList(@Param("page") Page<RoleModel> page, @Param("role") RoleModel role);
}
