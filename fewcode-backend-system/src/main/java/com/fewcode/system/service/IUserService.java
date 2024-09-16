package com.fewcode.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.fewcode.system.bean.User;
import com.fewcode.system.vo.model.UserModel;
import com.fewcode.system.vo.query.LoginQuery;
import com.fewcode.system.vo.query.UserPageQuery;

/**
 * <p>
 * 用户中心-用户信息表 服务类
 * </p>
 *
 * @author 文艺倾年
 * @since 2021-12-07
 */
public interface IUserService extends IService<User> {

    /**
     * 用户登录
     *
     * @param req 用户信息
     * @return 用户登录信息
     */
    UserModel login(LoginQuery req);

    /**
     * 获取用户列表
     *
     * @param userReq 用户请求信息
     * @return 用户列表信息
     */
    IPage<UserModel> getPageList(UserPageQuery userReq);

    /**
     * 根据用户ID查询用户信息
     *
     * @param id 用户ID
     * @return 用户信息
     */
    UserModel getUserById(Long id);

    /**
     * 新增用户信息
     *
     * @param model 用户提交的信息
     * @return 用户ID
     */
    Long createUser(UserModel model);


    /**
     * 修改用户信息
     *
     * @param model 用户提交的信息
     */
    void updateUser(UserModel model);


    /**
     * 根据ID删除用户信息
     *
     * @param id 用户ID
     */
    void deleteUser(Long id);

    /**
     * 退出系统，清除用户token
     */
    void logout();
}
