package com.itheima.dao;

import com.itheima.po.Visitor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 访客Dao层接口
 **/
public interface VisitorDao {
    //获取总条数
    Integer totalCount(@Param("v_name") String v_name, @Param("v_phone") Integer v_phone);

    //获取用户列表
    List<Visitor> getVisitorList(@Param("v_name") String v_name, @Param("v_phone") Integer v_phone,
                                 @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    //添加学生信息
    void addVisitor(Visitor visitor);

    List<Visitor> getAll();
}
