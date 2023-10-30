package com.itheima.service;

import com.itheima.po.Class;
import com.itheima.po.PageInfo;

import java.util.List;

/**
 * 用户Service层接口
 */
public interface ClassService {
    //分页查询
    PageInfo<Class> findPageInfo(String c_classname, String c_counsellor, Integer c_classid, Integer pageIndex, Integer pageSize);

    //删除班级信息
    void deleteClass(Integer c_id);

    //添加班级信息
    void addClass(Class ucalss);

    Class findClassById(Integer c_id);

    //修改班级信息
    int updateClass(Class uclass);

    //查询班级人员信息
    List<Class> findClassStudent(Class uclass);
	
    List<Class> getAll();
}
