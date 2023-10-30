package com.itheima.dao;

import com.itheima.po.Dormitory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 管理员DAO层接口
 */
public interface DormitoryDao {
    //获取总条数
    Integer totalCount(@Param("a_name") String a_name, @Param("s_dormitoryid") Integer s_dormitoryid, @Param("d_dormbuilding") String d_dormbuilding);

    //获取用户列表
    List<Dormitory> getDormitoryList(@Param("a_name") String a_name, @Param("s_dormitoryid") Integer s_dormitoryid,
                                     @Param("d_dormbuilding") String d_dormbuilding, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    //添加宿舍信息
    void addDormitory(Dormitory dormitory);

    //删除宿舍信息
    void deleteDormitory(Integer d_id);

    //修改宿舍信息
    void updateDormitory(Dormitory dormitory);

    Dormitory findDormitoryById(Integer d_id);

    //查询宿舍人员信息
    List<Dormitory> findDormitoryStudent(Dormitory dormitory);

    List<Dormitory> getAll();
}
