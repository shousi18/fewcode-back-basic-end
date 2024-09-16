package com.fewcode.rest.controller.manage.system;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.fewcode.system.service.IRoleService;
import com.fewcode.system.vo.model.RoleModel;
import com.fewcode.system.vo.query.RolePageQuery;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户中心-角色信息  前端控制器
 *
 * @author 文艺倾年
 */
@Api(tags = "系统管理-角色管理接口")
@RestController
@RequestMapping("/manage/system/role")
@AllArgsConstructor
public class RoleController {

    private final IRoleService roleService;

    @ApiOperation(value = "分页查询用户中心-角色信息列表", notes = "用户中心-角色信息-分页查询列表", nickname = "文艺倾年")
    @PostMapping("/getPageList")
    public IPage<RoleModel> getPageList(@RequestBody RolePageQuery query) {
        return roleService.getPageList(query);
    }

    @ApiOperation(value = "查询有效角色信息列表", notes = "用户中心-角色信息-查询有效角色信息列表", nickname = "文艺倾年")
    @PostMapping("/getRoleList")
    public List<RoleModel> getRoleList() {
        return roleService.getRoleList();
    }

    @ApiOperation(value = "根据id查询用户中心-角色信息信息", notes = "用户中心-角色信息-根据id查询数据信息", nickname = "文艺倾年")
    @GetMapping(value = "/{id}")
    public RoleModel getRoleById(@PathVariable("id") Long id) {
        return roleService.getRoleById(id);
    }

    @ApiOperation(value = "新增用户中心-角色信息数据", notes = "用户中心-角色信息-新增数据", nickname = "文艺倾年")
    @PostMapping("/createRole")
    public Long createRole(@RequestBody RoleModel model) {
        return roleService.createRole(model);
    }

    @ApiOperation(value = "/修改用户中心-角色信息数据", notes = "用户中心-角色信息-修改数据", nickname = "文艺倾年")
    @PostMapping("/updateRole")
    public void updateRole(@RequestBody RoleModel model) {
        roleService.updateRole(model);
    }

    @ApiOperation(value = "删除用户中心-角色信息", notes = "用户中心-角色信息-根据id删除数据信息", nickname = "文艺倾年")
    @DeleteMapping("/{id}")
    public Integer deleteRole(@PathVariable("id") Long id) {
        return roleService.deleteRole(id);
    }
}
