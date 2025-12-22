/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : ccc

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 19/12/2025 13:59:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for crypto_news
-- ----------------------------
DROP TABLE IF EXISTS `crypto_news`;
CREATE TABLE `crypto_news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '新闻标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '新闻内容',
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '加密货币名称',
  `trend` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '价格趋势(上涨/下跌/持平)',
  `magnitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '波动幅度描述',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_currency`(`currency`) USING BTREE,
  INDEX `idx_trend`(`trend`) USING BTREE,
  INDEX `idx_created_at`(`created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '加密货币新闻数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crypto_news
-- ----------------------------
INSERT INTO `crypto_news` VALUES (1, 'XRP上涨10%', '分析理由: \n单日10%的涨幅显示市场买盘积极，可能受到利好消息或技术面突破影响\n\n\n情感分析：positive', '未知加密货币', '上涨', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (2, 'EOS 下跌11%', '分析理由: \n大幅下跌显示抛压较重，需要关注是否跌破关键支撑位\n\n\n情感分析：negative', '未知加密货币', '下跌', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (3, '德银分析比特币下跌背后的五大因素及未来走势', '分析理由: \n专业机构分析显示市场存在结构性调整压力，需要关注宏观因素变化\n\n\n情感分析：neutral_negative', '未知加密货币', '下跌', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (4, '加密货币市场回暖，比特币盘中站上8.8万美元', '分析理由: \n机构看好长期前景，技术性反弹可能延续\n\n\n情感分析：positive', '未知加密货币', '上涨', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (5, '万亿美元加密溃败中：特朗普关联资产领跌', '分析理由: \n政治关联资产受市场情绪影响较大，风险偏好下降\n\n\n情感分析：negative', '未知加密货币', '下跌', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (6, 'EOS上涨17%', '分析理由: \n大幅反弹显示超跌修复，但需关注持续性\n\n\n情感分析：positive', '未知加密货币', '上涨', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (7, '比特币下跌10%', '分析理由: \n大幅下跌显示市场情绪转弱，需要关注关键支撑\n\n\n情感分析：negative', '未知加密货币', '下跌', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (8, '以太坊下跌11%', '分析理由: \n主流币种联动下跌，市场整体风险偏好下降\n\n\n情感分析：negative', '未知加密货币', '下跌', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (9, '莱特币下跌11%', '分析理由: \n山寨币受市场整体情绪影响较大\n\n\n情感分析：negative', '未知加密货币', '下跌', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (10, 'XRP下跌10%', '分析理由: \n前期涨幅较大的币种面临获利了结压力\n\n\n情感分析：negative', '未知加密货币', '下跌', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (11, '艾达币下跌10%', '分析理由: \n市场普跌环境下，山寨币跌幅相对较大\n\n\n情感分析：negative', '未知加密货币', '下跌', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (12, '比特币今日价格：美国就业数据喜忧参半，比特币跌至83,000美元', '分析理由: \n宏观经济数据影响市场对美联储政策的预期\n\n\n情感分析：negative', '未知加密货币', '下跌', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (13, '23万人爆仓惨遭血洗！比特币狂泻7%，8.6万美元防线失守', '分析理由: \n大幅下跌引发杠杆清算，形成负反馈循环\n\n\n情感分析：highly_negative', '未知加密货币', '下跌', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (14, '美股被币圈带节奏？华尔街大佬揭秘算法交易影响', '分析理由: \n算法交易放大市场联动，增加波动性\n\n\n情感分析：neutral', '未知加密货币', '持平', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (15, '市场买盘乏力，比特币一度跌破8.7万美元创四月以来新低', '分析理由: \n买盘不足显示市场信心疲弱\n\n\n情感分析：negative', '未知加密货币', '下跌', '未知', '2025-11-25 10:24:13', '2025-11-25 10:24:13');
INSERT INTO `crypto_news` VALUES (16, 'XRP上涨10%', '\n根据英为财情 Investing.com Index的行情系统显示，星期一04:28 XRP出现10%的涨幅', 'XRP', '持平', 'positive', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (17, 'EOS 下跌11%', '\n根据英为财情 Investing.com Index的行情系统显示，星期一19:24 EOS下跌11%', 'EOS', '持平', 'negative', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (18, '德银分析比特币下跌背后的五大因素及未来走势', '\n比特币从10月初高点的大幅回调已经抹去了今年大部分涨幅，这种加密货币在11月21日滑落至约80,000美元', 'BTC', '持平', 'neutral', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (19, '加密货币市场回暖，比特币盘中站上8.8万美元！美银称：2026年比特币将最受益', '\n周一，11月24日，比特币日内升1.72%，盘中一度站上8.8万美元关口', 'BTC', '持平', 'positive', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (20, '万亿美元加密溃败中：特朗普关联资产领跌 家族财富一月蒸发10亿美元', '\n在特朗普担任美国总统的第二个任期内，加密资产曾重塑了其家族的财富版图。但如今，特朗普家族及其追随者正在亲身经历加密市场的暴跌', 'multiple', '持平', 'negative', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (21, 'EOS上涨17%', '\n根据英为财情 Investing.com Index的行情系统显示，星期六15:01 EOS上涨17%', 'EOS', '持平', 'positive', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (22, '比特币 下跌10%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五17:39 比特币下跌10%', 'BTC', '持平', 'negative', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (23, '以太坊 下跌11%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五15:36 以太坊下跌11%', 'ETH', '持平', 'negative', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (24, '莱特币 下跌11%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五15:35 莱特币下跌11%', 'LTC', '持平', 'negative', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (25, 'XRP 下跌10%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五15:34 XRP下跌10%', 'XRP', '持平', 'negative', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (26, '艾达币 下跌10%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五15:00 艾达币下跌10%', 'ADA', '持平', 'negative', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (27, '比特币今日价格：美国就业数据喜忧参半，联储降息预期减弱，比特币跌至83,000美元', '\n比特币周五暴跌，一度跌至80,000美元后略有回升，本周有望录得大幅亏损，因美国劳动力数据喜忧参半', 'BTC', '持平', 'negative', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (28, '23万人爆仓惨遭「血洗」！ 比特币狂泻7%，8.6万美元防线失守', '\n周五，11月21日，比特币暴跌7%，跌穿8.6万美元，刷新7个月新低', 'BTC', '持平', 'negative', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (29, '美股被币圈「带节奏」？华尔街大佬揭秘：算法正把比特币当晴雨表', '\n周四，华尔街市场情绪出现惊人逆转。AI龙头英伟达超预期的业绩表现，以及9月强劲的非农就业报告未能提振市场', 'BTC', '持平', 'neutral', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (30, '市场买盘乏力 比特币一度跌破8.7万美元创四月以来新低', '\n加密货币市场周四继续走弱，延续一个多月的下跌趋势', 'BTC', '持平', 'negative', '2025-11-25 10:39:07', '2025-11-25 10:39:07');
INSERT INTO `crypto_news` VALUES (31, '比特币(BTC) 预测趋势: 震荡上行', '目标价格区间: 85,000-95,000美元\n', '比特币(BTC)', '上涨', '价格目标区间: 85,000-95,000美元', '2025-11-25 11:06:56', '2025-11-25 11:06:56');
INSERT INTO `crypto_news` VALUES (32, '以太坊(ETH) 预测趋势: 跟随比特币', '目标价格区间: 待定\n', '以太坊(ETH)', '持平', '价格目标区间: 待定', '2025-11-25 11:06:56', '2025-11-25 11:06:56');
INSERT INTO `crypto_news` VALUES (33, 'EOS 预测趋势: 波动较大', '目标价格区间: 待定\n', 'EOS', '持平', '价格目标区间: 待定', '2025-11-25 11:06:56', '2025-11-25 11:06:56');
INSERT INTO `crypto_news` VALUES (34, 'XRP 预测趋势: 温和反弹', '目标价格区间: 待定\n', 'XRP', '持平', '价格目标区间: 待定', '2025-11-25 11:06:56', '2025-11-25 11:06:56');
INSERT INTO `crypto_news` VALUES (35, '比特币(BTC) 预测趋势: 震荡上行', '目标价格区间: 85,000-95,000美元\n', '比特币(BTC)', '上涨', '价格目标区间: 85,000-95,000美元', '2025-11-25 11:06:56', '2025-11-25 11:06:56');
INSERT INTO `crypto_news` VALUES (36, '以太坊(ETH) 预测趋势: 跟随比特币', '目标价格区间: 待定\n', '以太坊(ETH)', '持平', '价格目标区间: 待定', '2025-11-25 11:06:56', '2025-11-25 11:06:56');
INSERT INTO `crypto_news` VALUES (37, 'EOS 预测趋势: 波动较大', '目标价格区间: 待定\n', 'EOS', '持平', '价格目标区间: 待定', '2025-11-25 11:06:56', '2025-11-25 11:06:56');
INSERT INTO `crypto_news` VALUES (38, 'XRP 预测趋势: 温和反弹', '目标价格区间: 待定\n', 'XRP', '持平', '价格目标区间: 待定', '2025-11-25 11:06:56', '2025-11-25 11:06:56');
INSERT INTO `crypto_news` VALUES (39, 'XRP上涨10%', '\n根据英为财情 Investing.com Index的行情系统显示，星期一04:28 XRP出现10%的上涨', 'XRP', '持平', 'positive', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (40, 'EOS 下跌11%', '\n根据英为财情 Investing.com Index的行情系统显示，星期一19:24 EOS下跌11%', 'EOS', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (41, '德银分析比特币下跌背后的五大因素及未来走势', '\n比特币从10月初高点的大幅回调已经抹去了今年大部分涨幅，这种加密货币在11月21日滑落至约80,000美元', 'BTC', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (42, '加密货币市场回暖，比特币盘中站上8.8万美元', '\n周一，11月24日，比特币日内升1.72%，盘中一度站上8.8万美元关口', 'BTC', '持平', 'positive', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (43, '万亿美元加密溃败中：特朗普关联资产领跌', '\n在特朗普担任美国总统的第二个任期内，加密资产曾重塑了其家族的财富版图。但如今，特朗普家族及其追随者正在亲身经历加密市场的暴跌', '多种加密货币', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (44, 'EOS上涨17%', '\n根据英为财情 Investing.com Index的行情系统显示，星期六15:01 EOS上涨17%', 'EOS', '持平', 'positive', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (45, '比特币下跌10%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五17:39 比特币下跌10%', 'BTC', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (46, '以太坊下跌11%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五15:36 以太坊下跌11%', 'ETH', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (47, '莱特币下跌11%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五15:35 莱特币下跌11%', 'LTC', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (48, 'XRP下跌10%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五15:34 XRP下跌10%', 'XRP', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (49, '艾达币下跌10%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五15:00 艾达币下跌10%', 'ADA', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (50, '比特币今日价格：美国就业数据喜忧参半，联储降息预期减弱，比特币跌至83,000美元', '\n比特币周五暴跌，一度跌至80,000美元后略有回升，本周有望录得大幅亏损', 'BTC', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (51, '23万人爆仓惨遭「血洗」！比特币狂泻7%，8.6万美元防线失守', '\n周五，11月21日，比特币暴跌7%，跌穿8.6万美元，刷新7个月新低', 'BTC', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (52, '美股被币圈「带节奏」？华尔街大佬揭秘：算法正把比特币当晴雨表', '\n周四，华尔街市场情绪出现惊人逆转。AI龙头英伟达超预期的业绩表现，以及9月强劲的非农就业报告未能提振市场', 'BTC', '持平', 'neutral', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (53, '市场买盘乏力 比特币一度跌破8.7万美元创四月以来新低', '\n加密货币市场周四继续走弱，延续一个多月的下跌趋势', 'BTC', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (54, 'XRP上涨10%', '\n根据英为财情 Investing.com Index的行情系统显示，星期一04:28 XRP出现10%的上涨', 'XRP', '持平', 'positive', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (55, 'EOS 下跌11%', '\n根据英为财情 Investing.com Index的行情系统显示，星期一19:24 EOS下跌11%', 'EOS', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (56, '德银分析比特币下跌背后的五大因素及未来走势', '\n比特币从10月初高点的大幅回调已经抹去了今年大部分涨幅，这种加密货币在11月21日滑落至约80,000美元', 'BTC', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (57, '加密货币市场回暖，比特币盘中站上8.8万美元', '\n周一，11月24日，比特币日内升1.72%，盘中一度站上8.8万美元关口', 'BTC', '持平', 'positive', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (58, '万亿美元加密溃败中：特朗普关联资产领跌', '\n在特朗普担任美国总统的第二个任期内，加密资产曾重塑了其家族的财富版图。但如今，特朗普家族及其追随者正在亲身经历加密市场的暴跌', '多种加密货币', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (59, 'EOS上涨17%', '\n根据英为财情 Investing.com Index的行情系统显示，星期六15:01 EOS上涨17%', 'EOS', '持平', 'positive', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (60, '比特币下跌10%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五17:39 比特币下跌10%', 'BTC', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (61, '以太坊下跌11%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五15:36 以太坊下跌11%', 'ETH', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (62, '莱特币下跌11%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五15:35 莱特币下跌11%', 'LTC', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (63, 'XRP下跌10%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五15:34 XRP下跌10%', 'XRP', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (64, '艾达币下跌10%', '\n根据英为财情 Investing.com Index的行情系统显示，星期五15:00 艾达币下跌10%', 'ADA', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (65, '比特币今日价格：美国就业数据喜忧参半，联储降息预期减弱，比特币跌至83,000美元', '\n比特币周五暴跌，一度跌至80,000美元后略有回升，本周有望录得大幅亏损', 'BTC', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (66, '23万人爆仓惨遭「血洗」！比特币狂泻7%，8.6万美元防线失守', '\n周五，11月21日，比特币暴跌7%，跌穿8.6万美元，刷新7个月新低', 'BTC', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (67, '美股被币圈「带节奏」？华尔街大佬揭秘：算法正把比特币当晴雨表', '\n周四，华尔街市场情绪出现惊人逆转。AI龙头英伟达超预期的业绩表现，以及9月强劲的非农就业报告未能提振市场', 'BTC', '持平', 'neutral', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (68, '市场买盘乏力 比特币一度跌破8.7万美元创四月以来新低', '\n加密货币市场周四继续走弱，延续一个多月的下跌趋势', 'BTC', '持平', 'negative', '2025-11-25 11:15:17', '2025-11-25 11:15:17');
INSERT INTO `crypto_news` VALUES (69, '比特币(BTC) 预测趋势: 短期反弹，中期震荡', '分析理由: \n从83,000美元低点反弹至88,000美元，显示技术性支撑，但流动性收紧和机构资金流出构成压力\n\n目标价格区间: 85,000-92,000美元\n', '比特币(BTC)', '持平', '价格目标区间: 85,000-92,000美元', '2025-11-25 11:24:03', '2025-11-25 11:24:03');
INSERT INTO `crypto_news` VALUES (70, '以太坊(ETH) 预测趋势: 跟随比特币走势', '分析理由: \n通常跟随比特币走势，新加坡推出以太坊期货可能带来增量资金\n\n目标价格区间: 需观察比特币走势\n', '以太坊(ETH)', '持平', '价格目标区间: 需观察比特币走势', '2025-11-25 11:24:03', '2025-11-25 11:24:03');
INSERT INTO `crypto_news` VALUES (71, 'EOS 预测趋势: 高波动性', '分析理由: \n出现17%的大幅波动，显示投机性较强，风险较高\n\n目标价格区间: 波动较大，不建议重仓\n', 'EOS', '持平', '价格目标区间: 波动较大，不建议重仓', '2025-11-25 11:24:03', '2025-11-25 11:24:03');
INSERT INTO `crypto_news` VALUES (72, 'XRP 预测趋势: 技术性反弹', '分析理由: \n上涨10%，但基本面支撑有限，主要受技术因素驱动\n\n目标价格区间: 谨慎乐观\n', 'XRP', '持平', '价格目标区间: 谨慎乐观', '2025-11-25 11:24:03', '2025-11-25 11:24:03');
INSERT INTO `crypto_news` VALUES (73, '比特币(BTC) 预测趋势: 短期反弹，中期震荡', '分析理由: \n从83,000美元低点反弹至88,000美元，显示技术性支撑，但流动性收紧和机构资金流出构成压力\n\n目标价格区间: 85,000-92,000美元\n', '比特币(BTC)', '持平', '价格目标区间: 85,000-92,000美元', '2025-11-25 11:24:03', '2025-11-25 11:24:03');
INSERT INTO `crypto_news` VALUES (74, '以太坊(ETH) 预测趋势: 跟随比特币走势', '分析理由: \n通常跟随比特币走势，新加坡推出以太坊期货可能带来增量资金\n\n目标价格区间: 需观察比特币走势\n', '以太坊(ETH)', '持平', '价格目标区间: 需观察比特币走势', '2025-11-25 11:24:03', '2025-11-25 11:24:03');
INSERT INTO `crypto_news` VALUES (75, 'EOS 预测趋势: 高波动性', '分析理由: \n出现17%的大幅波动，显示投机性较强，风险较高\n\n目标价格区间: 波动较大，不建议重仓\n', 'EOS', '持平', '价格目标区间: 波动较大，不建议重仓', '2025-11-25 11:24:03', '2025-11-25 11:24:03');
INSERT INTO `crypto_news` VALUES (76, 'XRP 预测趋势: 技术性反弹', '分析理由: \n上涨10%，但基本面支撑有限，主要受技术因素驱动\n\n目标价格区间: 谨慎乐观\n', 'XRP', '持平', '价格目标区间: 谨慎乐观', '2025-11-25 11:24:03', '2025-11-25 11:24:03');

-- ----------------------------
-- Table structure for crypto_price_info
-- ----------------------------
DROP TABLE IF EXISTS `crypto_price_info`;
CREATE TABLE `crypto_price_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `symbol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 3) NOT NULL,
  `change` decimal(10, 3) NOT NULL,
  `change_percent` decimal(5, 2) NOT NULL,
  `trend` enum('up','down') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crypto_price_info
-- ----------------------------
INSERT INTO `crypto_price_info` VALUES (119, 1, 'Aave', 'AAVEUSD', 168.820, 2.220, 1.33, 'up', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (120, 2, 'PancakeSwap', 'CAKEUSD', 2.308, 0.050, 2.21, 'up', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (121, 3, 'Injective', 'INJUSD', 5.380, 0.010, 0.19, 'up', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (122, 4, 'ORDI', 'ORDIUSD', 3.840, 0.010, 0.26, 'up', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (123, 5, 'Lido DAO', 'LDOUSD', 0.629, 0.006, 0.96, 'up', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (124, 6, 'dYdX (ethDYDX)', 'DYDXUSD', 0.233, 0.002, 0.87, 'up', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (125, 7, '尤文图斯粉丝代币', 'JUVUSD', 0.672, 0.002, 0.30, 'up', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (126, 8, '波场币', 'TRXUSD', 0.274, 0.002, 0.58, 'up', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (127, 9, 'Ethena', 'ENAUSD', 0.238, 0.001, 0.42, 'up', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (128, 10, 'dogwifhat', 'WIFUSD', 0.336, 0.000, 0.00, 'down', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (129, 11, '柴犬币', 'SHIBUSD', 0.000, 0.000, -0.13, 'down', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (130, 12, 'Pepe', 'PEPEUSD', 0.000, 0.000, -0.48, 'down', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (131, 13, 'Bonk', 'BONKUSD', 0.000, 0.000, -0.79, 'down', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (132, 14, 'FLOKI', 'FLOKIUSD', 0.000, 0.000, -0.79, 'down', '2025-11-25 08:57:44');
INSERT INTO `crypto_price_info` VALUES (133, 15, 'JasmyCoin', 'JASMYUSD', 0.007, 0.000, -0.85, 'down', '2025-11-25 08:57:44');

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(4) NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL,
  `demo_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `demo_age` int(10) UNSIGNED NULL DEFAULT NULL,
  `demo_gender` tinyint(3) UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo
-- ----------------------------
INSERT INTO `demo` VALUES (1979406763446591490, '234', 0, 'admin', '2025-10-18 12:38:42.663', 'admin', '2025-10-18 12:38:42.663', '王麻子', 22, 1);
INSERT INTO `demo` VALUES (1985528585226383362, NULL, NULL, 'admin', '2025-11-04 10:04:38.725', 'admin', '2025-11-04 10:04:38.725', '1', 1, 1);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NULL DEFAULT NULL,
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NULL DEFAULT NULL,
  `table_id` bigint(20) NULL DEFAULT NULL,
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint(20) NULL DEFAULT NULL,
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-06-13 16:06:37', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-06-13 16:06:37', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2024-06-13 16:06:37', 'admin', '2024-07-16 11:25:33', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-06-13 16:06:37', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-06-13 16:06:37', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 'admin', '2024-06-13 16:06:37', '', NULL, 'true:开启, false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_num` int(11) NULL DEFAULT NULL,
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '物联科技', 0, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', 'admin', '2025-04-18 15:08:51');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '南宁总公司', 1, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', 'admin', '2025-04-16 21:04:21');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '柳州分公司', 2, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', 'admin', '2025-04-16 21:04:47');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', 'admin', '2025-04-16 21:04:21');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', 'admin', '2025-04-16 21:04:21');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', 'admin', '2025-04-16 21:04:21');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', 'admin', '2025-04-16 21:04:21');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', 'admin', '2025-04-16 21:04:21');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', 'admin', '2025-04-16 21:04:47');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-06-13 16:06:25', 'admin', '2025-04-16 21:04:47');
INSERT INTO `sys_dept` VALUES (1811589666899832833, 102, '0,100,102', '测试部门2', 0, '负责人', '', '', '1', '0', 'admin', '2024-07-12 10:33:29', 'admin', '2025-04-16 21:04:47');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NULL DEFAULT NULL,
  `dict_sort` int(11) NULL DEFAULT NULL,
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '1', 'sys_show_hide', '', 'primary', 'Y', '1', 'admin', '2024-06-13 16:06:36', 'admin', '2024-07-10 16:34:54', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '0', 'sys_show_hide', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:36', 'admin', '2024-07-10 16:35:07', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '1', 'sys_normal_disable', '', 'primary', 'Y', '1', 'admin', '2024-06-13 16:06:36', 'admin', '2024-07-10 14:30:58', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '0', 'sys_normal_disable', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:36', 'admin', '2024-07-10 14:31:06', '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '1', 'sys_notice_status', '', 'primary', 'Y', '1', 'admin', '2024-06-13 16:06:36', 'admin', '2024-07-10 17:24:35', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '0', 'sys_notice_status', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:36', 'admin', '2024-07-10 17:24:44', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:37', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '失败', '0', 'sys_common_status', '', 'danger', 'N', '1', 'admin', '2024-06-13 16:06:37', 'admin', '2024-07-15 10:50:52', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '成功', '1', 'sys_common_status', '', 'success', 'N', '1', 'admin', '2024-06-13 16:06:37', 'admin', '2024-07-15 10:51:05', '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (1812692503272718338, 0, '客户', '1', 'merchant_type', NULL, 'default', 'N', '1', 'admin', '2024-07-15 11:35:46', 'admin', '2024-07-16 11:21:11', NULL);
INSERT INTO `sys_dict_data` VALUES (1812694839395135489, 1, '供应商', '2', 'merchant_type', NULL, 'default', 'N', '1', 'admin', '2024-07-15 11:45:03', 'admin', '2024-07-16 11:21:29', '');
INSERT INTO `sys_dict_data` VALUES (1813051377282904066, 3, '客户/供应商', '3', 'merchant_type', NULL, 'default', 'N', '1', 'admin', '2024-07-16 11:21:48', 'admin', '2024-07-16 11:21:48', NULL);
INSERT INTO `sys_dict_data` VALUES (1813153852862160897, 0, '未入库', '0', 'wms_receipt_status', NULL, 'info', 'N', '1', 'admin', '2024-07-16 18:09:00', 'admin', '2024-07-22 09:38:14', NULL);
INSERT INTO `sys_dict_data` VALUES (1813153899775451137, 1, '已入库', '1', 'wms_receipt_status', NULL, 'primary', 'N', '1', 'admin', '2024-07-16 18:09:11', 'admin', '2024-07-22 09:38:22', NULL);
INSERT INTO `sys_dict_data` VALUES (1813397339171905537, 3, '作废', '-1', 'wms_receipt_status', NULL, 'danger', 'N', '1', 'admin', '2024-07-17 10:16:32', 'admin', '2024-07-22 09:38:29', NULL);
INSERT INTO `sys_dict_data` VALUES (1814219171351085057, 0, '生产入库', '1', 'wms_receipt_type', NULL, 'primary', 'N', '1', 'admin', '2024-07-19 16:42:12', 'admin', '2024-07-22 09:38:50', NULL);
INSERT INTO `sys_dict_data` VALUES (1814219220520910849, 1, '采购入库', '2', 'wms_receipt_type', NULL, 'primary', 'N', '1', 'admin', '2024-07-19 16:42:23', 'admin', '2024-07-22 09:38:56', NULL);
INSERT INTO `sys_dict_data` VALUES (1814219269975949313, 2, '退货入库', '3', 'wms_receipt_type', NULL, 'primary', 'N', '1', 'admin', '2024-07-19 16:42:35', 'admin', '2024-07-22 09:39:01', NULL);
INSERT INTO `sys_dict_data` VALUES (1814219304272773121, 3, '归还入库', '4', 'wms_receipt_type', NULL, 'primary', 'N', '1', 'admin', '2024-07-19 16:42:43', 'admin', '2024-07-22 09:39:06', NULL);
INSERT INTO `sys_dict_data` VALUES (1818850397680640002, 2, '作废', '-1', 'wms_shipment_status', NULL, 'danger', 'N', '1', 'admin', '2024-08-01 11:25:02', 'admin', '2024-08-01 14:25:24', NULL);
INSERT INTO `sys_dict_data` VALUES (1818850512650706945, 0, '未出库', '0', 'wms_shipment_status', NULL, 'info', 'N', '1', 'admin', '2024-08-01 11:25:29', 'admin', '2024-08-01 14:25:37', NULL);
INSERT INTO `sys_dict_data` VALUES (1818850565389885441, 1, '已出库', '1', 'wms_shipment_status', NULL, 'primary', 'N', '1', 'admin', '2024-08-01 11:25:42', 'admin', '2024-08-01 14:25:32', NULL);
INSERT INTO `sys_dict_data` VALUES (1818850814351187969, 0, '退货出库', '1', 'wms_shipment_type', NULL, 'default', 'N', '1', 'admin', '2024-08-01 11:26:41', 'admin', '2024-08-01 11:26:41', NULL);
INSERT INTO `sys_dict_data` VALUES (1818850852594851841, 1, '销售出库', '2', 'wms_shipment_type', NULL, 'default', 'N', '1', 'admin', '2024-08-01 11:26:51', 'admin', '2024-08-01 11:26:51', NULL);
INSERT INTO `sys_dict_data` VALUES (1818850884714831874, 2, '生产出库', '3', 'wms_shipment_type', NULL, 'default', 'N', '1', 'admin', '2024-08-01 11:26:58', 'admin', '2024-08-01 11:26:58', NULL);
INSERT INTO `sys_dict_data` VALUES (1821067084643434498, 0, '入库', '1', 'wms_inventory_history_type', NULL, 'primary', 'N', '1', 'admin', '2024-08-07 14:13:21', 'admin', '2024-08-07 14:57:41', NULL);
INSERT INTO `sys_dict_data` VALUES (1821067144441626625, 1, '出库', '2', 'wms_inventory_history_type', NULL, 'primary', 'N', '1', 'admin', '2024-08-07 14:13:36', 'admin', '2024-08-07 14:57:47', NULL);
INSERT INTO `sys_dict_data` VALUES (1821067181917732866, 2, '移库', '3', 'wms_inventory_history_type', NULL, 'primary', 'N', '1', 'admin', '2024-08-07 14:13:45', 'admin', '2024-08-07 14:57:54', NULL);
INSERT INTO `sys_dict_data` VALUES (1821067222455681026, 3, '盘库', '4', 'wms_inventory_history_type', NULL, 'primary', 'N', '1', 'admin', '2024-08-07 14:13:54', 'admin', '2024-08-07 14:58:06', NULL);
INSERT INTO `sys_dict_data` VALUES (1822820748966006786, 0, '未移库', '0', 'wms_movement_status', NULL, 'info', 'N', '1', 'admin', '2024-08-12 10:21:48', 'admin', '2024-08-12 10:21:48', NULL);
INSERT INTO `sys_dict_data` VALUES (1822820794864275457, 1, '已移库', '1', 'wms_movement_status', NULL, 'primary', 'N', '1', 'admin', '2024-08-12 10:21:59', 'admin', '2024-08-12 10:21:59', NULL);
INSERT INTO `sys_dict_data` VALUES (1822820855526494210, 2, '作废', '-1', 'wms_movement_status', NULL, 'danger', 'N', '1', 'admin', '2024-08-12 10:22:13', 'admin', '2024-08-12 10:22:13', NULL);
INSERT INTO `sys_dict_data` VALUES (1823182345731391489, 0, '待盘库', '0', 'wms_check_status', NULL, 'info', 'N', '1', 'admin', '2024-08-13 10:18:39', 'admin', '2024-08-13 10:18:39', NULL);
INSERT INTO `sys_dict_data` VALUES (1823182400756465666, 1, '已盘库', '1', 'wms_check_status', NULL, 'primary', 'N', '1', 'admin', '2024-08-13 10:18:52', 'admin', '2024-08-13 10:18:52', NULL);
INSERT INTO `sys_dict_data` VALUES (1823182471136886786, 2, '作废', '-1', 'wms_check_status', NULL, 'danger', 'N', '1', 'admin', '2024-08-13 10:19:09', 'admin', '2024-08-13 10:19:09', NULL);
INSERT INTO `sys_dict_data` VALUES (1984632367179681793, 2, '刑事案件', 'ajlx_xs', 'wms_ajlx', '', 'success', 'Y', '1', 'admin', '2025-11-01 22:43:23', 'admin', '2025-11-01 22:43:23', NULL);
INSERT INTO `sys_dict_data` VALUES (1984632490865512450, 2, '洗钱', 'ajlx_xq', 'wms_ajlx', NULL, 'warning', 'N', '1', 'admin', '2025-11-01 22:43:53', 'admin', '2025-11-01 22:43:53', '洗钱');
INSERT INTO `sys_dict_data` VALUES (1984847510991876097, NULL, '法院', 'ajly_fy', 'wms_ajly', NULL, 'primary', 'Y', '1', 'admin', '2025-11-02 12:58:17', 'admin', '2025-11-02 12:58:17', NULL);
INSERT INTO `sys_dict_data` VALUES (1985512067549831169, NULL, 'oihoih給您發出的', '3fssf', 'asdfsf_sdf', NULL, 'default', 'Y', '1', 'admin', '2025-11-04 08:59:00', 'admin', '2025-11-04 08:59:00', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NULL DEFAULT NULL,
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '1', 'admin', '2024-06-13 16:06:35', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '1', 'admin', '2024-06-13 16:06:36', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (1812692454547488770, '企业类型', 'merchant_type', '1', 'admin', '2024-07-15 11:35:34', 'admin', '2024-07-16 17:41:32', '企业类型');
INSERT INTO `sys_dict_type` VALUES (1813152108564373505, '入库状态', 'wms_receipt_status', '1', 'admin', '2024-07-16 18:02:04', 'admin', '2024-07-16 18:02:17', '入库状态');
INSERT INTO `sys_dict_type` VALUES (1814219082624778242, '入库类型', 'wms_receipt_type', '1', 'admin', '2024-07-19 16:41:51', 'admin', '2024-07-19 16:41:51', NULL);
INSERT INTO `sys_dict_type` VALUES (1818848671749709825, '出库状态', 'wms_shipment_status', '1', 'admin', '2024-08-01 11:18:11', 'admin', '2024-08-01 11:18:11', NULL);
INSERT INTO `sys_dict_type` VALUES (1818848738502057985, '出库类型', 'wms_shipment_type', '1', 'admin', '2024-08-01 11:18:26', 'admin', '2024-08-01 11:18:26', NULL);
INSERT INTO `sys_dict_type` VALUES (1821066855638630402, '库存记录操作类型', 'wms_inventory_history_type', '1', 'admin', '2024-08-07 14:12:27', 'admin', '2024-08-07 14:12:27', NULL);
INSERT INTO `sys_dict_type` VALUES (1822820566366982146, '移库状态', 'wms_movement_status', '1', 'admin', '2024-08-12 10:21:04', 'admin', '2024-08-12 10:21:04', NULL);
INSERT INTO `sys_dict_type` VALUES (1823182238898274306, '盘库状态', 'wms_check_status', '1', 'admin', '2024-08-13 10:18:14', 'admin', '2024-08-13 10:18:14', NULL);
INSERT INTO `sys_dict_type` VALUES (1984601879236890626, 'test_type', 'testtype', '1', 'admin', '2025-11-01 20:42:14', 'admin', '2025-11-01 20:42:14', 's ');
INSERT INTO `sys_dict_type` VALUES (1984631804455079938, '案件类型', 'wms_ajlx', '1', 'admin', '2025-11-01 22:41:09', 'admin', '2025-11-01 22:41:09', '案件类型');
INSERT INTO `sys_dict_type` VALUES (1984847348110274561, '案件来源', 'wms_ajly', '1', 'admin', '2025-11-02 12:57:39', 'admin', '2025-11-02 12:57:39', '案件来源');
INSERT INTO `sys_dict_type` VALUES (1985511787458404354, '的手法首發', 'asdfsf_sdf', '1', 'admin', '2025-11-04 08:57:53', 'admin', '2025-11-04 08:57:53', '的手法首發');
INSERT INTO `sys_dict_type` VALUES (1985532190222282754, 'a', 'a', '1', 'admin', '2025-11-04 10:18:58', 'admin', '2025-11-04 10:18:58', 'a');
INSERT INTO `sys_dict_type` VALUES (1985538044988321794, 'b', 'b', '1', 'admin', '2025-11-04 10:42:14', 'admin', '2025-11-04 10:42:14', 'b');
INSERT INTO `sys_dict_type` VALUES (1985551591951224833, '承担单位', 'sys_basi_danwei', '1', 'admin', '2025-11-04 11:36:04', 'admin', '2025-11-04 11:36:04', '承担单位');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NULL DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_time` datetime NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1979357793072566273, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-10-18 09:24:07');
INSERT INTO `sys_logininfor` VALUES (1980106057921179650, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '验证码错误', '2025-10-20 10:57:27');
INSERT INTO `sys_logininfor` VALUES (1980106184874373122, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-10-20 10:57:57');
INSERT INTO `sys_logininfor` VALUES (1984599738296356866, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-01 20:33:44');
INSERT INTO `sys_logininfor` VALUES (1984612375746891777, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-01 21:23:57');
INSERT INTO `sys_logininfor` VALUES (1984614630738939906, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-01 21:32:54');
INSERT INTO `sys_logininfor` VALUES (1984614959111000065, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-01 21:34:13');
INSERT INTO `sys_logininfor` VALUES (1984621892647833602, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-01 22:01:46');
INSERT INTO `sys_logininfor` VALUES (1984622579590942722, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-01 22:04:30');
INSERT INTO `sys_logininfor` VALUES (1984846632104837121, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-02 12:54:48');
INSERT INTO `sys_logininfor` VALUES (1985278857153699841, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-03 17:32:18');
INSERT INTO `sys_logininfor` VALUES (1985374271848677377, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-03 23:51:27');
INSERT INTO `sys_logininfor` VALUES (1985374384625123329, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '验证码错误', '2025-11-03 23:51:54');
INSERT INTO `sys_logininfor` VALUES (1985374396444672002, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '验证码错误', '2025-11-03 23:51:57');
INSERT INTO `sys_logininfor` VALUES (1985374414098497537, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-03 23:52:01');
INSERT INTO `sys_logininfor` VALUES (1985374714779762690, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '验证码已失效', '2025-11-03 23:53:13');
INSERT INTO `sys_logininfor` VALUES (1985374733041762306, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-03 23:53:17');
INSERT INTO `sys_logininfor` VALUES (1985509706369560578, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-04 08:49:37');
INSERT INTO `sys_logininfor` VALUES (1985511475569958914, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '验证码已失效', '2025-11-04 08:56:39');
INSERT INTO `sys_logininfor` VALUES (1985511500601565185, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '验证码错误', '2025-11-04 08:56:45');
INSERT INTO `sys_logininfor` VALUES (1985511525905801218, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-04 08:56:51');
INSERT INTO `sys_logininfor` VALUES (1985511881751990274, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '验证码已失效', '2025-11-04 08:58:16');
INSERT INTO `sys_logininfor` VALUES (1985512220920188930, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-04 08:59:37');
INSERT INTO `sys_logininfor` VALUES (1985528171642843138, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-04 10:03:00');
INSERT INTO `sys_logininfor` VALUES (1985531727217258498, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-04 10:17:08');
INSERT INTO `sys_logininfor` VALUES (1987744075502510082, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-10 12:48:13');
INSERT INTO `sys_logininfor` VALUES (1988804458103357441, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-13 11:01:48');
INSERT INTO `sys_logininfor` VALUES (1989287077391777793, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-14 18:59:33');
INSERT INTO `sys_logininfor` VALUES (1989288631574347778, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-14 19:05:44');
INSERT INTO `sys_logininfor` VALUES (1989510396430938113, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-15 09:46:56');
INSERT INTO `sys_logininfor` VALUES (1990583566697222146, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-18 08:51:20');
INSERT INTO `sys_logininfor` VALUES (1992212773093179394, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-22 20:45:13');
INSERT INTO `sys_logininfor` VALUES (1992457033419735042, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-23 12:55:49');
INSERT INTO `sys_logininfor` VALUES (1992961648242348033, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-24 22:20:59');
INSERT INTO `sys_logininfor` VALUES (1993109269598642177, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-25 08:07:35');
INSERT INTO `sys_logininfor` VALUES (1993300244879011841, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-25 20:46:27');
INSERT INTO `sys_logininfor` VALUES (1993568288662495234, 'admin', '0:0:0:0:0:0:0:1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-11-26 14:31:33');
INSERT INTO `sys_logininfor` VALUES (2001628111395123202, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '0', '验证码错误', '2025-12-18 20:18:25');
INSERT INTO `sys_logininfor` VALUES (2001629116748820482, 'admin', '127.0.0.1', '内网IP', 'MSEdge', 'Windows 10 or Windows Server 2016', '1', '登录成功', '2025-12-18 20:22:25');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NULL DEFAULT NULL,
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `order_num` int(11) NULL DEFAULT NULL,
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `query_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_frame` int(11) NULL DEFAULT NULL,
  `is_cache` int(11) NULL DEFAULT NULL,
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 1061, 110, 'system', NULL, '', 0, 0, 'M', '1', '1', '', 'system', 'admin', '2024-06-13 16:06:26', 'admin', '2025-06-10 11:04:44', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 120, 'monitor', NULL, '', 0, 0, 'M', '1', '1', '', 'monitor', 'admin', '2024-06-13 16:06:26', 'admin', '2024-08-20 13:45:57', '系统监控目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 0, 0, 'C', '1', '1', 'system:user:list', 'user', 'admin', '2024-06-13 16:06:26', 'admin', '2025-04-04 17:03:08', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 0, 0, 'C', '1', '1', 'system:role:list', 'peoples', 'admin', '2024-06-13 16:06:26', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 0, 0, 'C', '1', '1', 'system:menu:list', 'tree-table', 'admin', '2024-06-13 16:06:26', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 0, 0, 'C', '1', '1', 'system:dept:list', 'tree', 'admin', '2024-06-13 16:06:26', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 0, 0, 'C', '1', '1', 'system:post:list', 'post', 'admin', '2024-06-13 16:06:26', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 0, 0, 'C', '1', '1', 'system:dict:list', 'dict', 'admin', '2024-06-13 16:06:26', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 0, 0, 'C', '1', '1', 'system:config:list', 'edit', 'admin', '2024-06-13 16:06:26', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 0, 0, 'C', '1', '1', 'system:notice:list', 'message', 'admin', '2024-06-13 16:06:26', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1061, 140, 'log', '', '', 0, 0, 'M', '1', '1', '', 'log', 'admin', '2024-06-13 16:06:27', 'admin', '2025-06-10 11:05:08', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 0, 0, 'C', '1', '1', 'monitor:online:list', 'online', 'admin', '2024-06-13 16:06:27', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (112, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 0, 0, 'C', '1', '1', 'monitor:cache:list', 'redis-list', 'admin', '2024-06-13 16:06:27', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 0, 0, 'C', '1', '1', 'monitor:cache:list', 'redis', 'admin', '2024-06-13 16:06:27', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 0, 130, 'gen', 'tool/gen/index', '', 0, 0, 'C', '0', '1', 'tool:gen:list', 'code', 'admin', '2024-06-13 16:06:27', 'admin', '2025-06-10 11:04:58', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 0, 0, 'C', '1', '1', 'monitor:operlog:list', 'form', 'admin', '2024-06-13 16:06:27', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 0, 0, 'C', '1', '1', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-06-13 16:06:27', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 0, 0, 'F', '1', '1', 'system:user:query', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 0, 0, 'F', '1', '1', 'system:user:add', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 0, 0, 'F', '1', '1', 'system:user:edit', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 0, 0, 'F', '1', '1', 'system:user:remove', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 0, 0, 'F', '1', '1', 'system:user:export', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 0, 0, 'F', '1', '1', 'system:user:import', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 0, 0, 'F', '1', '1', 'system:user:resetPwd', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 0, 0, 'F', '1', '1', 'system:role:query', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 0, 0, 'F', '1', '1', 'system:role:add', '#', 'admin', '2024-06-13 16:06:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 0, 0, 'F', '1', '1', 'system:role:edit', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 0, 0, 'F', '1', '1', 'system:role:remove', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 0, 0, 'F', '1', '1', 'system:role:export', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 0, 0, 'F', '1', '1', 'system:menu:query', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 0, 0, 'F', '1', '1', 'system:menu:add', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 0, 0, 'F', '1', '1', 'system:menu:edit', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 0, 0, 'F', '1', '1', 'system:menu:remove', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 0, 0, 'F', '1', '1', 'system:dept:query', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 0, 0, 'F', '1', '1', 'system:dept:add', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 0, 0, 'F', '1', '1', 'system:dept:edit', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 0, 0, 'F', '1', '1', 'system:dept:remove', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 0, 0, 'F', '1', '1', 'system:post:query', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 0, 0, 'F', '1', '1', 'system:post:add', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 0, 0, 'F', '1', '1', 'system:post:edit', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 0, 0, 'F', '1', '1', 'system:post:remove', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 0, 0, 'F', '1', '1', 'system:post:export', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 0, 0, 'F', '1', '1', 'system:dict:query', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 0, 0, 'F', '1', '1', 'system:dict:add', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 0, 0, 'F', '1', '1', 'system:dict:edit', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 0, 0, 'F', '1', '1', 'system:dict:remove', '#', 'admin', '2024-06-13 16:06:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 0, 0, 'F', '1', '1', 'system:dict:export', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 0, 0, 'F', '1', '1', 'system:config:query', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 0, 0, 'F', '1', '1', 'system:config:add', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 0, 0, 'F', '1', '1', 'system:config:edit', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 0, 0, 'F', '1', '1', 'system:config:remove', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 0, 0, 'F', '1', '1', 'system:config:export', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 0, 0, 'F', '1', '1', 'system:notice:query', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 0, 0, 'F', '1', '1', 'system:notice:add', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 0, 0, 'F', '1', '1', 'system:notice:edit', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 0, 0, 'F', '1', '1', 'system:notice:remove', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:operlog:query', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:operlog:remove', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:operlog:export', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:logininfor:query', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:logininfor:remove', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:logininfor:export', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:online:query', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:online:batchLogout', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:online:forceLogout', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '账户解锁', 501, 4, '#', '', '', 0, 0, 'F', '1', '1', 'monitor:logininfor:unlock', '#', 'admin', '2024-06-13 16:06:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 0, 0, 'F', '1', '1', 'tool:gen:query', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 0, 0, 'F', '1', '1', 'tool:gen:edit', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 0, 0, 'F', '1', '1', 'tool:gen:remove', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 0, 0, 'F', '1', '1', 'tool:gen:import', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 0, 0, 'F', '1', '1', 'tool:gen:preview', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 0, 0, 'F', '1', '1', 'tool:gen:code', '#', 'admin', '2024-06-13 16:06:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '基础信息管理', 0, 100, 'basic-info', NULL, NULL, 0, 0, 'M', '1', '1', NULL, 'BorderOuterOutlined', 'admin', '2024-07-04 15:01:48', 'admin', '2025-06-11 17:51:59', '');
INSERT INTO `sys_menu` VALUES (1809059968309743618, '往来单位', 1909128585102680066, 1, 'merchant', 'wms/basic/merchant/index', NULL, 0, 0, 'C', '1', '1', 'wms:merchant:list', 'documentation', 'admin', '2024-07-05 11:58:12', 'admin', '2025-06-11 17:51:29', '往来单位菜单');
INSERT INTO `sys_menu` VALUES (1809059968309743619, '往来单位查询', 1809059968309743618, 1, '#', '', NULL, 0, 0, 'F', '1', '1', 'wms:merchant:list', '#', 'admin', '2024-07-05 11:58:12', 'admin', '2024-08-30 10:43:54', '');
INSERT INTO `sys_menu` VALUES (1809059968309743621, '往来单位修改', 1809059968309743618, 3, '#', '', NULL, 0, 0, 'F', '1', '1', 'wms:merchant:edit', '#', 'admin', '2024-07-05 11:58:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1813458070128599041, '仓库/库区', 1909128585102680066, 2, 'warehouse', 'wms/basic/warehouse/index', NULL, 0, 0, 'C', '1', '1', 'wms:warehouse:list', 'documentation', 'admin', '2024-07-17 14:17:51', 'admin', '2025-06-11 17:51:40', '');
INSERT INTO `sys_menu` VALUES (1813820131794837506, '商品管理', 1909128585102680066, 4, 'item', 'wms/basic/item/index', NULL, 0, 0, 'C', '1', '1', 'wms:item:list', 'documentation', 'admin', '2024-07-18 14:16:33', 'admin', '2025-06-11 17:53:47', '');
INSERT INTO `sys_menu` VALUES (1815207165755183105, '编辑入库单', 1818466281474822145, 1000, 'receiptOrderEdit', 'wms/order/receipt/edit', NULL, 0, 0, 'F', '0', '1', 'wms:receipt:edit', '#', 'admin', '2024-07-22 10:08:08', 'admin', '2025-06-10 10:30:07', '');
INSERT INTO `sys_menu` VALUES (1818123963605549057, '品牌管理', 1909128585102680066, 3, 'itemBrand', 'wms/basic/itemBrand/index', NULL, 0, 0, 'C', '1', '1', 'wms:itemBrand:list', 'documentation', 'admin', '2024-07-30 11:18:27', 'admin', '2025-06-11 17:51:49', '');
INSERT INTO `sys_menu` VALUES (1818466281474822145, '入库', 1909128585102680065, 20, 'receiptOrder', 'wms/order/receipt/index', NULL, 0, 0, 'C', '1', '1', 'wms:receipt:all', 'exit-fullscreen', 'admin', '2024-07-31 09:58:42', 'admin', '2025-04-07 14:19:25', '');
INSERT INTO `sys_menu` VALUES (1818854933803638785, '出库', 1909128585102680065, 30, 'shipmentOrder', 'wms/order/shipment/index', NULL, 0, 0, 'C', '1', '1', 'wms:shipment:all', 'fullscreen', 'admin', '2024-08-01 11:43:04', 'admin', '2025-04-07 14:19:40', '');
INSERT INTO `sys_menu` VALUES (1818855673632727042, '编辑出库单', 1818854933803638785, 1000, 'shipmentOrderEdit', 'wms/order/shipment/edit', NULL, 0, 0, 'F', '0', '1', 'wms:shipment:edit', '#', 'admin', '2024-08-01 11:46:00', 'admin', '2025-06-10 10:29:50', '');
INSERT INTO `sys_menu` VALUES (1820729144067321858, '库存统计', 1909128585102680065, 0, 'inventory', 'wms/inventory/statistic', NULL, 0, 0, 'C', '1', '1', 'wms:inventory:all', 'DotChartOutlined', 'admin', '2024-08-06 15:50:30', 'admin', '2025-04-07 14:18:51', '');
INSERT INTO `sys_menu` VALUES (1821075355068559361, '库存记录', 1909128585102680065, 3, 'inventoryHistory', 'wms/inventory/history', NULL, 0, 0, 'C', '1', '1', 'wms:inventoryHistory:all', 'list', 'admin', '2024-08-07 14:46:13', 'admin', '2025-04-07 14:19:14', '');
INSERT INTO `sys_menu` VALUES (1822820194307051521, '移库', 1909128585102680065, 40, 'movementOrder', 'wms/order/movement/index', NULL, 0, 0, 'C', '1', '1', 'wms:movement:all', 'drag', 'admin', '2024-08-12 10:19:35', 'admin', '2025-04-07 14:19:48', '');
INSERT INTO `sys_menu` VALUES (1822862323595145218, '编辑移库单', 1822820194307051521, 1000, 'movementOrderEdit', 'wms/order/movement/edit', NULL, 0, 0, 'F', '0', '1', 'wms:movement:edit', '#', 'admin', '2024-08-12 13:07:00', 'admin', '2025-06-10 10:29:38', '');
INSERT INTO `sys_menu` VALUES (1823187248797270018, '盘库', 1909128585102680065, 50, 'checkOrder', 'wms/order/check/index', NULL, 0, 0, 'C', '1', '1', 'wms:check:all', 'example', 'admin', '2024-08-13 10:38:08', 'admin', '2025-04-07 14:19:56', '');
INSERT INTO `sys_menu` VALUES (1823190638784757762, '编辑盘库单', 1823187248797270018, 1000, 'checkOrderEdit', 'wms/order/check/edit', NULL, 0, 0, 'C', '0', '1', 'wms:check:edit', '#', 'admin', '2024-08-13 10:51:36', 'admin', '2025-06-10 10:29:18', '');
INSERT INTO `sys_menu` VALUES (1825769009480142850, '库存明细', 1909128585102680065, 1, 'inventoryDetail', 'wms/inventory/detail', NULL, 0, 0, 'C', '1', '1', 'wms:inventoryDetail:all', 'table', 'admin', '2024-08-20 13:37:08', 'admin', '2025-04-07 14:19:05', '');
INSERT INTO `sys_menu` VALUES (1829349433573822466, '仓库库区查询', 1813458070128599041, 1, '', NULL, NULL, 0, 0, 'F', '1', '1', 'wms:warehouse:list', '#', 'admin', '2024-08-30 10:44:27', 'admin', '2024-08-30 10:44:27', '');
INSERT INTO `sys_menu` VALUES (1829350022131142658, '仓库库区编辑', 1813458070128599041, 2, '', NULL, NULL, 0, 0, 'F', '1', '1', 'wms:warehouse:edit', '#', 'admin', '2024-08-30 10:46:48', 'admin', '2024-08-30 10:46:48', '');
INSERT INTO `sys_menu` VALUES (1829350164603260929, '品牌查询', 1818123963605549057, 1, '', NULL, NULL, 0, 0, 'F', '1', '1', 'wms:itemBrand:list', '#', 'admin', '2024-08-30 10:47:22', 'admin', '2024-08-30 10:47:22', '');
INSERT INTO `sys_menu` VALUES (1829350944311791617, '品牌编辑', 1818123963605549057, 2, '', NULL, NULL, 0, 0, 'F', '1', '1', 'wms:itemBrand:edit', '#', 'admin', '2024-08-30 10:50:27', 'admin', '2024-08-30 10:50:27', '');
INSERT INTO `sys_menu` VALUES (1829351081448755202, '商品查询', 1813820131794837506, 1, '', NULL, NULL, 0, 0, 'F', '1', '1', 'wms:item:list', '#', 'admin', '2024-08-30 10:51:00', 'admin', '2024-08-30 10:51:00', '');
INSERT INTO `sys_menu` VALUES (1829351166857367553, '商品编辑', 1813820131794837506, 2, '', NULL, NULL, 0, 0, 'F', '1', '1', 'wms:item:edit', '#', 'admin', '2024-08-30 10:51:21', 'admin', '2024-08-30 10:51:21', '');
INSERT INTO `sys_menu` VALUES (1909128585102680065, '业务操作管理', 0, 105, 'warehouse-mng', NULL, NULL, 0, 0, 'M', '1', '1', NULL, 'documentation', 'admin', '2025-04-07 14:18:19', 'admin', '2025-06-10 10:32:00', '');
INSERT INTO `sys_menu` VALUES (1909128585102680066, '基础信息设置', 1061, 100, 'basic', NULL, NULL, 0, 0, 'M', '1', '1', NULL, 'BorderOuterOutlined', 'admin', '2024-07-04 15:01:48', 'admin', '2025-06-10 10:59:19', '');
INSERT INTO `sys_menu` VALUES (1984610788005695489, '字典内容', 1, 6, 'dict-data', 'system/dictData/index', NULL, 0, 0, 'C', '0', '1', NULL, 'BorderRightOutlined', 'admin', '2025-11-01 21:17:38', 'admin', '2025-11-01 22:04:12', NULL);
INSERT INTO `sys_menu` VALUES (1985279865535684610, '案件信息', 1909128585102680065, 1, 'case-info', 'wms/caseInfo/index', NULL, 0, 0, 'C', '1', '1', NULL, 'BorderInnerOutlined', 'admin', '2025-11-03 17:36:19', 'admin', '2025-11-03 17:36:19', NULL);
INSERT INTO `sys_menu` VALUES (1989514824827432962, '虚拟货币行情', 0, 1, 'getList', NULL, NULL, 0, 0, 'M', '1', '1', NULL, 'BorderOuterOutlined', 'admin', '2025-11-15 10:04:32', 'admin', '2025-11-15 10:19:40', NULL);
INSERT INTO `sys_menu` VALUES (1989525225212375042, '行情', 1989514824827432962, 1, 'Main', 'GetList/Main/index', NULL, 0, 0, 'C', '1', '1', NULL, 'BorderOuterOutlined', 'admin', '2025-11-15 10:45:52', 'admin', '2025-11-15 10:45:52', NULL);
INSERT INTO `sys_menu` VALUES (1990585388379918337, '智能推荐', 0, 1, 'GetListAi', NULL, NULL, 0, 0, 'M', '1', '1', NULL, 'BorderOuterOutlined', 'admin', '2025-11-18 08:58:35', 'admin', '2025-11-18 08:58:35', NULL);
INSERT INTO `sys_menu` VALUES (1990585657213833218, '推荐', 1990585388379918337, 1, 'Main', 'GetListAi/Main/index', NULL, 0, 0, 'C', '1', '1', NULL, 'BorderOuterOutlined', 'admin', '2025-11-18 08:59:39', 'admin', '2025-11-18 08:59:39', NULL);
INSERT INTO `sys_menu` VALUES (1992220304645488641, '新闻数据', 0, 1, 'Get', NULL, NULL, 0, 0, 'M', '1', '1', NULL, 'BorderOuterOutlined', 'admin', '2025-11-22 21:15:09', 'admin', '2025-11-26 14:33:10', NULL);
INSERT INTO `sys_menu` VALUES (1992220790484303874, '新闻数据', 1992220304645488641, 1, 'Main', 'Get/Main/index', NULL, 0, 0, 'C', '1', '1', NULL, 'BorderOuterOutlined', 'admin', '2025-11-22 21:17:05', 'admin', '2025-11-26 14:33:16', NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint(20) NULL DEFAULT NULL,
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `notice_content` longblob NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '1', 'admin', '2024-06-13 16:06:38', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '1', 'admin', '2024-06-13 16:06:38', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NULL DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `business_type` int(11) NULL DEFAULT NULL,
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `operator_type` int(11) NULL DEFAULT NULL,
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oper_time` datetime NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1979405933611945986, '演示添加', 1, 'com.ruoyi.wms.controller.DemoController.addDemo()', 'POST', 1, 'admin', '研发部门', '/wms/demo/add', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"demoName\":\"大番薯33444\",\"demoAge\":200,\"demoGender\":1,\"remark\":\"444\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-10-18 12:35:23');
INSERT INTO `sys_oper_log` VALUES (1979406785114365954, '演示添加', 1, 'com.ruoyi.wms.controller.DemoController.addDemo()', 'POST', 1, 'admin', '研发部门', '/wms/demo/add', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"demoName\":\"王麻子\",\"demoAge\":22,\"demoGender\":1,\"remark\":\"234\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-10-18 12:38:47');
INSERT INTO `sys_oper_log` VALUES (1984601879337553922, '字典类型', 1, 'com.ruoyi.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"test_type\",\"dictType\":\"testtype\",\"status\":\"1\",\"remark\":\"s \"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-01 20:42:14');
INSERT INTO `sys_oper_log` VALUES (1984610788043444225, '菜单管理', 1, 'com.ruoyi.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":1,\"menuName\":\"系统菜单\",\"orderNum\":3,\"path\":\"dictdata\",\"component\":\"System/DictData/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderRightOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-01 21:17:38');
INSERT INTO `sys_oper_log` VALUES (1984610921036435457, '菜单管理', 2, 'com.ruoyi.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1984610788005695489\",\"parentId\":1,\"menuName\":\"字典维护\",\"orderNum\":3,\"path\":\"dictdata\",\"component\":\"System/DictData/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderRightOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-01 21:18:10');
INSERT INTO `sys_oper_log` VALUES (1984611065400184834, '菜单管理', 2, 'com.ruoyi.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1984610788005695489\",\"parentId\":1,\"menuName\":\"字典维护\",\"orderNum\":6,\"path\":\"dictdata\",\"component\":\"System/DictData/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderRightOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-01 21:18:44');
INSERT INTO `sys_oper_log` VALUES (1984611498550153218, '菜单管理', 2, 'com.ruoyi.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1984610788005695489\",\"parentId\":1,\"menuName\":\"字典维护\",\"orderNum\":6,\"path\":\"dictdata\",\"component\":\"System/DictData/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderRightOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-01 21:20:28');
INSERT INTO `sys_oper_log` VALUES (1984612923594297346, '菜单管理', 2, 'com.ruoyi.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1984610788005695489\",\"parentId\":1,\"menuName\":\"字典内容\",\"orderNum\":6,\"path\":\"dictdata\",\"component\":\"System/DictData/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderRightOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-01 21:26:07');
INSERT INTO `sys_oper_log` VALUES (1984614806694187010, '菜单管理', 2, 'com.ruoyi.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1984610788005695489\",\"parentId\":1,\"menuName\":\"字典内容\",\"orderNum\":6,\"path\":\"dictdata\",\"component\":\"Dystem/DictData/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderRightOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-01 21:33:36');
INSERT INTO `sys_oper_log` VALUES (1984618050757644289, '菜单管理', 2, 'com.ruoyi.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1984610788005695489\",\"parentId\":1,\"menuName\":\"字典内容\",\"orderNum\":6,\"path\":\"dict-data\",\"component\":\"system/dictData/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderRightOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-01 21:46:30');
INSERT INTO `sys_oper_log` VALUES (1984622505943158785, '菜单管理', 2, 'com.ruoyi.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1984610788005695489\",\"parentId\":1,\"menuName\":\"字典内容\",\"orderNum\":6,\"path\":\"dict-data\",\"component\":\"system/dictData/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"1\",\"icon\":\"BorderRightOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-01 22:04:12');
INSERT INTO `sys_oper_log` VALUES (1984631804517994497, '字典类型', 1, 'com.ruoyi.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"案件类型\",\"dictType\":\"wms_ajlx\",\"status\":\"1\",\"remark\":\"案件类型\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-01 22:41:09');
INSERT INTO `sys_oper_log` VALUES (1984632367334871041, '字典数据', 1, 'com.ruoyi.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":2,\"dictLabel\":\"刑事案件\",\"dictValue\":\"1\",\"dictType\":\"wms_ajlx\",\"cssClass\":\"\",\"listClass\":\"success\",\"isDefault\":\"Y\",\"status\":\"1\",\"createDept\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-01 22:43:23');
INSERT INTO `sys_oper_log` VALUES (1984632490961981441, '字典数据', 1, 'com.ruoyi.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":2,\"dictLabel\":\"洗钱\",\"dictValue\":\"2\",\"dictType\":\"wms_ajlx\",\"cssClass\":null,\"listClass\":\"warning\",\"isDefault\":\"N\",\"status\":\"1\",\"createDept\":null,\"remark\":\"洗钱\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-01 22:43:53');
INSERT INTO `sys_oper_log` VALUES (1984847348718448642, '字典类型', 1, 'com.ruoyi.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"案件来源\",\"dictType\":\"wms_ajly\",\"status\":\"1\",\"remark\":\"案件来源\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-02 12:57:39');
INSERT INTO `sys_oper_log` VALUES (1984847511058984961, '字典数据', 1, 'com.ruoyi.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":null,\"dictLabel\":\"法院\",\"dictValue\":\"1kksdfa\",\"dictType\":\"wms_ajly\",\"cssClass\":null,\"listClass\":\"primary\",\"isDefault\":\"Y\",\"status\":\"1\",\"createDept\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-02 12:58:17');
INSERT INTO `sys_oper_log` VALUES (1985279865669902337, '菜单管理', 1, 'com.ruoyi.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":\"1909128585102680065\",\"menuName\":\"案件信息\",\"orderNum\":1,\"path\":\"case-info\",\"component\":\"wms/caseInfo/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderInnerOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-03 17:36:19');
INSERT INTO `sys_oper_log` VALUES (1985511787575844866, '字典类型', 1, 'com.ruoyi.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"的手法首發\",\"dictType\":\"asdfsf_sdf\",\"status\":\"1\",\"remark\":\"的手法首發\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-04 08:57:53');
INSERT INTO `sys_oper_log` VALUES (1985512071874158594, '字典数据', 1, 'com.ruoyi.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":null,\"dictLabel\":\"oihoih給您發出的\",\"dictValue\":\"3fssf\",\"dictType\":\"asdfsf_sdf\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":\"Y\",\"status\":\"1\",\"createDept\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-04 08:59:01');
INSERT INTO `sys_oper_log` VALUES (1985528585352212482, '演示添加', 1, 'com.ruoyi.wms.controller.DemoController.addDemo()', 'POST', 1, 'admin', '研发部门', '/wms/demo/add', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"demoName\":\"1\",\"demoAge\":1,\"demoGender\":1,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-04 10:04:39');
INSERT INTO `sys_oper_log` VALUES (1985532190348111874, '字典类型', 1, 'com.ruoyi.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"a\",\"dictType\":\"a\",\"status\":\"1\",\"remark\":\"a\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-04 10:18:58');
INSERT INTO `sys_oper_log` VALUES (1985538044988321795, '字典类型', 1, 'com.ruoyi.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"b\",\"dictType\":\"b\",\"status\":\"1\",\"remark\":\"b\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-04 10:42:14');
INSERT INTO `sys_oper_log` VALUES (1985551592307740673, '字典类型', 1, 'com.ruoyi.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"承担单位\",\"dictType\":\"sys_basi_danwei\",\"status\":\"1\",\"remark\":\"承担单位\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-04 11:36:04');
INSERT INTO `sys_oper_log` VALUES (1989288430419722241, '用户管理', 1, 'com.ruoyi.system.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"userId\":\"1989288430029651970\",\"deptId\":100,\"userName\":\"user\",\"nickName\":\"user\",\"userType\":null,\"email\":null,\"phonenumber\":\"15777036025\",\"sex\":\"0\",\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[\"1829105952432427010\"],\"postIds\":[4],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-14 19:04:56');
INSERT INTO `sys_oper_log` VALUES (1989514824978427906, '菜单管理', 1, 'com.ruoyi.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":0,\"menuName\":\"虚拟货币行情\",\"orderNum\":1,\"path\":\"getList\",\"component\":null,\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"LeftCircleOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-15 10:04:32');
INSERT INTO `sys_oper_log` VALUES (1989518386286456833, '菜单管理', 1, 'com.ruoyi.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":\"1989514824827432962\",\"menuName\":\"行情\",\"orderNum\":1,\"path\":\"getListIndex\",\"component\":\"getList/getList/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"SwapLeftOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-15 10:18:41');
INSERT INTO `sys_oper_log` VALUES (1989518630613053441, '菜单管理', 2, 'com.ruoyi.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1989514824827432962\",\"parentId\":0,\"menuName\":\"虚拟货币行情\",\"orderNum\":1,\"path\":\"getList\",\"component\":null,\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderOuterOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-15 10:19:40');
INSERT INTO `sys_oper_log` VALUES (1989521429417586691, '菜单管理', 1, 'com.ruoyi.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":\"1989514824827432962\",\"menuName\":\"行情2\",\"orderNum\":2,\"path\":\"getListindex\",\"component\":\"getList/getList/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderOuterOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-15 10:30:47');
INSERT INTO `sys_oper_log` VALUES (1989523254392811521, '菜单管理', 3, 'com.ruoyi.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1989518386240319490', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-15 10:38:02');
INSERT INTO `sys_oper_log` VALUES (1989523262374572034, '菜单管理', 3, 'com.ruoyi.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1989521429417586690', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-15 10:38:04');
INSERT INTO `sys_oper_log` VALUES (1989523612573790210, '菜单管理', 1, 'com.ruoyi.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":\"1989514824827432962\",\"menuName\":\"行情\",\"orderNum\":100,\"path\":\"main\",\"component\":\"getList/main/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderOuterOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-15 10:39:27');
INSERT INTO `sys_oper_log` VALUES (1989524033958735873, '菜单管理', 1, 'com.ruoyi.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":\"1909128585102680066\",\"menuName\":\"行情\",\"orderNum\":1,\"path\":\"main\",\"component\":\"getList/main/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderOuterOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-15 10:41:08');
INSERT INTO `sys_oper_log` VALUES (1989524933787938818, '菜单管理', 3, 'com.ruoyi.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1989524033929375746', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-15 10:44:42');
INSERT INTO `sys_oper_log` VALUES (1989524943229317121, '菜单管理', 3, 'com.ruoyi.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1989523612523458561', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-15 10:44:45');
INSERT INTO `sys_oper_log` VALUES (1989525225262706689, '菜单管理', 1, 'com.ruoyi.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":\"1989514824827432962\",\"menuName\":\"行情\",\"orderNum\":1,\"path\":\"Main\",\"component\":\"GetList/Main/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderOuterOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-15 10:45:52');
INSERT INTO `sys_oper_log` VALUES (1989526406877835266, '菜单管理', 1, 'com.ruoyi.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":1061,\"menuName\":\"行情\",\"orderNum\":1,\"path\":\"GetList\",\"component\":\"Wms/GetList/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderOuterOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-15 10:50:34');
INSERT INTO `sys_oper_log` VALUES (1989529173595942914, '菜单管理', 3, 'com.ruoyi.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1989526406852669442', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-15 11:01:33');
INSERT INTO `sys_oper_log` VALUES (1990585388660936706, '菜单管理', 1, 'com.ruoyi.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":0,\"menuName\":\"智能推荐\",\"orderNum\":1,\"path\":\"GetListAi\",\"component\":null,\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderOuterOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-18 08:58:35');
INSERT INTO `sys_oper_log` VALUES (1990585657243193346, '菜单管理', 1, 'com.ruoyi.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":\"1990585388379918337\",\"menuName\":\"推荐\",\"orderNum\":1,\"path\":\"Main\",\"component\":\"GetListAi/Main/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderOuterOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-18 08:59:39');
INSERT INTO `sys_oper_log` VALUES (1992220304842620930, '菜单管理', 1, 'com.ruoyi.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":0,\"menuName\":\"可视化\",\"orderNum\":1,\"path\":\"Get\",\"component\":null,\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderOuterOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-22 21:15:09');
INSERT INTO `sys_oper_log` VALUES (1992220790547218433, '菜单管理', 1, 'com.ruoyi.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":\"1992220304645488641\",\"menuName\":\"可视化\",\"orderNum\":1,\"path\":\"Main\",\"component\":\"Get/Main/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderOuterOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-22 21:17:05');
INSERT INTO `sys_oper_log` VALUES (1993568695640006658, '菜单管理', 2, 'com.ruoyi.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1992220304645488641\",\"parentId\":0,\"menuName\":\"新闻数据\",\"orderNum\":1,\"path\":\"Get\",\"component\":null,\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderOuterOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-26 14:33:10');
INSERT INTO `sys_oper_log` VALUES (1993568717496524801, '菜单管理', 2, 'com.ruoyi.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1992220790484303874\",\"parentId\":\"1992220304645488641\",\"menuName\":\"新闻数据\",\"orderNum\":1,\"path\":\"Main\",\"component\":\"Get/Main/index\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"icon\":\"BorderOuterOutlined\",\"remark\":null,\"path2\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, NULL, '2025-11-26 14:33:16');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint(20) NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `service` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config`  (
  `oss_config_id` bigint(20) NULL DEFAULT NULL,
  `config_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_https` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `access_policy` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ext1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
INSERT INTO `sys_oss_config` VALUES (1, 'minio', 'ruoyi', 'ruoyi123', 'ruoyi', '', '127.0.0.1:9000', '', 'N', '', '1', '0', '', 'admin', '2024-06-13 16:06:38', 'admin', '2024-08-16 16:48:05', NULL);
INSERT INTO `sys_oss_config` VALUES (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '0', '', 'admin', '2024-06-13 16:06:38', 'admin', '2024-06-13 16:06:38', NULL);
INSERT INTO `sys_oss_config` VALUES (3, 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '0', '', 'admin', '2024-06-13 16:06:38', 'admin', '2024-07-10 17:50:41', NULL);
INSERT INTO `sys_oss_config` VALUES (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '0', '', 'admin', '2024-06-13 16:06:38', 'admin', '2024-06-13 16:06:38', NULL);
INSERT INTO `sys_oss_config` VALUES (5, 'image', 'ruoyi', 'ruoyi123', 'ruoyi', 'image', '127.0.0.1:9000', '', 'N', '', '1', '0', '', 'admin', '2024-06-13 16:06:38', 'admin', '2024-06-13 16:06:38', NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NULL DEFAULT NULL,
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `post_sort` int(11) NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '1', 'admin', '2024-06-13 16:06:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '1', 'admin', '2024-06-13 16:06:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '1', 'admin', '2024-06-13 16:06:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '1', 'admin', '2024-06-13 16:06:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (1811656351757385729, 'caiwu8989', '财务', 5, '1', 'admin', '2024-07-12 22:58:28', 'admin', '2024-07-12 14:58:38', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NULL DEFAULT NULL,
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_sort` int(11) NULL DEFAULT NULL,
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_check_strictly` tinyint(1) NULL DEFAULT NULL,
  `dept_check_strictly` tinyint(1) NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '1', '0', 'admin', '2024-06-13 16:06:26', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '1', '1', 'admin', '2024-06-13 16:06:26', 'admin', '2024-07-10 17:13:05', '普通角色');
INSERT INTO `sys_role` VALUES (1811607750859661314, '测试角色1', 'test1', 2, '1', 1, 1, '1', '1', 'admin', '2024-07-12 11:45:21', 'admin', '2024-07-12 11:45:21', NULL);
INSERT INTO `sys_role` VALUES (1811629311809396737, '测试角色2', 'test2', 3, '1', 1, 1, '1', '1', 'admin', '2024-07-12 13:11:01', 'admin', '2024-07-12 13:11:01', NULL);
INSERT INTO `sys_role` VALUES (1829105952432427010, '试用', 'trier', 0, '1', 1, 1, '1', '0', 'admin', '2024-08-29 18:36:57', 'admin', '2024-08-30 10:51:57', NULL);
INSERT INTO `sys_role` VALUES (1911067693423845377, '普通员工', '100', 12, '1', 1, 1, '0', '1', 'admin', '2025-04-12 22:43:39', 'admin', '2025-04-12 22:43:39', NULL);
INSERT INTO `sys_role` VALUES (1912875129050800129, '测试员工', '14', 5, '1', 1, 1, '1', '0', 'admin', '2025-04-17 22:25:45', 'admin', '2025-04-17 22:25:45', NULL);
INSERT INTO `sys_role` VALUES (1913138480121155586, '仅测试', '3', 7, '1', 1, 1, '1', '1', 'admin', '2025-04-18 15:52:13', 'admin', '2025-04-18 15:52:13', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NULL DEFAULT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NULL DEFAULT NULL,
  `menu_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1808758090157985794);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1809059968309743618);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1809059968309743619);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1813458070128599041);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1813820131794837506);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1815207165755183105);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1818123963605549057);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1818466281474822145);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1818854933803638785);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1818855673632727042);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1820729144067321858);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1821075355068559361);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1822820194307051521);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1822862323595145218);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1823187248797270018);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1823190638784757762);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1825769009480142850);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1829349433573822466);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1829350164603260929);
INSERT INTO `sys_role_menu` VALUES (1829105952432427010, 1829351081448755202);
INSERT INTO `sys_role_menu` VALUES (1912875129050800129, 1808758090157985794);
INSERT INTO `sys_role_menu` VALUES (1912875129050800129, 1909128585102680065);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NULL DEFAULT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_date` datetime NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', 'sys_user', 'zccbbg@qq.com', '18888888888', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '1', '0', '127.0.0.1', '2025-12-18 20:22:25', 'admin', '2024-06-13 16:06:25', 'admin', '2025-12-18 20:22:25', '管理员');
INSERT INTO `sys_user` VALUES (1829105396288688129, 105, 'kucun', 'kucun', 'sys_user', '', '', '0', '', '$2a$10$jpbgHXxmB9nszkvhixjaQuwQtXcq7XJrqFaFpev/93WvaWa/oEpGy', '1', '0', '127.0.0.1', '2024-08-30 13:54:01', 'admin', '2024-08-29 18:34:44', 'kucun', '2024-08-30 13:54:01', NULL);
INSERT INTO `sys_user` VALUES (1912506203460673537, 100, '123', '测试人员', 'sys_user', '', '', '0', '', '$2a$10$VkfiPPWiWzgqjCoaz48FUOsegbZAt.09jE.Zg9kjfQ4Cw26MFUeza', '0', '1', '', NULL, 'admin', '2025-04-16 21:59:46', 'admin', '2025-04-16 21:59:46', NULL);
INSERT INTO `sys_user` VALUES (1912507603993305090, 100, 'ww', '测试人员', 'sys_user', '', '', '0', '', '$2a$10$pD.Byi1Hs82Z/OZjKUe8OOj3rIiEQtotpvot0K8U5kkJFQQzKTvfK', '1', '1', '', NULL, 'admin', '2025-04-16 22:05:20', 'admin', '2025-04-16 22:05:20', NULL);
INSERT INTO `sys_user` VALUES (1912507840543662082, 100, '问问', '测试人员', 'sys_user', '', '', '0', '', '123456', '1', '1', '', NULL, 'admin', '2025-04-16 22:06:17', 'admin', '2025-04-18 15:09:55', NULL);
INSERT INTO `sys_user` VALUES (1912508025374056449, 100, '123', '测试', 'sys_user', '', '', '0', '', '$2a$10$giZpt/cD20L8yzY.hsevyuku.nmyxxmhkVT4bSGhw1aUFO50E7ma.', '1', '1', '', NULL, 'admin', '2025-04-16 22:07:01', 'admin', '2025-04-16 22:07:01', NULL);
INSERT INTO `sys_user` VALUES (1912508493747789826, 102, '123', '123', 'sys_user', '', '', '0', '', '123456', '1', '1', '', NULL, 'admin', '2025-04-16 22:08:52', 'admin', '2025-04-17 23:23:03', NULL);
INSERT INTO `sys_user` VALUES (1912865254853877761, 100, 'cs100', '测试账号', 'sys_user', '123@qq.com', '18889999666', '0', '', '123456', '1', '0', '', NULL, 'admin', '2025-04-17 21:46:31', 'admin', '2025-04-18 15:46:05', '测试更新');
INSERT INTO `sys_user` VALUES (1912865369626812418, 100, '问问我', '测试人员', 'sys_user', '', '', '0', '', '$2a$10$pG3UGI58k0pLugV59cMW9OoIrCK98r6sGl8zQN4ozlNU.af0Ia746', '1', '1', '', NULL, 'admin', '2025-04-17 21:46:58', 'admin', '2025-04-17 21:46:58', NULL);
INSERT INTO `sys_user` VALUES (1989288430029651970, 100, 'user', 'user', NULL, NULL, '15777036025', '0', NULL, '$2a$10$ZlCzNwbRoKE8NBd/1Zp6U.eurEPBLIUJxfW2Qaqn5RG182NUldUim', '0', NULL, NULL, NULL, 'admin', '2025-11-14 19:04:56', 'admin', '2025-11-14 19:04:56', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NULL DEFAULT NULL,
  `post_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (1912865254853877761, 1);
INSERT INTO `sys_user_post` VALUES (1989288430029651970, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1829105396288688129, 1829105952432427010);
INSERT INTO `sys_user_role` VALUES (1912865254853877761, 1829105952432427010);
INSERT INTO `sys_user_role` VALUES (1989288430029651970, 1829105952432427010);

-- ----------------------------
-- Table structure for user_crypto_purchases
-- ----------------------------
DROP TABLE IF EXISTS `user_crypto_purchases`;
CREATE TABLE `user_crypto_purchases`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `crypto_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(18, 8) NOT NULL,
  `price_per_unit` decimal(18, 8) NOT NULL,
  `total_spent` decimal(18, 8) NOT NULL,
  `purchase_date` datetime NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_crypto_purchases
-- ----------------------------
INSERT INTO `user_crypto_purchases` VALUES (2, 1, 'Ethereum', 1.50000000, 3500.00000000, 5250.00000000, '2025-11-18 10:10:00', '', '2025-11-18 10:27:45', '', '2025-11-18 10:27:45');
INSERT INTO `user_crypto_purchases` VALUES (3, 1, 'Ripple', 2000.00000000, 0.50000000, 1000.00000000, '2025-11-18 10:20:00', '', '2025-11-18 10:27:45', '', '2025-11-18 10:27:45');
INSERT INTO `user_crypto_purchases` VALUES (4, 1, 'Litecoin', 10.00000000, 100.00000000, 1000.00000000, '2025-11-18 10:30:00', '', '2025-11-18 10:27:45', '', '2025-11-18 10:27:45');
INSERT INTO `user_crypto_purchases` VALUES (5, 1, 'Cardano', 1000.00000000, 1.20000000, 1200.00000000, '2025-11-18 10:40:00', '', '2025-11-18 10:27:45', '', '2025-11-18 10:27:45');
INSERT INTO `user_crypto_purchases` VALUES (7, 1, 'Ethereum', 97.00000000, 3500.00000000, 339500.00000000, '2025-11-23 05:07:05', 'admin', '2025-11-23 13:07:05', 'admin', '2025-11-23 13:10:34');
INSERT INTO `user_crypto_purchases` VALUES (8, 1, 'aaa', 1.00000000, 3500.00000000, 3500.00000000, '2025-11-23 05:23:15', 'admin', '2025-11-23 13:23:15', 'admin', '2025-11-23 13:23:15');
INSERT INTO `user_crypto_purchases` VALUES (9, 1, 'Ethereum', 1.00000000, 3500.00000000, 3500.00000000, '2025-11-23 05:23:31', 'admin', '2025-11-23 13:23:31', 'admin', '2025-11-23 13:23:31');
INSERT INTO `user_crypto_purchases` VALUES (10, 1, 'Ripple', 1.00000000, 0.50000000, 0.50000000, '2025-11-23 05:39:27', 'admin', '2025-11-23 13:39:27', 'admin', '2025-11-23 13:39:27');
INSERT INTO `user_crypto_purchases` VALUES (11, 1, 'Ethereum', 100.00000000, 3500.00000000, 350000.00000000, '2025-11-23 05:39:37', 'admin', '2025-11-23 13:39:37', 'admin', '2025-11-23 13:39:37');
INSERT INTO `user_crypto_purchases` VALUES (12, 1, 'PancakeSwap', 1.00000000, 2.30800000, 2.30800000, '2025-11-25 01:29:57', 'admin', '2025-11-25 09:29:57', 'admin', '2025-11-25 09:29:57');
INSERT INTO `user_crypto_purchases` VALUES (13, 1, 'PancakeSwap', 1.00000000, 2.30800000, 2.30800000, '2025-11-25 01:30:02', 'admin', '2025-11-25 09:30:02', 'admin', '2025-11-25 09:30:02');
INSERT INTO `user_crypto_purchases` VALUES (14, 1, 'Lido DAO', 2.00000000, 0.62900000, 1.25800000, '2025-11-25 01:30:18', 'admin', '2025-11-25 09:30:18', 'admin', '2025-11-25 09:30:18');
INSERT INTO `user_crypto_purchases` VALUES (15, 1, 'dYdX', 1.00000000, 0.23300000, 0.23300000, '2025-11-25 01:30:32', 'admin', '2025-11-25 09:30:32', 'admin', '2025-11-25 09:30:32');
INSERT INTO `user_crypto_purchases` VALUES (16, 1, 'PancakeSwap', 1.00000000, 2.30800000, 2.30800000, '2025-11-25 01:37:01', 'admin', '2025-11-25 09:37:01', 'admin', '2025-11-25 09:37:01');

-- ----------------------------
-- Table structure for wms_area
-- ----------------------------
DROP TABLE IF EXISTS `wms_area`;
CREATE TABLE `wms_area`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `area_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `area_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(4) NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_area
-- ----------------------------
INSERT INTO `wms_area` VALUES (1828364518342430721, NULL, '亭洪存储库', 1828364459110469633, NULL, 0, 'admin', '2024-08-27 17:30:45.210', 'admin', '2025-04-16 21:01:34.680');
INSERT INTO `wms_area` VALUES (1828364560503574530, NULL, '石柱岭存储库', 1828364459110469633, NULL, 0, 'admin', '2024-08-27 17:30:55.261', 'admin', '2025-04-16 21:01:42.696');
INSERT INTO `wms_area` VALUES (1828364666585911297, NULL, '凤岭储存库', 1828364609002311682, NULL, 0, 'admin', '2024-08-27 17:31:20.553', 'admin', '2025-04-16 20:51:23.172');
INSERT INTO `wms_area` VALUES (1828364702635954177, NULL, '琅东存储库', 1828364609002311682, NULL, 0, 'admin', '2024-08-27 17:31:29.140', 'admin', '2025-04-16 21:01:54.438');
INSERT INTO `wms_area` VALUES (1829397566185992193, NULL, '朝阳地区仓库', 1828364740028174337, NULL, 0, 'admin', '2024-08-30 13:55:43.009', 'admin', '2025-04-16 20:51:50.637');
INSERT INTO `wms_area` VALUES (1829397621378838530, NULL, '虎邱地区仓库', 1828364740028174337, NULL, 0, 'admin', '2024-08-30 13:55:56.167', 'admin', '2025-04-16 20:52:19.427');
INSERT INTO `wms_area` VALUES (1829397661719654401, NULL, '金桥地区仓库', 1828364740028174337, NULL, 0, 'admin', '2024-08-30 13:56:05.790', 'admin', '2025-04-16 21:02:36.956');
INSERT INTO `wms_area` VALUES (1829397707726974978, NULL, '秀厢地区仓库', 1828364740028174337, NULL, 0, 'admin', '2024-08-30 13:56:16.756', 'admin', '2025-04-16 21:02:31.078');
INSERT INTO `wms_area` VALUES (1829397742493560833, NULL, '相思湖地区仓库', 1828364740028174337, NULL, 0, 'admin', '2024-08-30 13:56:25.043', 'admin', '2025-04-16 20:53:49.780');

-- ----------------------------
-- Table structure for wms_case_info
-- ----------------------------
DROP TABLE IF EXISTS `wms_case_info`;
CREATE TABLE `wms_case_info`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `case_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `case_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `undertaking_unit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `case_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `case_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `case_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit_status` int(10) UNSIGNED NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_case_info
-- ----------------------------
INSERT INTO `wms_case_info` VALUES (1984966515386372098, '1111', 'AAAA', NULL, 'ajlx_xs', 'ajly_fy', NULL, 1, 'admin', '2025-11-02 20:51:10.823', 'admin', '2025-11-03 23:55:43.892');
INSERT INTO `wms_case_info` VALUES (1984966689538068482, NULL, 'A1', NULL, 'ajlx_xs', 'ajly_fy', NULL, 1, 'admin', '2025-11-02 20:51:52.351', 'admin', '2025-11-03 23:55:51.207');
INSERT INTO `wms_case_info` VALUES (1984966775114452994, NULL, '22', NULL, 'ajlx_xq', 'ajly_fy', NULL, 1, 'admin', '2025-11-02 20:52:12.745', 'admin', '2025-11-03 23:55:57.367');
INSERT INTO `wms_case_info` VALUES (1984966852071542785, '2222', '2222', NULL, 'ajlx_xq', 'ajly_fy', NULL, 1, 'admin', '2025-11-02 20:52:31.100', 'admin', '2025-11-03 23:56:02.961');
INSERT INTO `wms_case_info` VALUES (1984980851215454210, NULL, '123123123123123123', NULL, 'ajlx_xq', 'ajly_fy', NULL, 1, 'admin', '2025-11-02 21:48:08.759', 'admin', '2025-11-03 23:56:08.306');
INSERT INTO `wms_case_info` VALUES (1985280030959034369, 'sdfasdf', 'sadfsadf', 'sdfsfd', 'ajlx_xs', 'ajly_fy', 'sfdadsf', 1, 'admin', '2025-11-03 17:36:58.761', 'admin', '2025-11-03 23:56:14.455');
INSERT INTO `wms_case_info` VALUES (1985531866006777858, '1', '1', '1', 'ajlx_xs', 'ajly_fy', '1', 1, 'admin', '2025-11-04 10:17:40.914', 'admin', '2025-11-04 10:17:40.914');
INSERT INTO `wms_case_info` VALUES (1985554499673444354, '2', '2', 'cs_0002', 'ajlx_xs', 'ajly_fy', '2', 1, 'admin', '2025-11-04 11:47:37.201', 'admin', '2025-11-04 11:47:37.201');

-- ----------------------------
-- Table structure for wms_check_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_check_order`;
CREATE TABLE `wms_check_order`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `check_order_no` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `check_order_status` tinyint(4) NULL DEFAULT NULL,
  `check_order_total` decimal(20, 2) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL,
  `area_id` bigint(20) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_check_order
-- ----------------------------
INSERT INTO `wms_check_order` VALUES (1828631466955448321, 'PK08286054', 1, 3.00, 1828364459110469633, 1828364518342430721, NULL, 'admin', '2024-08-28 11:11:30.723', 'admin', '2024-08-28 11:11:37.825');
INSERT INTO `wms_check_order` VALUES (1828632546531549185, 'PK08288055', 1, 3.00, 1828364459110469633, NULL, NULL, 'admin', '2024-08-28 11:15:48.103', 'admin', '2024-08-28 11:16:17.508');
INSERT INTO `wms_check_order` VALUES (1828633046379339778, 'PK08283199', 1, 2.00, 1828364609002311682, NULL, NULL, 'admin', '2024-08-28 11:17:47.274', 'admin', '2024-08-28 11:17:47.274');

-- ----------------------------
-- Table structure for wms_check_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_check_order_detail`;
CREATE TABLE `wms_check_order_detail`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `check_order_id` bigint(20) NULL DEFAULT NULL,
  `sku_id` bigint(20) NULL DEFAULT NULL,
  `quantity` decimal(20, 2) NULL DEFAULT NULL,
  `check_quantity` decimal(20, 2) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL,
  `area_id` bigint(20) NULL DEFAULT NULL,
  `batch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `production_date` datetime(3) NULL DEFAULT NULL,
  `expiration_date` datetime(3) NULL DEFAULT NULL,
  `receipt_time` datetime(3) NULL DEFAULT NULL,
  `inventory_detail_id` bigint(20) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_check_order_detail
-- ----------------------------
INSERT INTO `wms_check_order_detail` VALUES (1828631467345518594, 1828631466955448321, 1828408796968030211, 0.00, 1.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:11:22.000', NULL, NULL, 'admin', '2024-08-28 11:11:30.807', 'admin', '2024-08-28 11:11:37.943');
INSERT INTO `wms_check_order_detail` VALUES (1828631467345518595, 1828631466955448321, 1828408796968030212, 0.00, 1.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:11:22.000', NULL, NULL, 'admin', '2024-08-28 11:11:30.812', 'admin', '2024-08-28 11:11:38.067');
INSERT INTO `wms_check_order_detail` VALUES (1828631467345518596, 1828631466955448321, 1828408796968030210, 0.00, 1.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:11:22.000', NULL, NULL, 'admin', '2024-08-28 11:11:30.812', 'admin', '2024-08-28 11:11:38.184');
INSERT INTO `wms_check_order_detail` VALUES (1828632546862899202, 1828632546531549185, 1828408796968030210, 1.00, 2.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:11:22.000', 1828631499662630916, NULL, 'admin', '2024-08-28 11:15:48.180', 'admin', '2024-08-28 11:16:17.636');
INSERT INTO `wms_check_order_detail` VALUES (1828632546862899203, 1828632546531549185, 1828408796968030211, 1.00, 2.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:11:22.000', 1828631499662630914, NULL, 'admin', '2024-08-28 11:15:48.180', 'admin', '2024-08-28 11:16:17.758');
INSERT INTO `wms_check_order_detail` VALUES (1828632546862899204, 1828632546531549185, 1828408796968030212, 1.00, 2.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:11:22.000', 1828631499662630915, NULL, 'admin', '2024-08-28 11:15:48.181', 'admin', '2024-08-28 11:16:17.885');
INSERT INTO `wms_check_order_detail` VALUES (1828632600055062530, 1828632546531549185, 1828408321522700289, 0.00, 0.00, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, '2024-08-28 11:15:56.000', NULL, NULL, 'admin', '2024-08-28 11:16:00.866', 'admin', '2024-08-28 11:16:18.004');
INSERT INTO `wms_check_order_detail` VALUES (1828633046706495490, 1828633046379339778, 1828408796968030210, 1.00, 1.00, 1828364609002311682, 1828364666585911297, NULL, NULL, NULL, '2024-08-27 20:34:28.000', 1828410751362736129, NULL, 'admin', '2024-08-28 11:17:47.350', 'admin', '2024-08-28 11:17:47.350');
INSERT INTO `wms_check_order_detail` VALUES (1828633046706495491, 1828633046379339778, 1828408796968030211, 1.00, 1.00, 1828364609002311682, 1828364666585911297, NULL, NULL, NULL, '2024-08-27 20:34:28.000', 1828410751362736130, NULL, 'admin', '2024-08-28 11:17:47.351', 'admin', '2024-08-28 11:17:47.351');
INSERT INTO `wms_check_order_detail` VALUES (1828633046706495492, 1828633046379339778, 1828408796968030212, 1.00, 1.00, 1828364609002311682, 1828364666585911297, NULL, NULL, NULL, '2024-08-27 20:34:28.000', 1828410751362736131, NULL, 'admin', '2024-08-28 11:17:47.351', 'admin', '2024-08-28 11:17:47.351');
INSERT INTO `wms_check_order_detail` VALUES (1828633046706495493, 1828633046379339778, 1828408321522700289, 0.00, 2.00, 1828364609002311682, 1828364666585911297, NULL, NULL, NULL, '2024-08-28 11:17:34.000', NULL, NULL, 'admin', '2024-08-28 11:17:47.352', 'admin', '2024-08-28 11:17:47.352');

-- ----------------------------
-- Table structure for wms_inventory
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory`;
CREATE TABLE `wms_inventory`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `sku_id` bigint(20) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL,
  `area_id` bigint(20) NULL DEFAULT NULL,
  `quantity` decimal(20, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory
-- ----------------------------
INSERT INTO `wms_inventory` VALUES (1828410752281288706, 1828408796968030210, 1828364609002311682, 1828364666585911297, 1.00, NULL, 'admin', '2024-08-27 20:34:28.229', 'admin', '2024-08-27 20:34:28.229');
INSERT INTO `wms_inventory` VALUES (1828410752285483010, 1828408796968030212, 1828364609002311682, 1828364666585911297, 1.00, NULL, 'admin', '2024-08-27 20:34:28.231', 'admin', '2024-08-27 20:34:28.231');
INSERT INTO `wms_inventory` VALUES (1828410752285483011, 1828408796968030211, 1828364609002311682, 1828364666585911297, 1.00, NULL, 'admin', '2024-08-27 20:34:28.231', 'admin', '2024-08-27 20:34:28.231');
INSERT INTO `wms_inventory` VALUES (1828631499272560641, 1828408796968030212, 1828364459110469633, 1828364518342430721, 2.00, NULL, 'admin', '2024-08-28 11:11:38.423', 'admin', '2024-08-28 11:16:18.237');
INSERT INTO `wms_inventory` VALUES (1828631499272560642, 1828408796968030211, 1828364459110469633, 1828364518342430721, 1.00, NULL, 'admin', '2024-08-28 11:11:38.424', 'admin', '2024-08-28 11:19:20.733');
INSERT INTO `wms_inventory` VALUES (1828631499272560643, 1828408796968030210, 1828364459110469633, 1828364518342430721, 0.00, NULL, 'admin', '2024-08-28 11:11:38.425', 'admin', '2024-08-28 11:19:20.734');
INSERT INTO `wms_inventory` VALUES (1828633047683768322, 1828408321522700289, 1828364609002311682, 1828364666585911297, 1.00, NULL, 'admin', '2024-08-28 11:17:47.585', 'admin', '2024-08-28 14:35:26.915');
INSERT INTO `wms_inventory` VALUES (1828682789792980994, 1828408321522700289, 1828364459110469633, 1828364518342430721, 1.00, NULL, 'admin', '2024-08-28 14:35:27.039', 'admin', '2024-08-28 14:35:27.039');
INSERT INTO `wms_inventory` VALUES (1829399582966738945, 1829398193024724993, 1828364740028174337, 1829397742493560833, 99.00, NULL, 'admin', '2024-08-30 14:03:43.850', 'kucun', '2024-08-30 14:30:23.390');
INSERT INTO `wms_inventory` VALUES (1829399582966738946, 1829398193024724994, 1828364740028174337, 1829397742493560833, 100.00, NULL, 'admin', '2024-08-30 14:03:43.851', 'kucun', '2024-08-30 14:30:23.391');
INSERT INTO `wms_inventory` VALUES (1829399582966738947, 1829399118304964610, 1828364740028174337, 1829397566185992193, 97.00, NULL, 'admin', '2024-08-30 14:03:43.851', 'kucun', '2024-08-30 15:20:29.232');
INSERT INTO `wms_inventory` VALUES (1829399582966738948, 1829398702011904001, 1828364740028174337, 1829397661719654401, 99.00, NULL, 'admin', '2024-08-30 14:03:43.852', 'kucun', '2024-08-30 14:30:23.391');
INSERT INTO `wms_inventory` VALUES (1829399582966738949, 1829398702011904002, 1828364740028174337, 1829397661719654401, 99.00, NULL, 'admin', '2024-08-30 14:03:43.852', 'kucun', '2024-08-30 14:30:23.392');
INSERT INTO `wms_inventory` VALUES (1829399583033847810, 1829398333903007746, 1828364740028174337, 1829397707726974978, 99.00, NULL, 'admin', '2024-08-30 14:03:43.854', 'kucun', '2024-08-30 14:30:23.392');
INSERT INTO `wms_inventory` VALUES (1829399583033847811, 1829398333903007745, 1828364740028174337, 1829397707726974978, 98.00, NULL, 'admin', '2024-08-30 14:03:43.854', 'kucun', '2024-08-30 14:30:23.393');
INSERT INTO `wms_inventory` VALUES (1829399583033847812, 1829398492779048963, 1828364740028174337, 1829397621378838530, 98.00, NULL, 'admin', '2024-08-30 14:03:43.855', 'kucun', '2024-08-30 14:30:23.393');
INSERT INTO `wms_inventory` VALUES (1829399583033847813, 1829399118304964609, 1828364740028174337, 1829397566185992193, 97.00, NULL, 'admin', '2024-08-30 14:03:43.856', 'kucun', '2024-08-30 15:20:29.232');
INSERT INTO `wms_inventory` VALUES (1829399583033847814, 1829398492779048962, 1828364740028174337, 1829397621378838530, 98.00, NULL, 'admin', '2024-08-30 14:03:43.856', 'kucun', '2024-08-30 14:30:23.394');
INSERT INTO `wms_inventory` VALUES (1829418900177743873, 1829399118304964609, 1828364740028174337, 1829397621378838530, 1.00, NULL, 'kucun', '2024-08-30 15:20:29.435', 'kucun', '2024-08-30 15:20:29.435');
INSERT INTO `wms_inventory` VALUES (1829418900244852737, 1829399118304964610, 1828364740028174337, 1829397621378838530, 1.00, NULL, 'kucun', '2024-08-30 15:20:29.436', 'kucun', '2024-08-30 15:20:29.436');

-- ----------------------------
-- Table structure for wms_inventory_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_detail`;
CREATE TABLE `wms_inventory_detail`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `receipt_order_id` bigint(20) NULL DEFAULT NULL,
  `receipt_order_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `sku_id` bigint(20) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL,
  `area_id` bigint(20) NULL DEFAULT NULL,
  `quantity` decimal(20, 2) NULL DEFAULT NULL,
  `batch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `production_date` datetime(3) NULL DEFAULT NULL,
  `expiration_date` datetime(3) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remain_quantity` decimal(10, 2) NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory_detail
-- ----------------------------
INSERT INTO `wms_inventory_detail` VALUES (1828410751362736129, 1828410750511292417, NULL, NULL, 1, 1828408796968030210, 1828364609002311682, 1828364666585911297, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-27 20:34:28.015', 'admin', '2024-08-27 20:34:28.015');
INSERT INTO `wms_inventory_detail` VALUES (1828410751362736130, 1828410750511292417, NULL, NULL, 1, 1828408796968030211, 1828364609002311682, 1828364666585911297, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-27 20:34:28.017', 'admin', '2024-08-27 20:34:28.017');
INSERT INTO `wms_inventory_detail` VALUES (1828410751362736131, 1828410750511292417, NULL, NULL, 1, 1828408796968030212, 1828364609002311682, 1828364666585911297, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-27 20:34:28.017', 'admin', '2024-08-27 20:34:28.017');
INSERT INTO `wms_inventory_detail` VALUES (1828631499662630914, 1828631466955448321, NULL, NULL, 3, 1828408796968030211, 1828364459110469633, 1828364518342430721, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-28 11:11:22.000', 'admin', '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_detail` VALUES (1828631499662630915, 1828631466955448321, NULL, NULL, 3, 1828408796968030212, 1828364459110469633, 1828364518342430721, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-28 11:11:22.000', 'admin', '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_detail` VALUES (1828632673883201539, 1828632546531549185, NULL, NULL, 3, 1828408796968030212, 1828364459110469633, 1828364518342430721, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-28 11:11:22.000', 'admin', '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_detail` VALUES (1828633048015118337, NULL, NULL, NULL, 3, 1828408321522700289, 1828364609002311682, 1828364666585911297, 2.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-28 11:17:34.000', 'admin', '2024-08-28 14:35:27.121');
INSERT INTO `wms_inventory_detail` VALUES (1828682790510206977, 1828682788358529025, NULL, NULL, 2, 1828408321522700289, 1828364459110469633, 1828364518342430721, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'admin', '2024-08-28 14:35:27.202', 'admin', '2024-08-28 14:35:27.202');
INSERT INTO `wms_inventory_detail` VALUES (1829399580546625538, 1829399579699376129, NULL, NULL, 1, 1829399118304964609, 1828364740028174337, 1829397566185992193, 100.00, NULL, NULL, NULL, NULL, NULL, 97.00, 'admin', '2024-08-30 14:03:43.274', 'kucun', '2024-08-30 15:20:29.514');
INSERT INTO `wms_inventory_detail` VALUES (1829399580546625539, 1829399579699376129, NULL, NULL, 1, 1829399118304964610, 1828364740028174337, 1829397566185992193, 100.00, NULL, NULL, NULL, NULL, NULL, 97.00, 'admin', '2024-08-30 14:03:43.275', 'kucun', '2024-08-30 15:20:29.514');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734402, 1829399579699376129, NULL, NULL, 1, 1829398702011904001, 1828364740028174337, 1829397661719654401, 100.00, NULL, NULL, NULL, NULL, NULL, 99.00, 'admin', '2024-08-30 14:03:43.275', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734403, 1829399579699376129, NULL, NULL, 1, 1829398702011904002, 1828364740028174337, 1829397661719654401, 100.00, NULL, NULL, NULL, NULL, NULL, 99.00, 'admin', '2024-08-30 14:03:43.276', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734404, 1829399579699376129, NULL, NULL, 1, 1829398492779048962, 1828364740028174337, 1829397621378838530, 99.00, NULL, NULL, NULL, NULL, NULL, 98.00, 'admin', '2024-08-30 14:03:43.277', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734405, 1829399579699376129, NULL, NULL, 1, 1829398492779048963, 1828364740028174337, 1829397621378838530, 99.00, NULL, NULL, NULL, NULL, NULL, 98.00, 'admin', '2024-08-30 14:03:43.281', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734406, 1829399579699376129, NULL, NULL, 1, 1829398333903007745, 1828364740028174337, 1829397707726974978, 99.00, NULL, NULL, NULL, NULL, NULL, 98.00, 'admin', '2024-08-30 14:03:43.282', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734407, 1829399579699376129, NULL, NULL, 1, 1829398333903007746, 1828364740028174337, 1829397707726974978, 100.00, NULL, NULL, NULL, NULL, NULL, 99.00, 'admin', '2024-08-30 14:03:43.285', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734408, 1829399579699376129, NULL, NULL, 1, 1829398193024724993, 1828364740028174337, 1829397742493560833, 100.00, NULL, NULL, NULL, NULL, NULL, 99.00, 'admin', '2024-08-30 14:03:43.287', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829399580613734409, 1829399579699376129, NULL, NULL, 1, 1829398193024724994, 1828364740028174337, 1829397742493560833, 101.00, NULL, NULL, NULL, NULL, NULL, 100.00, 'admin', '2024-08-30 14:03:43.287', 'kucun', '2024-08-30 14:30:23.602');
INSERT INTO `wms_inventory_detail` VALUES (1829418900894969858, 1829418487672139777, NULL, NULL, 2, 1829399118304964609, 1828364740028174337, 1829397621378838530, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'kucun', '2024-08-30 15:20:29.600', 'kucun', '2024-08-30 15:20:29.600');
INSERT INTO `wms_inventory_detail` VALUES (1829418900894969859, 1829418487672139777, NULL, NULL, 2, 1829399118304964610, 1828364740028174337, 1829397621378838530, 1.00, NULL, NULL, NULL, NULL, NULL, 1.00, 'kucun', '2024-08-30 15:20:29.601', 'kucun', '2024-08-30 15:20:29.601');

-- ----------------------------
-- Table structure for wms_inventory_history
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_history`;
CREATE TABLE `wms_inventory_history`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL,
  `area_id` bigint(20) NULL DEFAULT NULL,
  `sku_id` bigint(20) NULL DEFAULT NULL,
  `quantity` decimal(20, 2) NULL DEFAULT NULL,
  `batch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `production_date` datetime(3) NULL DEFAULT NULL,
  `expiration_date` datetime(3) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_id` bigint(20) NULL DEFAULT NULL,
  `order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_type` int(11) NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_inventory_history
-- ----------------------------
INSERT INTO `wms_inventory_history` VALUES (1828410752604250113, 1828364609002311682, 1828364666585911297, 1828408796968030210, 1.00, NULL, NULL, NULL, NULL, NULL, 1828410750511292417, 'RK08270491', 1, '2024-08-27 20:34:28.311');
INSERT INTO `wms_inventory_history` VALUES (1828410752604250114, 1828364609002311682, 1828364666585911297, 1828408796968030211, 1.00, NULL, NULL, NULL, NULL, NULL, 1828410750511292417, 'RK08270491', 1, '2024-08-27 20:34:28.312');
INSERT INTO `wms_inventory_history` VALUES (1828410752604250115, 1828364609002311682, 1828364666585911297, 1828408796968030212, 1.00, NULL, NULL, NULL, NULL, NULL, 1828410750511292417, 'RK08270491', 1, '2024-08-27 20:34:28.313');
INSERT INTO `wms_inventory_history` VALUES (1828631500056895489, 1828364459110469633, 1828364518342430721, 1828408796968030211, 1.00, NULL, NULL, NULL, NULL, NULL, 1828631466955448321, 'PK08286054', 4, '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_history` VALUES (1828631500056895490, 1828364459110469633, 1828364518342430721, 1828408796968030212, 1.00, NULL, NULL, NULL, NULL, NULL, 1828631466955448321, 'PK08286054', 4, '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_history` VALUES (1828631500056895491, 1828364459110469633, 1828364518342430721, 1828408796968030210, 1.00, NULL, NULL, NULL, NULL, NULL, 1828631466955448321, 'PK08286054', 4, '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_history` VALUES (1828632674210357249, 1828364459110469633, 1828364518342430721, 1828408796968030210, 1.00, NULL, NULL, NULL, NULL, NULL, 1828632546531549185, 'PK08288055', 4, '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_history` VALUES (1828632674210357250, 1828364459110469633, 1828364518342430721, 1828408796968030211, 1.00, NULL, NULL, NULL, NULL, NULL, 1828632546531549185, 'PK08288055', 4, '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_history` VALUES (1828632674210357251, 1828364459110469633, 1828364518342430721, 1828408796968030212, 1.00, NULL, NULL, NULL, NULL, NULL, 1828632546531549185, 'PK08288055', 4, '2024-08-28 11:11:22.000');
INSERT INTO `wms_inventory_history` VALUES (1828633048333885442, 1828364609002311682, 1828364666585911297, 1828408321522700289, 2.00, NULL, NULL, NULL, NULL, NULL, NULL, 'PK08283199', 4, '2024-08-28 11:17:34.000');
INSERT INTO `wms_inventory_history` VALUES (1828633439272378369, 1828364459110469633, 1828364518342430721, 1828408796968030210, -1.00, NULL, NULL, NULL, NULL, NULL, 1828633402429612034, 'CK08286097', 2, '2024-08-28 11:19:20.946');
INSERT INTO `wms_inventory_history` VALUES (1828633439272378370, 1828364459110469633, 1828364518342430721, 1828408796968030210, -1.00, NULL, NULL, NULL, NULL, NULL, 1828633402429612034, 'CK08286097', 2, '2024-08-28 11:19:20.946');
INSERT INTO `wms_inventory_history` VALUES (1828633439272378371, 1828364459110469633, 1828364518342430721, 1828408796968030211, -1.00, NULL, NULL, NULL, NULL, NULL, 1828633402429612034, 'CK08286097', 2, '2024-08-28 11:19:20.947');
INSERT INTO `wms_inventory_history` VALUES (1828682790845751297, 1828364609002311682, 1828364666585911297, 1828408321522700289, -1.00, NULL, NULL, NULL, NULL, NULL, 1828682788358529025, 'YK08281599', 3, '2024-08-28 14:35:27.279');
INSERT INTO `wms_inventory_history` VALUES (1828682790845751298, 1828364459110469633, 1828364518342430721, 1828408321522700289, 1.00, NULL, NULL, NULL, NULL, NULL, 1828682788358529025, 'YK08281599', 3, '2024-08-28 14:35:27.280');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918082, 1828364740028174337, 1829397566185992193, 1829399118304964609, 100.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.957');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918083, 1828364740028174337, 1829397566185992193, 1829399118304964610, 100.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.957');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918084, 1828364740028174337, 1829397661719654401, 1829398702011904001, 100.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.957');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918085, 1828364740028174337, 1829397661719654401, 1829398702011904002, 100.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.958');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918086, 1828364740028174337, 1829397621378838530, 1829398492779048962, 99.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.958');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918087, 1828364740028174337, 1829397621378838530, 1829398492779048963, 99.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.959');
INSERT INTO `wms_inventory_history` VALUES (1829399583423918088, 1828364740028174337, 1829397707726974978, 1829398333903007745, 99.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.960');
INSERT INTO `wms_inventory_history` VALUES (1829399583486832642, 1828364740028174337, 1829397707726974978, 1829398333903007746, 100.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.963');
INSERT INTO `wms_inventory_history` VALUES (1829399583486832643, 1828364740028174337, 1829397742493560833, 1829398193024724993, 100.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.963');
INSERT INTO `wms_inventory_history` VALUES (1829399583486832644, 1828364740028174337, 1829397742493560833, 1829398193024724994, 101.00, NULL, NULL, NULL, NULL, NULL, 1829399579699376129, 'RK08302046', 1, '2024-08-30 14:03:43.964');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799042, 1828364740028174337, 1829397566185992193, 1829399118304964609, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.691');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799043, 1828364740028174337, 1829397566185992193, 1829399118304964610, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.692');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799044, 1828364740028174337, 1829397621378838530, 1829398492779048962, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.692');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799045, 1828364740028174337, 1829397621378838530, 1829398492779048963, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.693');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799046, 1828364740028174337, 1829397661719654401, 1829398702011904001, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.693');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799047, 1828364740028174337, 1829397661719654401, 1829398702011904002, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.695');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799048, 1828364740028174337, 1829397707726974978, 1829398333903007745, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.696');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799049, 1828364740028174337, 1829397707726974978, 1829398333903007746, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.697');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799050, 1828364740028174337, 1829397742493560833, 1829398193024724993, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.697');
INSERT INTO `wms_inventory_history` VALUES (1829406293219799051, 1828364740028174337, 1829397742493560833, 1829398193024724994, -1.00, NULL, NULL, NULL, NULL, NULL, 1829405767363129345, 'CK08305241', 2, '2024-08-30 14:30:23.698');
INSERT INTO `wms_inventory_history` VALUES (1829407249542082561, 1828364740028174337, 1829397566185992193, 1829399118304964609, -1.00, NULL, NULL, NULL, NULL, NULL, 1829407217174638593, 'CK08304574', 2, '2024-08-30 14:34:11.704');
INSERT INTO `wms_inventory_history` VALUES (1829407249542082562, 1828364740028174337, 1829397566185992193, 1829399118304964610, -1.00, NULL, NULL, NULL, NULL, NULL, 1829407217174638593, 'CK08304574', 2, '2024-08-30 14:34:11.704');
INSERT INTO `wms_inventory_history` VALUES (1829418901289234433, 1828364740028174337, 1829397566185992193, 1829399118304964609, -1.00, NULL, NULL, NULL, NULL, NULL, 1829418487672139777, 'YK08301821', 3, '2024-08-30 15:20:29.686');
INSERT INTO `wms_inventory_history` VALUES (1829418901289234434, 1828364740028174337, 1829397621378838530, 1829399118304964609, 1.00, NULL, NULL, NULL, NULL, NULL, 1829418487672139777, 'YK08301821', 3, '2024-08-30 15:20:29.686');
INSERT INTO `wms_inventory_history` VALUES (1829418901289234435, 1828364740028174337, 1829397566185992193, 1829399118304964610, -1.00, NULL, NULL, NULL, NULL, NULL, 1829418487672139777, 'YK08301821', 3, '2024-08-30 15:20:29.686');
INSERT INTO `wms_inventory_history` VALUES (1829418901289234436, 1828364740028174337, 1829397621378838530, 1829399118304964610, 1.00, NULL, NULL, NULL, NULL, NULL, 1829418487672139777, 'YK08301821', 3, '2024-08-30 15:20:29.687');

-- ----------------------------
-- Table structure for wms_item
-- ----------------------------
DROP TABLE IF EXISTS `wms_item`;
CREATE TABLE `wms_item`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `item_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `item_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `item_category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `item_brand` bigint(20) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_item
-- ----------------------------
INSERT INTO `wms_item` VALUES (1828402622516334594, NULL, '华为 nova flip', '1828364988754595841', NULL, 1828364927610032129, NULL, 'admin', '2024-08-27 20:02:09.948', 'admin', '2025-04-16 21:00:43.539');
INSERT INTO `wms_item` VALUES (1828406450112335874, NULL, 'macbook', '1828365043024695297', NULL, 1828364873889386498, NULL, 'admin', '2024-08-27 20:17:22.521', 'admin', '2024-08-27 20:17:22.521');
INSERT INTO `wms_item` VALUES (1828407870173646849, NULL, '爱普生打印机', '1828365014901886978', NULL, NULL, NULL, 'admin', '2024-08-27 20:23:01.096', 'admin', '2024-08-27 20:23:01.096');
INSERT INTO `wms_item` VALUES (1828408320146968578, NULL, '小米米家436L十字四门风冷无霜嵌入式家用冰箱', '1828405773474631681', NULL, 1828364846953566209, NULL, 'admin', '2024-08-27 20:24:48.375', 'admin', '2024-08-27 20:24:48.375');
INSERT INTO `wms_item` VALUES (1828408795734904833, NULL, '杠铃', '1828408600515219457', NULL, NULL, NULL, 'admin', '2024-08-27 20:26:41.757', 'admin', '2024-08-27 20:33:27.034');
INSERT INTO `wms_item` VALUES (1829398192563351554, NULL, '钦州青蟹', '1829398007993004034', NULL, NULL, NULL, 'admin', '2024-08-30 13:58:12.354', 'admin', '2025-04-16 21:00:24.738');
INSERT INTO `wms_item` VALUES (1829398333580046338, NULL, '钦州生蚝', '1829398007993004034', NULL, NULL, NULL, 'admin', '2024-08-30 13:58:45.971', 'admin', '2025-04-16 20:59:42.255');
INSERT INTO `wms_item` VALUES (1829398492388978689, NULL, '皮皮虾', '1829398007993004034', NULL, NULL, NULL, 'admin', '2024-08-30 13:59:23.834', 'admin', '2025-04-16 20:56:06.186');
INSERT INTO `wms_item` VALUES (1829398701680553985, NULL, '沃柑', '1829397958923841538', NULL, NULL, NULL, 'admin', '2024-08-30 14:00:13.735', 'admin', '2025-04-16 20:59:06.927');
INSERT INTO `wms_item` VALUES (1829399118040723457, NULL, '沙田柚', '1829397958923841538', NULL, NULL, NULL, 'admin', '2024-08-30 14:01:52.989', 'admin', '2025-04-16 20:55:51.316');
INSERT INTO `wms_item` VALUES (1912490838865289217, '', '砂糖橘', '1829397958923841538', NULL, NULL, NULL, 'admin', '2025-04-16 20:58:43.013', 'admin', '2025-04-16 20:58:55.504');

-- ----------------------------
-- Table structure for wms_item_brand
-- ----------------------------
DROP TABLE IF EXISTS `wms_item_brand`;
CREATE TABLE `wms_item_brand`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `brand_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_item_brand
-- ----------------------------
INSERT INTO `wms_item_brand` VALUES (1828364846953566209, '小米', 'admin', '2024-08-27 17:32:03.551', 'admin', '2024-08-27 17:32:03.551');
INSERT INTO `wms_item_brand` VALUES (1828364873889386498, '苹果', 'admin', '2024-08-27 17:32:09.971', 'admin', '2024-08-27 17:32:09.971');
INSERT INTO `wms_item_brand` VALUES (1828364927610032129, '华为', 'admin', '2024-08-27 17:32:22.786', 'admin', '2024-08-27 17:32:22.786');
INSERT INTO `wms_item_brand` VALUES (1828407151135723522, '爱普生', 'admin', '2024-08-27 20:20:09.656', 'admin', '2024-08-27 20:20:09.656');
INSERT INTO `wms_item_brand` VALUES (1828407291103842306, '惠普', 'admin', '2024-08-27 20:20:43.031', 'admin', '2025-04-07 01:13:39.915');
INSERT INTO `wms_item_brand` VALUES (1911764903073415169, '水果', 'admin', '2025-04-14 20:54:06.427', 'admin', '2025-04-14 20:54:06.427');

-- ----------------------------
-- Table structure for wms_item_category
-- ----------------------------
DROP TABLE IF EXISTS `wms_item_category`;
CREATE TABLE `wms_item_category`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `category_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_num` int(11) NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_item_category
-- ----------------------------
INSERT INTO `wms_item_category` VALUES (1828364988754595841, 0, '手机', 0, '1', 'admin', '2024-08-27 17:32:37.357', 'admin', '2024-08-27 20:14:12.100');
INSERT INTO `wms_item_category` VALUES (1828365014901886978, 0, '打印机', 1, '1', 'admin', '2024-08-27 17:32:43.598', 'admin', '2024-08-27 20:14:12.447');
INSERT INTO `wms_item_category` VALUES (1828365043024695297, 0, '电脑', 3, '1', 'admin', '2024-08-27 17:32:50.301', 'admin', '2024-08-27 20:14:12.704');
INSERT INTO `wms_item_category` VALUES (1828405743737016322, 0, '家电', 4, '1', 'admin', '2024-08-27 20:14:34.104', 'admin', '2024-08-27 20:14:34.104');
INSERT INTO `wms_item_category` VALUES (1828405773474631681, 1828405743737016322, '冰箱', 0, '1', 'admin', '2024-08-27 20:14:41.195', 'admin', '2024-08-27 20:14:41.195');
INSERT INTO `wms_item_category` VALUES (1828405825714688001, 1828405743737016322, '电视', 1, '1', 'admin', '2024-08-27 20:14:53.651', 'admin', '2024-08-27 20:14:53.651');
INSERT INTO `wms_item_category` VALUES (1828408600515219457, 0, '健生器材', 5, '1', 'admin', '2024-08-27 20:25:55.213', 'admin', '2024-08-27 20:25:55.213');
INSERT INTO `wms_item_category` VALUES (1829397860466749441, 0, '生鲜', 6, '1', 'admin', '2024-08-30 13:56:53.174', 'admin', '2024-08-30 13:56:53.174');
INSERT INTO `wms_item_category` VALUES (1829397958923841538, 1829397860466749441, '水果', 0, '1', 'admin', '2024-08-30 13:57:16.644', 'admin', '2024-08-30 13:57:16.644');
INSERT INTO `wms_item_category` VALUES (1829398007993004034, 1829397860466749441, '海鲜', 1, '1', 'admin', '2024-08-30 13:57:28.347', 'admin', '2024-08-30 13:57:28.347');
INSERT INTO `wms_item_category` VALUES (1910588541117718529, 0, '洗衣机', 8, '1', 'admin', '2025-04-11 14:59:39.893', 'admin', '2025-04-11 14:59:39.893');

-- ----------------------------
-- Table structure for wms_item_sku
-- ----------------------------
DROP TABLE IF EXISTS `wms_item_sku`;
CREATE TABLE `wms_item_sku`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `item_id` bigint(20) NULL DEFAULT NULL,
  `barcode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `length` decimal(10, 1) NULL DEFAULT NULL,
  `width` decimal(10, 1) NULL DEFAULT NULL,
  `height` decimal(10, 1) NULL DEFAULT NULL,
  `gross_weight` decimal(10, 3) NULL DEFAULT NULL,
  `net_weight` decimal(10, 3) NULL DEFAULT NULL,
  `cost_price` decimal(10, 2) NULL DEFAULT NULL,
  `selling_price` decimal(10, 2) NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_item_sku
-- ----------------------------
INSERT INTO `wms_item_sku` VALUES (1828402624005312514, '黑', 1828402622516334594, '', '00001', NULL, NULL, NULL, NULL, NULL, 5000.00, 5288.00, 'admin', '2024-08-27 20:02:10.302', 'admin', '2025-04-16 21:00:43.756');
INSERT INTO `wms_item_sku` VALUES (1828402624005312515, '白', 1828402622516334594, '', '00002', NULL, NULL, NULL, NULL, NULL, 5000.00, 5288.00, 'admin', '2024-08-27 20:02:10.304', 'admin', '2025-04-16 21:00:44.043');
INSERT INTO `wms_item_sku` VALUES (1828402624005312516, '粉', 1828402622516334594, '', '00003', NULL, NULL, NULL, NULL, NULL, 5000.00, 5288.00, 'admin', '2024-08-27 20:02:10.305', 'admin', '2025-04-16 21:00:44.144');
INSERT INTO `wms_item_sku` VALUES (1828406451399987201, 'pro', 1828406450112335874, '', 'mac0001', NULL, NULL, NULL, NULL, NULL, NULL, 24999.00, 'admin', '2024-08-27 20:17:22.821', 'admin', '2024-08-27 20:17:22.821');
INSERT INTO `wms_item_sku` VALUES (1828407871469686786, 'l6468', 1828407870173646849, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3188.00, 'admin', '2024-08-27 20:23:01.393', 'admin', '2024-08-27 20:23:01.393');
INSERT INTO `wms_item_sku` VALUES (1828408321522700289, '白色', 1828408320146968578, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2699.00, 'admin', '2024-08-27 20:24:48.697', 'admin', '2024-08-27 20:24:48.697');
INSERT INTO `wms_item_sku` VALUES (1828408796968030210, '10kg', 1828408795734904833, '102025115', NULL, NULL, NULL, NULL, NULL, 10.000, NULL, NULL, 'admin', '2024-08-27 20:26:42.049', 'admin', '2024-08-27 20:33:27.395');
INSERT INTO `wms_item_sku` VALUES (1828408796968030211, '20kg', 1828408795734904833, '254523055', NULL, NULL, NULL, NULL, NULL, 20.000, NULL, NULL, 'admin', '2024-08-27 20:26:42.052', 'admin', '2024-08-27 20:33:27.515');
INSERT INTO `wms_item_sku` VALUES (1828408796968030212, '50kg', 1828408795734904833, '5204862525', NULL, NULL, NULL, NULL, NULL, 50.000, NULL, NULL, 'admin', '2024-08-27 20:26:42.052', 'admin', '2024-08-27 20:33:27.634');
INSERT INTO `wms_item_sku` VALUES (1829398193024724993, '大', 1829398192563351554, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 13:58:12.457', 'admin', '2025-04-16 21:00:24.826');
INSERT INTO `wms_item_sku` VALUES (1829398193024724994, '中', 1829398192563351554, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 13:58:12.458', 'admin', '2025-04-16 21:00:29.861');
INSERT INTO `wms_item_sku` VALUES (1829398333903007745, '大', 1829398333580046338, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 13:58:46.047', 'admin', '2025-04-16 20:59:42.370');
INSERT INTO `wms_item_sku` VALUES (1829398333903007746, '中', 1829398333580046338, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 13:58:46.048', 'admin', '2025-04-16 20:59:42.466');
INSERT INTO `wms_item_sku` VALUES (1829398492779048962, '大', 1829398492388978689, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 13:59:23.925', 'admin', '2025-04-16 20:56:06.262');
INSERT INTO `wms_item_sku` VALUES (1829398492779048963, '中', 1829398492388978689, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 13:59:23.925', 'admin', '2025-04-16 20:56:06.438');
INSERT INTO `wms_item_sku` VALUES (1829398702011904001, '大', 1829398701680553985, '', NULL, 10.0, 10.0, 10.0, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:00:13.810', 'admin', '2025-04-16 20:59:07.011');
INSERT INTO `wms_item_sku` VALUES (1829398702011904002, '中', 1829398701680553985, '', NULL, 5.0, 5.0, 5.0, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:00:13.812', 'admin', '2025-04-16 20:59:07.102');
INSERT INTO `wms_item_sku` VALUES (1829399118304964609, '大', 1829399118040723457, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:01:53.064', 'admin', '2025-04-16 20:55:51.469');
INSERT INTO `wms_item_sku` VALUES (1829399118304964610, '中', 1829399118040723457, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:01:53.064', 'admin', '2025-04-16 20:55:51.594');
INSERT INTO `wms_item_sku` VALUES (1911775077599281154, '小', 1911775077410537473, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2025-04-14 21:34:32.232', 'admin', '2025-04-14 21:34:32.232');
INSERT INTO `wms_item_sku` VALUES (1912490839255359489, '大', 1912490838865289217, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2025-04-16 20:58:43.099', 'admin', '2025-04-16 20:58:55.593');
INSERT INTO `wms_item_sku` VALUES (1912490839255359490, '中', 1912490838865289217, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2025-04-16 20:58:43.099', 'admin', '2025-04-16 20:58:55.728');

-- ----------------------------
-- Table structure for wms_merchant
-- ----------------------------
DROP TABLE IF EXISTS `wms_merchant`;
CREATE TABLE `wms_merchant`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `merchant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `merchant_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `merchant_type` tinyint(4) NULL DEFAULT NULL,
  `merchant_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bank_account` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mobile` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tel` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_person` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_merchant
-- ----------------------------
INSERT INTO `wms_merchant` VALUES (1828354016258199554, 'cs_0001', '南宁江南区某有限公司', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-27 16:49:01.319', 'admin', '2025-04-16 20:45:26.894');
INSERT INTO `wms_merchant` VALUES (1828354153193836545, 'cs_0002', '南宁青秀区某有限公司', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-27 16:49:33.964', 'admin', '2025-04-16 20:45:53.562');
INSERT INTO `wms_merchant` VALUES (1828354284882399233, 'cs_0003', '南宁西乡塘区某有限公司', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-27 16:50:05.367', 'admin', '2025-04-16 20:46:16.970');
INSERT INTO `wms_merchant` VALUES (1912487836544737282, 'cs_0004', '南宁良庆区某有限公司', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2025-04-16 20:46:47.202', 'admin', '2025-04-16 20:46:47.202');

-- ----------------------------
-- Table structure for wms_movement_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_movement_order`;
CREATE TABLE `wms_movement_order`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `movement_order_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `source_warehouse_id` bigint(20) NULL DEFAULT NULL,
  `source_area_id` bigint(20) NULL DEFAULT NULL,
  `target_warehouse_id` bigint(20) NULL DEFAULT NULL,
  `target_area_id` bigint(20) NULL DEFAULT NULL,
  `movement_order_status` tinyint(4) NULL DEFAULT NULL,
  `total_quantity` decimal(10, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_movement_order
-- ----------------------------
INSERT INTO `wms_movement_order` VALUES (1828682788358529025, 'YK08281599', 1828364609002311682, NULL, 1828364459110469633, NULL, 1, 1.00, NULL, 'admin', '2024-08-28 14:35:26.686', 'admin', '2024-08-28 14:35:26.686');
INSERT INTO `wms_movement_order` VALUES (1829418487672139777, 'YK08301821', 1828364740028174337, 1829397566185992193, 1828364740028174337, 1829397621378838530, 1, 2.00, NULL, 'kucun', '2024-08-30 15:18:51.082', 'kucun', '2024-08-30 15:20:28.751');

-- ----------------------------
-- Table structure for wms_movement_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_movement_order_detail`;
CREATE TABLE `wms_movement_order_detail`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `movement_order_id` bigint(20) NULL DEFAULT NULL,
  `sku_id` bigint(20) NULL DEFAULT NULL,
  `quantity` decimal(20, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `batch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `production_date` datetime(3) NULL DEFAULT NULL,
  `expiration_date` datetime(3) NULL DEFAULT NULL,
  `source_warehouse_id` bigint(20) NULL DEFAULT NULL,
  `source_area_id` bigint(20) NULL DEFAULT NULL,
  `target_warehouse_id` bigint(20) NULL DEFAULT NULL,
  `target_area_id` bigint(20) NULL DEFAULT NULL,
  `inventory_detail_id` bigint(20) NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_movement_order_detail
-- ----------------------------
INSERT INTO `wms_movement_order_detail` VALUES (1828682788677296129, 1828682788358529025, 1828408321522700289, 1.00, NULL, NULL, NULL, NULL, 1828364609002311682, 1828364666585911297, 1828364459110469633, 1828364518342430721, 1828633048015118337, 'admin', '2024-08-28 14:35:26.771', 'admin', '2024-08-28 14:35:26.771');
INSERT INTO `wms_movement_order_detail` VALUES (1829418488129318914, 1829418487672139777, 1829399118304964609, 1.00, NULL, NULL, NULL, NULL, 1828364740028174337, 1829397566185992193, 1828364740028174337, 1829397621378838530, 1829399580546625538, 'kucun', '2024-08-30 15:18:51.187', 'kucun', '2024-08-30 15:20:28.882');
INSERT INTO `wms_movement_order_detail` VALUES (1829418488129318915, 1829418487672139777, 1829399118304964610, 1.00, NULL, NULL, NULL, NULL, 1828364740028174337, 1829397566185992193, 1828364740028174337, 1829397621378838530, 1829399580546625539, 'kucun', '2024-08-30 15:18:51.188', 'kucun', '2024-08-30 15:20:29.026');

-- ----------------------------
-- Table structure for wms_receipt_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_receipt_order`;
CREATE TABLE `wms_receipt_order`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `receipt_order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `receipt_order_type` int(11) NULL DEFAULT NULL,
  `merchant_id` bigint(20) NULL DEFAULT NULL,
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_quantity` decimal(10, 2) NULL DEFAULT NULL,
  `payable_amount` decimal(10, 2) NULL DEFAULT NULL,
  `receipt_order_status` tinyint(4) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL,
  `area_id` bigint(20) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_receipt_order
-- ----------------------------
INSERT INTO `wms_receipt_order` VALUES (1828410750511292417, 'RK08270491', 2, NULL, NULL, 3.00, NULL, 1, 1828364609002311682, 1828364666585911297, NULL, 'admin', '2024-08-27 20:34:27.816', 'admin', '2024-08-27 20:34:27.816');
INSERT INTO `wms_receipt_order` VALUES (1829399579699376129, 'RK08302046', 2, NULL, NULL, 998.00, NULL, 1, 1828364740028174337, NULL, NULL, 'admin', '2024-08-30 14:03:43.061', 'admin', '2024-08-30 14:03:43.061');

-- ----------------------------
-- Table structure for wms_receipt_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_receipt_order_detail`;
CREATE TABLE `wms_receipt_order_detail`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `receipt_order_id` bigint(20) NULL DEFAULT NULL,
  `sku_id` bigint(20) NULL DEFAULT NULL,
  `quantity` decimal(20, 2) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `batch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `production_date` datetime(3) NULL DEFAULT NULL,
  `expiration_date` datetime(3) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL,
  `area_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_receipt_order_detail
-- ----------------------------
INSERT INTO `wms_receipt_order_detail` VALUES (1828410750972665857, 1828410750511292417, 1828408796968030210, 1.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-27 20:34:27.928', 'admin', '2024-08-27 20:34:27.928', 1828364609002311682, 1828364666585911297);
INSERT INTO `wms_receipt_order_detail` VALUES (1828410750972665858, 1828410750511292417, 1828408796968030211, 1.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-27 20:34:27.931', 'admin', '2024-08-27 20:34:27.931', 1828364609002311682, 1828364666585911297);
INSERT INTO `wms_receipt_order_detail` VALUES (1828410750972665859, 1828410750511292417, 1828408796968030212, 1.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-27 20:34:27.932', 'admin', '2024-08-27 20:34:27.932', 1828364609002311682, 1828364666585911297);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531841, 1829399579699376129, 1829399118304964609, 100.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.145', 'admin', '2024-08-30 14:03:43.145', 1828364740028174337, 1829397566185992193);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531842, 1829399579699376129, 1829399118304964610, 100.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.146', 'admin', '2024-08-30 14:03:43.146', 1828364740028174337, 1829397566185992193);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531843, 1829399579699376129, 1829398702011904001, 100.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.146', 'admin', '2024-08-30 14:03:43.146', 1828364740028174337, 1829397661719654401);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531844, 1829399579699376129, 1829398702011904002, 100.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.146', 'admin', '2024-08-30 14:03:43.146', 1828364740028174337, 1829397661719654401);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531845, 1829399579699376129, 1829398492779048962, 99.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.147', 'admin', '2024-08-30 14:03:43.147', 1828364740028174337, 1829397621378838530);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531846, 1829399579699376129, 1829398492779048963, 99.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.150', 'admin', '2024-08-30 14:03:43.150', 1828364740028174337, 1829397621378838530);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580026531847, 1829399579699376129, 1829398333903007745, 99.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.150', 'admin', '2024-08-30 14:03:43.150', 1828364740028174337, 1829397707726974978);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580093640706, 1829399579699376129, 1829398333903007746, 100.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.153', 'admin', '2024-08-30 14:03:43.153', 1828364740028174337, 1829397707726974978);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580093640707, 1829399579699376129, 1829398193024724993, 100.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.154', 'admin', '2024-08-30 14:03:43.154', 1828364740028174337, 1829397742493560833);
INSERT INTO `wms_receipt_order_detail` VALUES (1829399580093640708, 1829399579699376129, 1829398193024724994, 101.00, NULL, NULL, NULL, NULL, NULL, 'admin', '2024-08-30 14:03:43.154', 'admin', '2024-08-30 14:03:43.154', 1828364740028174337, 1829397742493560833);

-- ----------------------------
-- Table structure for wms_shipment_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_shipment_order`;
CREATE TABLE `wms_shipment_order`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `shipment_order_no` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `shipment_order_type` int(11) NULL DEFAULT NULL,
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `merchant_id` bigint(20) NULL DEFAULT NULL,
  `receivable_amount` decimal(10, 2) NULL DEFAULT NULL,
  `total_quantity` decimal(10, 2) NULL DEFAULT NULL,
  `shipment_order_status` tinyint(4) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL,
  `area_id` bigint(20) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_shipment_order
-- ----------------------------
INSERT INTO `wms_shipment_order` VALUES (1828633402429612034, 'CK08286097', 1, NULL, NULL, NULL, 3.00, 1, 1828364459110469633, 1828364518342430721, NULL, 'admin', '2024-08-28 11:19:12.166', 'admin', '2024-08-28 11:19:20.263');
INSERT INTO `wms_shipment_order` VALUES (1829405767363129345, 'CK08305241', 2, NULL, NULL, NULL, 10.00, 1, 1828364740028174337, NULL, NULL, 'kucun', '2024-08-30 14:28:18.316', 'kucun', '2024-08-30 14:30:21.057');
INSERT INTO `wms_shipment_order` VALUES (1829407217174638593, 'CK08304574', 2, NULL, NULL, NULL, 2.00, 1, 1828364740028174337, 1829397566185992193, NULL, 'kucun', '2024-08-30 14:34:03.985', 'kucun', '2024-08-30 14:34:11.116');

-- ----------------------------
-- Table structure for wms_shipment_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_shipment_order_detail`;
CREATE TABLE `wms_shipment_order_detail`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `shipment_order_id` bigint(20) NULL DEFAULT NULL,
  `sku_id` bigint(20) NULL DEFAULT NULL,
  `quantity` decimal(10, 2) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL,
  `area_id` bigint(20) NULL DEFAULT NULL,
  `batch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `production_date` datetime(3) NULL DEFAULT NULL,
  `expiration_date` datetime(3) NULL DEFAULT NULL,
  `inventory_detail_id` bigint(20) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_shipment_order_detail
-- ----------------------------
INSERT INTO `wms_shipment_order_detail` VALUES (1828633402760962050, 1828633402429612034, 1828408796968030210, 1.00, NULL, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, 1828631499662630916, NULL, 'admin', '2024-08-28 11:19:12.248', 'admin', '2024-08-28 11:19:20.373');
INSERT INTO `wms_shipment_order_detail` VALUES (1828633402760962051, 1828633402429612034, 1828408796968030210, 1.00, NULL, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, 1828632673883201537, NULL, 'admin', '2024-08-28 11:19:12.249', 'admin', '2024-08-28 11:19:20.481');
INSERT INTO `wms_shipment_order_detail` VALUES (1828633402760962052, 1828633402429612034, 1828408796968030211, 1.00, NULL, 1828364459110469633, 1828364518342430721, NULL, NULL, NULL, 1828632673883201538, NULL, 'admin', '2024-08-28 11:19:12.249', 'admin', '2024-08-28 11:19:20.587');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767753199617, 1829405767363129345, 1829399118304964609, 1.00, NULL, 1828364740028174337, 1829397566185992193, NULL, NULL, NULL, 1829399580546625538, NULL, 'kucun', '2024-08-30 14:28:18.415', 'kucun', '2024-08-30 14:30:21.183');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767753199618, 1829405767363129345, 1829399118304964610, 1.00, NULL, 1828364740028174337, 1829397566185992193, NULL, NULL, NULL, 1829399580546625539, NULL, 'kucun', '2024-08-30 14:28:18.416', 'kucun', '2024-08-30 14:30:21.325');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767753199619, 1829405767363129345, 1829398492779048962, 1.00, NULL, 1828364740028174337, 1829397621378838530, NULL, NULL, NULL, 1829399580613734404, NULL, 'kucun', '2024-08-30 14:28:18.416', 'kucun', '2024-08-30 14:30:21.441');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767753199620, 1829405767363129345, 1829398492779048963, 1.00, NULL, 1828364740028174337, 1829397621378838530, NULL, NULL, NULL, 1829399580613734405, NULL, 'kucun', '2024-08-30 14:28:18.417', 'kucun', '2024-08-30 14:30:21.580');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767753199621, 1829405767363129345, 1829398702011904001, 1.00, NULL, 1828364740028174337, 1829397661719654401, NULL, NULL, NULL, 1829399580613734402, NULL, 'kucun', '2024-08-30 14:28:18.417', 'kucun', '2024-08-30 14:30:21.775');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767820308481, 1829405767363129345, 1829398702011904002, 1.00, NULL, 1828364740028174337, 1829397661719654401, NULL, NULL, NULL, 1829399580613734403, NULL, 'kucun', '2024-08-30 14:28:18.427', 'kucun', '2024-08-30 14:30:22.007');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767820308482, 1829405767363129345, 1829398333903007745, 1.00, NULL, 1828364740028174337, 1829397707726974978, NULL, NULL, NULL, 1829399580613734406, NULL, 'kucun', '2024-08-30 14:28:18.428', 'kucun', '2024-08-30 14:30:22.223');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767887417345, 1829405767363129345, 1829398333903007746, 1.00, NULL, 1828364740028174337, 1829397707726974978, NULL, NULL, NULL, 1829399580613734407, NULL, 'kucun', '2024-08-30 14:28:18.437', 'kucun', '2024-08-30 14:30:22.422');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767887417346, 1829405767363129345, 1829398193024724993, 1.00, NULL, 1828364740028174337, 1829397742493560833, NULL, NULL, NULL, 1829399580613734408, NULL, 'kucun', '2024-08-30 14:28:18.438', 'kucun', '2024-08-30 14:30:22.578');
INSERT INTO `wms_shipment_order_detail` VALUES (1829405767887417347, 1829405767363129345, 1829398193024724994, 1.00, NULL, 1828364740028174337, 1829397742493560833, NULL, NULL, NULL, 1829399580613734409, NULL, 'kucun', '2024-08-30 14:28:18.438', 'kucun', '2024-08-30 14:30:22.811');
INSERT INTO `wms_shipment_order_detail` VALUES (1829407217568903170, 1829407217174638593, 1829399118304964609, 1.00, NULL, 1828364740028174337, 1829397566185992193, NULL, NULL, NULL, 1829399580546625538, NULL, 'kucun', '2024-08-30 14:34:04.068', 'kucun', '2024-08-30 14:34:11.232');
INSERT INTO `wms_shipment_order_detail` VALUES (1829407217568903171, 1829407217174638593, 1829399118304964610, 1.00, NULL, 1828364740028174337, 1829397566185992193, NULL, NULL, NULL, 1829399580546625539, NULL, 'kucun', '2024-08-30 14:34:04.069', 'kucun', '2024-08-30 14:34:11.355');

-- ----------------------------
-- Table structure for wms_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `wms_warehouse`;
CREATE TABLE `wms_warehouse`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `warehouse_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `warehouse_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_num` bigint(20) NULL DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_warehouse
-- ----------------------------
INSERT INTO `wms_warehouse` VALUES (1828364459110469633, NULL, '江南区分部仓库', NULL, 0, 'admin', '2024-08-27 17:30:31.084', 'admin', '2025-04-16 20:48:08.084');
INSERT INTO `wms_warehouse` VALUES (1828364609002311682, NULL, '青秀区分部仓库', NULL, 1, 'admin', '2024-08-27 17:31:06.821', 'admin', '2025-04-16 20:48:19.159');
INSERT INTO `wms_warehouse` VALUES (1828364740028174337, NULL, '南宁总仓', NULL, 2, 'admin', '2024-08-27 17:31:38.066', 'admin', '2025-04-16 20:47:52.756');

SET FOREIGN_KEY_CHECKS = 1;
