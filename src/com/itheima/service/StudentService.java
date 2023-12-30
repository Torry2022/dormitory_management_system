package com.itheima.service;

import com.itheima.po.PageInfo;
import com.itheima.po.Student;

import java.util.List;

/**
 * 用户Service层接口
 */
public interface StudentService {
	//通过账号和密码查询用户
	Student findStudent(Student student);
	
	//分页查询
	PageInfo<Student> findPageInfo(String s_name,Integer s_studentid,Integer s_classid,
									  String s_classname, Integer pageIndex, Integer pageSize);
	//通过id删除学生信息
	void deleteStudent(Integer s_id);
	
	//添加学生信息
	void addStudent(Student student);
	
	//修改学生信息
	void updateStudent(Student student);
	
	Student findStudentById(Integer s_id);
	
	List<Student> getAll();
}
