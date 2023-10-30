package com.itheima.dao;

import com.itheima.po.Class;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 管理员DAO层接口
 */
public interface ClassDao {
    //获取总条数
    Integer totalCount(@Param("c_classname") String c_classname, @Param("c_classid") Integer c_classid, @Param("c_counsellor") String c_counsellor);

    //获取用户列表
    List<Class> getClassList(@Param("c_classname") String c_classname, @Param("c_classid") Integer c_classid,
                             @Param("c_counsellor") String c_counsellor, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    //删除班级信息
    void deleteClass(Integer c_id);

    //添加班级信息
    void addClass(Class ucalss);

    //修改班级信息
    int updateClass(Class uclass);

    Class findClassById(Integer c_id);

    //查询班级人员信息
    List<Class> findClassStudent(Class uclass);

    List<Class> getAll();
}
