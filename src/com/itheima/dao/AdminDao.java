package com.itheima.dao;

import com.itheima.po.Admin;
import org.apache.ibatis.annotations.Param;


import java.util.List;

/**
 * 管理员DAO层接口
 */
public interface AdminDao {
    //通过账号和密码查询管理员
    Admin findAdmin(Admin admin);

    //获取总条数
    Integer totalCount(@Param("a_username") String a_username, @Param("a_describe") String a_describe, @Param("a_id") Integer a_id);

    //获取用户列表
    List<Admin> getAdminList(@Param("a_username") String a_username, @Param("a_describe") String a_describe,
                             @Param("a_id") Integer a_id, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    //添加管理员信息
    void addAdmin(Admin admin);

    //删除管理员信息
    void deleteAdmin(Integer a_id);

    //修改管理员信息
    void updateAdmin(Admin admin);

    Admin findAdminById(Integer a_id);

    Admin findAdminByIdAndPwd(@Param("a_id") Integer a_id, @Param("a_password") String a_password);

    List<Admin> getAll();
}
