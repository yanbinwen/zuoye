import React, { useState, useEffect } from 'react';
import { Table, Card, Input, Select, DatePicker, Space, Tag, Typography, Divider, message } from 'antd';
import type { ColumnsType } from 'antd/es/table';
import { request } from '@umijs/max';
import dayjs from 'dayjs';
import styles from './index.less';

const { Title, Text, Paragraph } = Typography;
const { Search } = Input;
const { Option } = Select;
const { RangePicker } = DatePicker;

// 加密货币新闻数据接口
interface CryptoNews {
  id: number;
  title: string;
  content: string;
  currency: string;
  trend: string;
  magnitude: string;
  createdAt: string;
  updatedAt: string;
}

// 分页参数接口
interface PageParams {
  pageNum?: number;
  pageSize?: number;
  [key: string]: any;
}

// API响应接口
interface ApiResponse {
  code: number;
  data: {
    rows: CryptoNews[];
    total: number;
  };
  msg: string;
}

// 搜索条件接口
interface SearchParams {
  currency?: string;
  trend?: string;
}

const Main: React.FC = () => {
  const [news, setNews] = useState<CryptoNews[]>([]);
  const [summary, setSummary] = useState<string>(''); // 用于存储API返回的summary字段
  const [analysisLoading, setAnalysisLoading] = useState(false); // 分析按钮加载状态
  
  // 获取趋势标签颜色
  const getTrendColor = (trend: string): string => {
    switch (trend) {
      case '上涨':
        return 'green';
      case '下跌':
        return 'red';
      default:
        return 'blue';
    }
  };
  const [loading, setLoading] = useState(false);
  const [refreshLoading, setRefreshLoading] = useState(false);
  const [pagination, setPagination] = useState<PageParams>({
    pageNum: 1,
    pageSize: 10,
  });
  const [total, setTotal] = useState(0);
  const [searchParams, setSearchParams] = useState<SearchParams>({});

  // 获取新闻列表
  const fetchNewsList = async () => {
    setLoading(true);
    try {
      const response = await request<ApiResponse>('/api/wms/cryptoNews/list', {
        params: {
          ...pagination,
          ...searchParams
        }
      });
      
      if (response.code === 200) {
        setNews(response.data.rows || []);
        setTotal(response.data.total || 0);
      } else {
        message.error(response.msg || '获取加密货币新闻失败');
      }
    } catch (error) {
      console.error('获取加密货币新闻失败:', error);
      message.error('获取加密货币新闻时出现网络问题，请稍后重试');
    } finally {
      setLoading(false);
    }
  };

  // 监听分页和搜索条件变化，自动获取数据
  useEffect(() => {
    fetchNewsList();
  }, [pagination, searchParams]);

  // 处理分页变化
  const handlePageChange = (pageNum: number, pageSize: number) => {
    setPagination({ pageNum, pageSize });
  };

  // 处理搜索
  const handleSearch = () => {
    setPagination({ ...pagination, pageNum: 1 });
  };

  // 重置搜索条件
  const handleReset = () => {
    setSearchParams({});
    setPagination({ pageNum: 1, pageSize: 10 });
  };

  // 刷新加密货币新闻数据
  const handleRefreshData = async () => {
    setRefreshLoading(true);
    try {
       // 增加请求超时时间到10分钟
      const response = await request('/api/wms/cryptoNews/refresh', {
        method: 'POST',
        timeout: 600000 // 10分钟超时
      });
      
      if (response.code === 200) {
        // 不再从刷新接口获取summary
        message.success('加密货币新闻数据刷新成功！');
        // 刷新列表数据
        fetchNewsList();
      } else {
        message.error(response.msg || '加密货币新闻数据刷新失败');
      }
    } catch (error) {
      console.error('加密货币新闻数据刷新失败:', error);
      message.error('加密货币新闻数据刷新时出现网络问题，请稍后重试');
    } finally {
      setRefreshLoading(false);
      message.destroy(); // 销毁所有loading消息
    }
  };

  // 获取加密货币市场分析数据
  const handleGetMarketAnalysis = async () => {
    setAnalysisLoading(true);
    try {
      // 增加请求超时时间到5分钟
      const response = await request('/wms/cryptoAnalysis/summary', {
        method: 'POST',
        timeout: 300000 // 5分钟超时
      });
      
      if (response.code === 200 && response.data) {
        // 处理可能包含JSON格式的响应
        let summaryText = response.data.summary || '暂无市场分析数据';
        
        // 1. 尝试解析JSON格式的字符串
        try {
          if (typeof summaryText === 'string') {
            // 清理可能的JSON格式标记
            const cleanText = summaryText.replace(/^```json\s*/, '').replace(/\s*```$/, '').trim();
            
            if (cleanText.startsWith('{') && cleanText.endsWith('}')) {
              const parsedData = JSON.parse(cleanText);
              if (parsedData.summary) {
                summaryText = parsedData.summary;
              }
            } else {
              // 如果不是完整的JSON对象，直接使用清理后的文本
              summaryText = cleanText;
            }
          }
        } catch (parseError) {
          // 如果解析失败，尝试清理格式并保持原样
          console.warn('无法解析summary为JSON:', parseError);
          if (typeof summaryText === 'string') {
            summaryText = summaryText.replace(/^```json\s*/, '').replace(/\s*```$/, '').trim();
          }
        }
        
        setSummary(summaryText);
        message.success('获取市场分析摘要成功！');
      } else {
        message.error(response.msg || '获取市场分析摘要失败');
      }
    } catch (error) {
      console.error('获取市场分析摘要失败:', error);
      message.error('获取市场分析摘要时出现网络问题，请稍后重试');
    } finally {
      setAnalysisLoading(false);
      message.destroy(); // 销毁所有loading消息
    }
  };



  // 表格列定义
  const columns: ColumnsType<CryptoNews> = [
    {
      title: 'ID',
      dataIndex: 'id',
      key: 'id',
      width: 80,
    },
    {
      title: '标题',
      dataIndex: 'title',
      key: 'title',
      ellipsis: true,
      render: (text) => <Text strong>{text}</Text>,
    },
    {
      title: '加密货币',
      dataIndex: 'currency',
      key: 'currency',
      width: 120,
    },
    {
      title: '趋势',
      dataIndex: 'trend',
      key: 'trend',
      width: 80,
      render: (trend) => (
        <Tag color={getTrendColor(trend)}>
          {trend}
        </Tag>
      ),
    },
    {
      title: '影响程度',
      dataIndex: 'magnitude',
      key: 'magnitude',
      width: 150,
      ellipsis: true,
    },
    {
      title: '创建时间',
      dataIndex: 'createdAt',
      key: 'createdAt',
      width: 180,
      render: (date) => dayjs(date).format('YYYY-MM-DD HH:mm:ss'),
    },
    {
      title: '操作',
      key: 'action',
      width: 100,
      render: (_, record) => (
        <Space size="middle">
          <a
            onClick={() => {
              // 查看详情逻辑
              console.log('查看详情:', record);
              // 可以在这里打开详情抽屉或模态框显示完整内容
              message.info(record.content);
            }}
          >
            详情
          </a>
        </Space>
      ),
    },
  ];

  return (
    <Card title="加密货币新闻数据" style={{ minHeight: '100vh' }} className={styles.cryptoNewsPage}>
      {/* 搜索条件 */}
      <div className={styles.searchContainer}>
        <Title level={5} className={styles.searchTitle}>搜索条件</Title>
        <Space wrap style={{ marginBottom: 16 }}>
          <Search
            placeholder="加密货币名称"
            allowClear
            style={{ width: 200 }}
            onSearch={(value) => setSearchParams({ ...searchParams, currency: value })}
            onPressEnter={handleSearch}
          />
          <Select
            placeholder="市场趋势"
            allowClear
            style={{ width: 120 }}
            onChange={(value) => setSearchParams({ ...searchParams, trend: value })}
          >
            <Option value="上涨">上涨</Option>
            <Option value="下跌">下跌</Option>
          </Select>
          <Space className={styles.searchButtons}>
            <button 
              onClick={handleSearch}
              className={styles.searchBtn}
            >
              搜索
            </button>
            <button
              onClick={handleReset}
              className={styles.resetBtn}
            >
              重置
            </button>
            <button
              onClick={handleRefreshData}
              disabled={refreshLoading}
              className={styles.refreshBtn}
            >
              {refreshLoading ? '刷新中...' : '刷新数据'}
            </button>
          <span className="refresh-tips">正在从Dify API刷新加密货币新闻数据（此过程可能需要较长时间，请耐心等待）...</span>
          </Space>
        </Space>
      </div>

      {/* 数据统计 */}
      <div className={styles.dataStatistics}>
        <Text type="secondary" className={styles.statisticsText}>共 {total} 条数据</Text>
      </div>

      {/* 数据表格 */}
      <Table
        columns={columns}
        dataSource={news}
        loading={loading}
        rowKey="id"
        pagination={{
          current: pagination.pageNum,
          pageSize: pagination.pageSize,
          total: total,
          onChange: handlePageChange,
          showSizeChanger: true,
          showTotal: (total) => `共 ${total} 条数据`,
        }}
        scroll={{ x: 1200 }}
        className={styles.newsTable}
      />

      {/* 市场分析摘要 */}
      <Divider style={{ marginTop: 30 }} />
      <div className={styles.marketAnalysis}>
        <div className={styles.analysisHeader}>
          <Title level={5} className={styles.analysisTitle}>市场分析摘要</Title>
          <button
            onClick={handleGetMarketAnalysis}
            disabled={analysisLoading}
            className={styles.analysisButton}
          >
            {analysisLoading ? '分析中...' : '分析'}
          </button>
        </div>
        <div className={styles.analysisContent}>
          {summary || '暂无市场分析数据，请点击分析按钮获取最新市场分析摘要。'}
        </div>
      </div>
    </Card>
  );
};

export default Main;