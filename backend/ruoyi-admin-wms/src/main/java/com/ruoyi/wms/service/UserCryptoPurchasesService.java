package com.ruoyi.wms.service;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.wms.domain.bo.UserCryptoPurchasesBo;
import com.ruoyi.wms.domain.entity.UserCryptoPurchases;
import com.ruoyi.wms.domain.vo.UserCryptoPurchasesVo;
import com.ruoyi.wms.mapper.UserCryptoPurchasesMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户虚拟货币购买记录Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class UserCryptoPurchasesService {

    private final UserCryptoPurchasesMapper userCryptoPurchasesMapper;

    /**
     * 根据ID查询用户虚拟货币购买记录
     */
    public UserCryptoPurchasesVo queryById(Integer id) {
        return userCryptoPurchasesMapper.selectVoById(id);
    }

    /**
     * 查询用户虚拟货币购买记录列表（分页查询）
     */
    public TableDataInfo<UserCryptoPurchasesVo> queryPageList(UserCryptoPurchasesBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<UserCryptoPurchases> lqw = new LambdaQueryWrapper<>();
        if (bo != null) {
            if (bo.getId() != null) lqw.eq(UserCryptoPurchases::getId, bo.getId());
            if (bo.getUserId() != null) lqw.eq(UserCryptoPurchases::getUserId, bo.getUserId());
            if (bo.getCryptoName() != null) lqw.like(UserCryptoPurchases::getCryptoName, bo.getCryptoName());
            if (bo.getAmount() != null) lqw.eq(UserCryptoPurchases::getAmount, bo.getAmount());
            if (bo.getPricePerUnit() != null) lqw.eq(UserCryptoPurchases::getPricePerUnit, bo.getPricePerUnit());
            lqw.ge(bo.getTotalSpentMin() != null, UserCryptoPurchases::getTotalSpent, bo.getTotalSpentMin());
            lqw.le(bo.getTotalSpentMax() != null, UserCryptoPurchases::getTotalSpent, bo.getTotalSpentMax());
            lqw.between(bo.getStartTime() != null && bo.getEndTime() != null, UserCryptoPurchases::getPurchaseDate, bo.getStartTime(), bo.getEndTime());
        }
        Page<UserCryptoPurchasesVo> result = userCryptoPurchasesMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询用户虚拟货币购买记录列表
     */
    public List<UserCryptoPurchasesVo> queryList(UserCryptoPurchasesBo bo) {
        LambdaQueryWrapper<UserCryptoPurchases> lqw = new LambdaQueryWrapper<>();
        if (bo != null) {
            if (bo.getId() != null) lqw.eq(UserCryptoPurchases::getId, bo.getId());
            if (bo.getUserId() != null) lqw.eq(UserCryptoPurchases::getUserId, bo.getUserId());
            if (bo.getCryptoName() != null) lqw.like(UserCryptoPurchases::getCryptoName, bo.getCryptoName());
            if (bo.getAmount() != null) lqw.eq(UserCryptoPurchases::getAmount, bo.getAmount());
            if (bo.getPricePerUnit() != null) lqw.eq(UserCryptoPurchases::getPricePerUnit, bo.getPricePerUnit());
            if (bo.getTotalSpent() != null) lqw.eq(UserCryptoPurchases::getTotalSpent, bo.getTotalSpent());
            if (bo.getPurchaseDate() != null) lqw.eq(UserCryptoPurchases::getPurchaseDate, bo.getPurchaseDate());
        }
        return userCryptoPurchasesMapper.selectVoList(lqw);
    }



    /**
     * 新增用户虚拟货币购买记录
     */
    public int insert(UserCryptoPurchases userCryptoPurchases) {
        return userCryptoPurchasesMapper.insert(userCryptoPurchases);
    }

    /**
     * 通过Bo新增用户虚拟货币购买记录
     */
    public int insertByBo(UserCryptoPurchasesBo bo) {
        UserCryptoPurchases userCryptoPurchases = MapstructUtils.convert(bo, UserCryptoPurchases.class);
        return insert(userCryptoPurchases);
    }

    /**
     * 修改用户虚拟货币购买记录
     */
    public int update(UserCryptoPurchases userCryptoPurchases) {
        return userCryptoPurchasesMapper.updateById(userCryptoPurchases);
    }

    /**
     * 通过Bo修改用户虚拟货币购买记录
     */
    public int updateByBo(UserCryptoPurchasesBo bo) {
        UserCryptoPurchases userCryptoPurchases = MapstructUtils.convert(bo, UserCryptoPurchases.class);
        return update(userCryptoPurchases);
    }

    /**
     * 批量删除用户虚拟货币购买记录
     */
    public int deleteByIds(Collection<Integer> ids) {
        return userCryptoPurchasesMapper.deleteBatchIds(ids);
    }

    /**
     * 删除用户虚拟货币购买记录
     */
    public int deleteById(Integer id) {
        return userCryptoPurchasesMapper.deleteById(id);
    }

    /**
     * 获取所有唯一的虚拟货币名称
     */
    public List<String> getUniqueCryptoNames() {
        return userCryptoPurchasesMapper.selectObjs(new LambdaQueryWrapper<UserCryptoPurchases>()
                .select(UserCryptoPurchases::getCryptoName)
                .groupBy(UserCryptoPurchases::getCryptoName))
                .stream()
                .map(Object::toString)
                .collect(java.util.stream.Collectors.toList());
    }
    
    /**
     * 获取指定虚拟货币的最新价格
     * @param cryptoName 虚拟货币名称
     * @return 最新价格，如果不存在则返回null
     */
    public BigDecimal getLatestCryptoPrice(String cryptoName) {
        UserCryptoPurchases latestPurchase = userCryptoPurchasesMapper.selectOne(new LambdaQueryWrapper<UserCryptoPurchases>()
                .eq(UserCryptoPurchases::getCryptoName, cryptoName)
                .orderByDesc(UserCryptoPurchases::getPurchaseDate)
                .last("LIMIT 1"));
        
        return latestPurchase != null ? latestPurchase.getPricePerUnit() : null;
    }
    
    /**
     * 获取所有虚拟货币的最新价格映射
     * @return 货币名称到最新价格的映射
     */
    public Map<String, BigDecimal> getLatestCryptoPrices() {
        Map<String, BigDecimal> priceMap = new HashMap<>();
        List<String> cryptoNames = getUniqueCryptoNames();
        
        for (String name : cryptoNames) {
            BigDecimal price = getLatestCryptoPrice(name);
            if (price != null) {
                priceMap.put(name, price);
            }
        }
        
        return priceMap;
    }
    
    /**
     * 获取推荐货币的价格（用于智能推荐功能）
     * 如果数据库中有该货币的购买记录，返回最新价格
     * 如果没有，返回一个默认价格（用于演示和购买）
     * 
     * @param cryptoName 虚拟货币名称
     * @param defaultPrice 默认价格（如果数据库中没有记录）
     * @return 货币价格
     */
    public BigDecimal getRecommendedCryptoPrice(String cryptoName, BigDecimal defaultPrice) {
        BigDecimal latestPrice = getLatestCryptoPrice(cryptoName);
        // 如果数据库中有价格记录，使用该价格；否则使用默认价格
        return latestPrice != null ? latestPrice : defaultPrice;
    }
    
    /**
     * 获取多个推荐货币的价格映射
     * 
     * @param recommendedPrices 推荐货币名称和默认价格的映射
     * @return 货币名称到价格的映射
     */
    public Map<String, BigDecimal> getRecommendedCryptoPrices(Map<String, BigDecimal> recommendedPrices) {
        Map<String, BigDecimal> priceMap = new HashMap<>();
        
        for (Map.Entry<String, BigDecimal> entry : recommendedPrices.entrySet()) {
            String cryptoName = entry.getKey();
            BigDecimal defaultPrice = entry.getValue();
            BigDecimal price = getRecommendedCryptoPrice(cryptoName, defaultPrice);
            priceMap.put(cryptoName, price);
        }
        
        return priceMap;
    }
}