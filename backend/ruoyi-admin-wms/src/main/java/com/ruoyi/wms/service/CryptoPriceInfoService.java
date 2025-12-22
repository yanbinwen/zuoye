package com.ruoyi.wms.service;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.CryptoPriceInfoBo;
import com.ruoyi.wms.domain.entity.CryptoPriceInfo;
import com.ruoyi.wms.domain.vo.CryptoPriceInfoVo;
import com.ruoyi.wms.mapper.CryptoPriceInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 虚拟货币价格信息Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class CryptoPriceInfoService {

    private final CryptoPriceInfoMapper cryptoPriceInfoMapper;

    /**
     * 根据ID查询虚拟货币价格信息（主键精准查询）
     */
    public CryptoPriceInfoVo queryById(Integer id) {
        return cryptoPriceInfoMapper.selectVoById(id);
    }

    /**
     * 查询虚拟货币价格信息列表（分页查询）
     */
    public TableDataInfo<CryptoPriceInfoVo> queryPageList(CryptoPriceInfoBo bo, PageQuery pageQuery) {
        Map<String, Object> params = new HashMap<>();
        if (bo != null) {
            if (bo.getId() != null) params.put("id", bo.getId());
            if (bo.getRank() != null) params.put("rank", bo.getRank());
            if (bo.getName() != null) params.put("name", bo.getName());
            if (bo.getSymbol() != null) params.put("symbol", bo.getSymbol());
            if (bo.getTrend() != null) params.put("trend", bo.getTrend());
            if (bo.getDate() != null) params.put("date", bo.getDate());
        }
        LambdaQueryWrapper<CryptoPriceInfo> lqw = buildQueryWrapper(params);
        Page<CryptoPriceInfoVo> result = cryptoPriceInfoMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询虚拟货币价格信息列表（支持模糊查询）
     */
    public List<CryptoPriceInfoVo> queryList(CryptoPriceInfoBo bo) {
        Map<String, Object> params = new HashMap<>();
        if (bo != null) {
            if (bo.getId() != null) params.put("id", bo.getId());
            if (bo.getRank() != null) params.put("rank", bo.getRank());
            if (bo.getName() != null) params.put("name", bo.getName());
            if (bo.getSymbol() != null) params.put("symbol", bo.getSymbol());
            if (bo.getTrend() != null) params.put("trend", bo.getTrend());
            if (bo.getDate() != null) params.put("date", bo.getDate());
        }
        LambdaQueryWrapper<CryptoPriceInfo> lqw = buildQueryWrapper(params);
        return cryptoPriceInfoMapper.selectVoList(lqw);
    }

    /**
     * 构建查询条件
     */
    private LambdaQueryWrapper<CryptoPriceInfo> buildQueryWrapper(Map<String, Object> params) {
        LambdaQueryWrapper<CryptoPriceInfo> lqw = Wrappers.lambdaQuery();

        // 主键精准查询
        if (params.containsKey("id") && params.get("id") != null) {
            lqw.eq(CryptoPriceInfo::getId, params.get("id"));
        }

        // 排名精准查询
        if (params.containsKey("rank") && params.get("rank") != null) {
            lqw.eq(CryptoPriceInfo::getRank, params.get("rank"));
        }

        // 名称模糊查询
        if (params.containsKey("name") && StrUtil.isNotBlank((String) params.get("name"))) {
            lqw.like(CryptoPriceInfo::getName, params.get("name"));
        }

        // 符号模糊查询
        if (params.containsKey("symbol") && StrUtil.isNotBlank((String) params.get("symbol"))) {
            lqw.like(CryptoPriceInfo::getSymbol, params.get("symbol"));
        }

        // 趋势精准查询
        if (params.containsKey("trend") && StrUtil.isNotBlank((String) params.get("trend"))) {
            lqw.eq(CryptoPriceInfo::getTrend, params.get("trend"));
        }

        // 日期精准查询
        if (params.containsKey("date") && params.get("date") != null) {
            lqw.eq(CryptoPriceInfo::getDate, params.get("date"));
        }

        return lqw;
    }

    /**
     * 新增虚拟货币价格信息
     */
    public int insert(CryptoPriceInfo cryptoPriceInfo) {
        return cryptoPriceInfoMapper.insert(cryptoPriceInfo);
    }

    /**
     * 通过Bo新增虚拟货币价格信息
     */
    public int insertByBo(CryptoPriceInfoBo bo) {
        CryptoPriceInfo cryptoPriceInfo = MapstructUtils.convert(bo, CryptoPriceInfo.class);
        return insert(cryptoPriceInfo);
    }

    /**
     * 修改虚拟货币价格信息
     */
    public int update(CryptoPriceInfo cryptoPriceInfo) {
        return cryptoPriceInfoMapper.updateById(cryptoPriceInfo);
    }

    /**
     * 通过Bo修改虚拟货币价格信息
     */
    public int updateByBo(CryptoPriceInfoBo bo) {
        CryptoPriceInfo cryptoPriceInfo = MapstructUtils.convert(bo, CryptoPriceInfo.class);
        return update(cryptoPriceInfo);
    }

    /**
     * 批量删除虚拟货币价格信息
     */
    public int deleteByIds(Collection<Integer> ids) {
        return cryptoPriceInfoMapper.deleteBatchIds(ids);
    }

    /**
     * 删除虚拟货币价格信息
     */
    public int deleteById(Integer id) {
        return cryptoPriceInfoMapper.deleteById(id);
    }
}