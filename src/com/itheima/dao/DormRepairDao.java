package com.itheima.dao;

import com.itheima.po.DormRepair;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 维修登记Dao层接口
 **/
public interface DormRepairDao {
    //获取总条数
    Integer totalCount(@Param("d_id") Integer d_id, @Param("d_dormbuilding") String d_dormbuilding);

    //获取用户列表
    List<DormRepair> getDormRepairList(@Param("d_id") Integer d_id, @Param("d_dormbuilding") String d_dormbuilding,
                                       @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);
    //添加宿舍信息
    void addDormRepair(DormRepair dormrepair);

    //删除宿舍信息
    void deleteDormRepair(Integer r_id);

    //修改宿舍信息
    void updateDormRepair(DormRepair dormrepair);

    DormRepair findDormRepairById(Integer r_id);

    List<DormRepair> getAll();
}
