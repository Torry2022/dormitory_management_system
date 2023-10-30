package com.itheima.service;

import com.itheima.po.Dormitory;
import com.itheima.po.PageInfo;

import java.util.List;

/**
 * 用户Service层接口
 */
public interface DormitoryService {
    //分页查询
    PageInfo<Dormitory> findPageInfo(String a_name, Integer s_dormitoryid, String d_dormbuilding, Integer pageIndex, Integer pageSize);

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
