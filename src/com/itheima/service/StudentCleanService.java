package com.itheima.service;

import com.itheima.po.PageInfo;
import com.itheima.po.StudentClean;

import java.util.List;

public interface StudentCleanService {
    //分页查询
    PageInfo<StudentClean> findPageInfo(Integer s_studentid, Integer pageIndex, Integer pageSize);
    
    //添加宿舍信息
    void addStudentClean(StudentClean studentclean);
    
    //删除宿舍信息
    void deleteStudentClean(Integer g_id);
    
    //修改宿舍信息
    void updateStudentClean(StudentClean studentclean);
    
    StudentClean findStudentCleanById(Integer g_id);
    
    List<StudentClean> getAll();
}
