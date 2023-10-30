package com.itheima.service;

import com.itheima.po.DormClean;
import com.itheima.po.PageInfo;

import java.util.List;

public interface DormCleanService {
    //分页查询
    PageInfo<DormClean> findPageInfo(Integer d_id, String d_dormbuilding, Integer pageIndex, Integer pageSize);

    //添加宿舍信息
    void addDormClean(DormClean dormclean);

    //删除宿舍信息
    void deleteDormClean(Integer g_id);

    //修改宿舍信息
    void updateDormClean(DormClean dormclean);

    DormClean findDormCleanById(Integer g_id);
    
    List<DormClean> getAll();
}
