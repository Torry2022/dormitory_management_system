package com.itheima.service;

import com.itheima.po.DormRepair;
import com.itheima.po.PageInfo;

import java.util.List;

/**
 * @program: dormitorySystem
 * @description: 维修登记
 * @author: Joyrocky
 * @create: 2019-04-28 00:25
 **/
public interface DormRepairService {
    //分页查询
    PageInfo<DormRepair> findPageInfo(Integer d_id, String d_dormbuilding, Integer pageIndex, Integer pageSize);

    //添加宿舍信息
    void addDormRepair(DormRepair dormrepair);

    //删除宿舍信息
    void deleteDormRepair(Integer r_id);

    //修改宿舍信息
    void updateDormRepair(DormRepair dormrepair);

    DormRepair findDormRepairById(Integer r_id);

    List<DormRepair> getAll();
}
