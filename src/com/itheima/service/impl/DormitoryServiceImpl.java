package com.itheima.service.impl;


import com.itheima.dao.DormitoryDao;
import com.itheima.po.Dormitory;
import com.itheima.po.PageInfo;
import com.itheima.service.DormitoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户Service接口实现类
 */
@Service("dormitoryService")
@Transactional
public class DormitoryServiceImpl implements DormitoryService {
    @Autowired
    private DormitoryDao dormitoryDao;

    //分页查询
    @Override
    public PageInfo<Dormitory> findPageInfo(String a_name, Integer s_dormitoryid, String d_dormbuilding, Integer pageIndex, Integer pageSize) {
        PageInfo<Dormitory> pi = new PageInfo<>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = dormitoryDao.totalCount(a_name, s_dormitoryid, d_dormbuilding);
        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示宿舍信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Dormitory> dormitoryList = dormitoryDao.getDormitoryList(a_name, s_dormitoryid, d_dormbuilding,
                    (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(dormitoryList);
        }
        return pi;
    }

    @Override
    public List<Dormitory> getAll() {
        return dormitoryDao.getAll();
    }

    //添加宿舍信息
    @Override
    public void addDormitory(Dormitory dormitory) {
		dormitoryDao.addDormitory(dormitory);
	}

    //通过id删除宿舍信息
    @Override
    public void deleteDormitory(Integer d_id) {
		dormitoryDao.deleteDormitory(d_id);
	}

    //修改宿舍信息
    @Override
    public void updateDormitory(Dormitory dormitory) {
		dormitoryDao.updateDormitory(dormitory);
	}

    @Override
    public Dormitory findDormitoryById(Integer d_id) {
        return dormitoryDao.findDormitoryById(d_id);
    }

    //查询宿舍人员信息
    @Override
    public List<Dormitory> findDormitoryStudent(Dormitory dormitory) {
        return dormitoryDao.findDormitoryStudent(dormitory);
    }
}
