package com.itheima.service.impl;

import com.itheima.dao.StudentCleanDao;
import com.itheima.po.PageInfo;
import com.itheima.po.StudentClean;
import com.itheima.service.StudentCleanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("studentCleanService")
@Transactional
public class StudentCleanServiceImpl implements StudentCleanService {
    @Autowired
    private StudentCleanDao studentCleanDao;

    //分页查询
    @Override
    public PageInfo<StudentClean> findPageInfo(Integer s_studentid, String s_name, Integer s_dormitoryid, Integer pageIndex, Integer pageSize) {
        PageInfo<StudentClean> pi = new PageInfo<StudentClean>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = studentCleanDao.totalCount(s_studentid, s_name, s_dormitoryid);
        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示宿舍信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<StudentClean> studentCleanList = studentCleanDao.getStudentCleanList(s_studentid, s_name, s_dormitoryid,
                    (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(studentCleanList);
        }
        return pi;
    }

    @Override
    public List<StudentClean> getAll() {
        return studentCleanDao.getAll();
    }

    //添加宿舍卫生信息
    @Override
    public void addStudentClean(StudentClean studentclean) {
        studentCleanDao.addStudentClean(studentclean);
    }

    //通过id删除宿舍卫生信息
    @Override
    public void deleteStudentClean(Integer g_id) {
        studentCleanDao.deleteStudentClean(g_id);
    }

    //修改宿舍卫生信息
    @Override
    public void updateStudentClean(StudentClean studentclean) {
        studentCleanDao.updateStudentClean(studentclean);
    }

    @Override
    public StudentClean findStudentCleanById(Integer g_id) {
        return studentCleanDao.findStudentCleanById(g_id);
    }
}

