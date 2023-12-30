package com.itheima.dao;

import com.itheima.po.Student;
import org.apache.ibatis.annotations.Param;


import java.util.List;

/**
 * 管理员DAO层接口
 */
public interface StudentDao {
    //通过账号和密码查询学生
    Student findStudent(Student student);
    
    //获取总条数
    Integer totalCount(@Param("s_name") String s_name, @Param("s_studentid") Integer s_studentid,
                       @Param("s_classid") Integer s_classid, @Param("s_classname") String s_classname);

    //获取用户列表
    List<Student> getStudentList(@Param("s_name") String s_name, @Param("s_studentid") Integer s_studentid, @Param("s_classid") Integer s_classid,
                                 @Param("s_classname") String s_classname, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    //删除学生信息
    void deleteStudent(Integer s_id);

    //添加学生信息
    void addStudent(Student student);

    //修改学生信息
    void updateStudent(Student student);

    Student findStudentById(Integer s_id);

    List<Student> getAll();
}
