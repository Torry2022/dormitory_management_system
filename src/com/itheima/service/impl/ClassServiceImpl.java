package com.itheima.service.impl;


import com.itheima.dao.ClassDao;
import com.itheima.po.Class;
import com.itheima.po.PageInfo;
import com.itheima.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户Service接口实现类
 */
@Service("classService")
@Transactional
public class ClassServiceImpl implements ClassService {
    @Autowired
    private ClassDao classDao;

    //分页查询
    @Override
    public PageInfo<Class> findPageInfo(String c_classname, String c_counsellor, Integer c_classid, Integer pageIndex, Integer pageSize) {
        PageInfo<Class> pi = new PageInfo<Class>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = classDao.totalCount(c_classname, c_classid, c_counsellor);
        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示班级信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Class> classList = classDao.getClassList(c_classname, c_classid, c_counsellor,
                    (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(classList);
        }
        return pi;
    }

    @Override
    public List<Class> getAll() {
        return classDao.getAll();
    }

    //通过id删除班级信息
    @Override
    public void deleteClass(Integer c_id) {
		classDao.deleteClass(c_id);
	}

    //添加班级信息
    @Override
    public void addClass(Class uclass) {
		classDao.addClass(uclass);
	}

    @Override
    public Class findClassById(Integer c_id) {
        return classDao.findClassById(c_id);
    }

    //修改班级信息
    @Override
    public int updateClass(Class uclass) {
        return classDao.updateClass(uclass);
    }

    //查询宿舍人员信息
    @Override
    public List<Class> findClassStudent(Class uclass) {
        return classDao.findClassStudent(uclass);
    }
}
