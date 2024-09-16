package com.fewcode.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fewcode.common.config.BaseConstants;
import com.fewcode.common.util.TransformUtils;
import com.fewcode.system.bean.Role;
import com.fewcode.system.bean.UserRole;
import com.fewcode.system.mapper.RoleMapper;
import com.fewcode.system.service.IRoleService;
import com.fewcode.system.service.IUserRoleService;
import com.fewcode.system.vo.model.RoleModel;
import com.fewcode.system.vo.query.RolePageQuery;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 用户中心-角色信息表 服务实现类
 * </p>
 *
 * @author 文艺倾年
 * @since 2021-12-07
 */
@Service
@AllArgsConstructor
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

    private final RoleMapper roleMapper;

    private final IUserRoleService userRoleService;

    @Override
    public IPage<RoleModel> getPageList(RolePageQuery roleReq) {
        return roleMapper.getPageList(roleReq.getPage(), roleReq.getQuery());
    }

    @Override
    public List<RoleModel> getRoleList() {
        return TransformUtils.mapList(roleMapper.selectList(Wrappers.lambdaQuery(Role.class)
                .eq(Role::getStatus, BaseConstants.STATUS_TRUE)
                .orderByAsc(Role::getSortNum)
                .orderByDesc(Role::getId)), RoleModel.class);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long createRole(RoleModel model) {
        Role role = TransformUtils.map(model, Role.class);
        roleMapper.insert(role);
        return role.getId();
    }

    @Override
    public void updateRole(RoleModel model) {
        roleMapper.updateById(TransformUtils.map(model, Role.class));
    }

    @Override
    public RoleModel getRoleById(Long id) {
        RoleModel roleModel = TransformUtils.map(roleMapper.selectById(id), RoleModel.class);
        return roleModel;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer deleteRole(Long id) {
        int count = roleMapper.deleteById(id);
        userRoleService.remove(Wrappers.lambdaQuery(UserRole.class).eq(UserRole::getRoleId, id));
        return count;
    }
}
