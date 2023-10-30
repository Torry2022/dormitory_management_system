package com.itheima.service;

import com.itheima.po.Admin;
import com.itheima.po.PageInfo;


import java.util.List;

/**
 * 用户Service层接口
 */
public interface AdminService {
    //通过账号和密码查询用户
    Admin findAdmin(Admin admin);

    //获取所有数据
    List<Admin> getAll();

    //分页查询
    PageInfo<Admin> findPageInfo(String a_username, String a_describe, Integer a_id, Integer pageIndex, Integer pageSize);

    //添加管理员信息
    void addAdmin(Admin admin);

    //删除管理员信息
    void deleteAdmin(Integer a_id);

    //修改管理员信息
    void updateAdmin(Admin admin);

    Admin findAdminById(Integer a_id);
}
