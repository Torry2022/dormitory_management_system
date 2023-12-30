package com.itheima.service.impl;

import com.itheima.dao.DormCleanDao;
import com.itheima.po.DormClean;
import com.itheima.po.PageInfo;
import com.itheima.service.DormCleanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("dormCleanService")
@Transactional
public class DormCleanServiceImpl implements DormCleanService {
    @Autowired
    private DormCleanDao dormCleanDao;

    //分页查询
    @Override
    public PageInfo<DormClean> findPageInfo(Integer d_id, String d_dormbuilding, Integer pageIndex, Integer pageSize) {
        PageInfo<DormClean> pi = new PageInfo<>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = dormCleanDao.totalCount(d_id, d_dormbuilding);
        if (totalCount > 0) {
            pi.setTotalCount(totalCount);
            //每一页显示宿舍信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<DormClean> dormCleanList = dormCleanDao.getDormCleanList(d_id, d_dormbuilding,
                    (pi.getPageIndex() - 1) * pi.getPageSize(), pi.getPageSize());
            pi.setList(dormCleanList);
        }
        return pi;
    }

    @Override
    public List<DormClean> getAll() {
        return dormCleanDao.getAll();
    }

    //添加宿舍卫生信息
    @Override
    public void addDormClean(DormClean dormclean) {
        dormCleanDao.addDormClean(dormclean);
    }

    //通过id删除宿舍卫生信息
    @Override
    public void deleteDormClean(Integer g_id) {
        dormCleanDao.deleteDormClean(g_id);
    }

    //修改宿舍卫生信息
    @Override
    public void updateDormClean(DormClean dormclean) {
        dormCleanDao.updateDormClean(dormclean);
    }

    @Override
    public DormClean findDormCleanById(Integer g_id) {
        return dormCleanDao.findDormCleanById(g_id);
    }
}

