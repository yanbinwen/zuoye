package com.ruoyi.wms.service;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.CryptoPriceInfodemoBo;
import com.ruoyi.wms.domain.entity.CryptoPriceInfodemo;
import com.ruoyi.wms.domain.vo.CryptoPriceInfodemoVo;
import com.ruoyi.wms.mapper.CryptoPriceInfodemomapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 虚拟货币价格信息演示Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class CryptoPriceInfodemoService {

    private final CryptoPriceInfodemomapper cryptoPriceInfodemomapper;

    /**
     * 根据ID查询虚拟货币价格信息演示（主键精准查询）
     */
    public CryptoPriceInfodemoVo queryById(Integer id) {
        return cryptoPriceInfodemomapper.selectVoById(id);
    }

    /**
     * 查询虚拟货币价格信息演示列表（分页查询）
     */
    public TableDataInfo<CryptoPriceInfodemoVo> queryPageList(CryptoPriceInfodemoBo bo, PageQuery pageQuery) {
        Map<String, Object> params = new HashMap<>();
        if (bo != null) {
            if (bo.getId() != null) params.put("id", bo.getId());
            if (bo.getRank() != null) params.put("rank", bo.getRank());
            if (bo.getName() != null) params.put("name", bo.getName());
            if (bo.getSymbol() != null) params.put("symbol", bo.getSymbol());
            if (bo.getTrend() != null) params.put("trend", bo.getTrend());
            if (bo.getDate() != null) params.put("date", bo.getDate());
        }
        LambdaQueryWrapper<CryptoPriceInfodemo> lqw = buildQueryWrapper(params);
        Page<CryptoPriceInfodemoVo> result = cryptoPriceInfodemomapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询虚拟货币价格信息演示列表（支持模糊查询）
     */
    public List<CryptoPriceInfodemoVo> queryList(CryptoPriceInfodemoBo bo) {
        Map<String, Object> params = new HashMap<>();
        if (bo != null) {
            if (bo.getId() != null) params.put("id", bo.getId());
            if (bo.getRank() != null) params.put("rank", bo.getRank());
            if (bo.getName() != null) params.put("name", bo.getName());
            if (bo.getSymbol() != null) params.put("symbol", bo.getSymbol());
            if (bo.getTrend() != null) params.put("trend", bo.getTrend());
            if (bo.getDate() != null) params.put("date", bo.getDate());
        }
        LambdaQueryWrapper<CryptoPriceInfodemo> lqw = buildQueryWrapper(params);
        return cryptoPriceInfodemomapper.selectVoList(lqw);
    }

    /**
     * 构建查询条件
     */
    private LambdaQueryWrapper<CryptoPriceInfodemo> buildQueryWrapper(Map<String, Object> params) {
        LambdaQueryWrapper<CryptoPriceInfodemo> lqw = Wrappers.lambdaQuery();

        // 主键精准查询
        if (params.containsKey("id") && params.get("id") != null) {
            lqw.eq(CryptoPriceInfodemo::getId, params.get("id"));
        }

        // 排名精准查询
        if (params.containsKey("rank") && params.get("rank") != null) {
            lqw.eq(CryptoPriceInfodemo::getRank, params.get("rank"));
        }

        // 名称模糊查询
        if (params.containsKey("name") && StrUtil.isNotBlank((String) params.get("name"))) {
            lqw.like(CryptoPriceInfodemo::getName, params.get("name"));
        }

        // 符号模糊查询
        if (params.containsKey("symbol") && StrUtil.isNotBlank((String) params.get("symbol"))) {
            lqw.like(CryptoPriceInfodemo::getSymbol, params.get("symbol"));
        }

        // 趋势精准查询
        if (params.containsKey("trend") && StrUtil.isNotBlank((String) params.get("trend"))) {
            lqw.eq(CryptoPriceInfodemo::getTrend, params.get("trend"));
        }

        // 日期精准查询
        if (params.containsKey("date") && params.get("date") != null) {
            lqw.eq(CryptoPriceInfodemo::getDate, params.get("date"));
        }

        return lqw;
    }

    /**
     * 新增虚拟货币价格信息演示
     */
    public int insert(CryptoPriceInfodemo cryptoPriceInfodemo) {
        return cryptoPriceInfodemomapper.insert(cryptoPriceInfodemo);
    }

    /**
     * 通过Bo新增虚拟货币价格信息演示
     */
    public int insertByBo(CryptoPriceInfodemoBo bo) {
        CryptoPriceInfodemo cryptoPriceInfodemo = MapstructUtils.convert(bo, CryptoPriceInfodemo.class);
        return insert(cryptoPriceInfodemo);
    }

    /**
     * 修改虚拟货币价格信息演示
     */
    public int update(CryptoPriceInfodemo cryptoPriceInfodemo) {
        return cryptoPriceInfodemomapper.updateById(cryptoPriceInfodemo);
    }

    /**
     * 通过Bo修改虚拟货币价格信息演示
     */
    public int updateByBo(CryptoPriceInfodemoBo bo) {
        CryptoPriceInfodemo cryptoPriceInfodemo = MapstructUtils.convert(bo, CryptoPriceInfodemo.class);
        return update(cryptoPriceInfodemo);
    }

    /**
     * 批量删除虚拟货币价格信息演示
     */
    public int deleteByIds(Collection<Integer> ids) {
        return cryptoPriceInfodemomapper.deleteBatchIds(ids);
    }

    /**
     * 删除虚拟货币价格信息演示
     */
    public int deleteById(Integer id) {
        return cryptoPriceInfodemomapper.deleteById(id);
    }
}