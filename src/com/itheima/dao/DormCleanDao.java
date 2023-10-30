package com.itheima.dao;

import com.itheima.po.DormClean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 宿舍卫生Dao层接口
 **/
public interface DormCleanDao {
    //获取总条数
    Integer totalCount(@Param("d_id") Integer d_id, @Param("d_dormbuilding") String d_dormbuilding);

    //获取用户列表
    List<DormClean> getDormCleanList(@Param("d_id") Integer d_id, @Param("d_dormbuilding") String d_dormbuilding,
                                     @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    //添加宿舍卫生信息
    void addDormClean(DormClean dormclean);
    
    //删除宿舍卫生信息
    void deleteDormClean(Integer g_id);

    //修改宿舍卫生信息
    void updateDormClean(DormClean dormclean);

    DormClean findDormCleanById(Integer g_id);

    List<DormClean> getAll();
}
