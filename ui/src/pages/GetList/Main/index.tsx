import React, { useState, useEffect } from 'react';
import { useModel } from '@umijs/max';
import { Card, Table, Button, message, Space, Typography, Spin } from 'antd';
import { ReloadOutlined, ArrowUpOutlined, ArrowDownOutlined, StarOutlined } from '@ant-design/icons';
import { listCryptoPriceInfoPage, refreshCryptoPriceInfo } from '@/services/wms/cryptoPriceInfo';
import styles from './index.less';

const { Text, Title } = Typography;

interface CryptoPriceInfo {
  id: string;
  rank: string;
  name: string;
  symbol: string;
  price: number;
  change: number;
  changePercent: number;
  date: string;
  marketCapUsd?: string;
  volumeUsd24Hr?: string;
}

const CryptoPriceInfoPage: React.FC = () => {
  const [cryptoList, setCryptoList] = useState<CryptoPriceInfo[]>([]);
  const [total, setTotal] = useState(0);
  const [loading, setLoading] = useState(false);
  const [buttonLoading, setButtonLoading] = useState(false);
  const [queryParams, setQueryParams] = useState({
    pageNum: 1,
    pageSize: 10
  });
  const [lastUpdated, setLastUpdated] = useState<string>('');

  const { initialState } = useModel('@@initialState');

  // 获取虚拟货币价格信息列表
  const fetchCryptoList = async () => {
    setLoading(true);
    try {
      const res = await listCryptoPriceInfoPage(queryParams);
      // 确保响应数据结构正确
      if (res) {
        setCryptoList(res.rows || []);
        setTotal(res.total || 0);
        setLastUpdated(new Date().toLocaleString());
      }
    } catch (error) {
      message.error('获取虚拟货币价格信息失败');
    } finally {
      // 在finally中统一设置loading状态
      setLoading(false);
    }
  };

  // 刷新数据
  const handleRefresh = async () => {
    setButtonLoading(true);
    try {
      // 显示AI处理中的提示
      message.loading('AI正在智能爬取最新数字货币行情数据，请稍候...', 0);
      
      // 增加请求超时时间到10分钟，因为从AI爬取数据可能需要较长时间
      await refreshCryptoPriceInfo();
      
      // 在新消息显示前清理之前的消息
      message.destroy();
      message.success('数据刷新成功，已获取最新行情');
      
      // 重新获取数据
      await fetchCryptoList();
    } catch (error: any) {
      console.error('刷新虚拟货币价格数据失败:', error);
      // 清理之前的消息
      message.destroy();
      message.error('刷新数据失败，可能是AI爬取过程中出现问题，请稍后重试');
    } finally {
      setButtonLoading(false);
    }
  };

  // 分页变化
  const handlePageChange = (page: number, pageSize: number) => {
    setQueryParams(prev => ({
      ...prev,
      pageNum: page,
      pageSize: pageSize
    }));
  };

  // 初始化数据
  useEffect(() => {
    fetchCryptoList();
  }, [queryParams]);

  // 表格列配置
  const columns = [
    {          title: '排名',
      dataIndex: 'rank',
      key: 'rank',
      width: 80,
      render: (text: string) => {
        // 为前三名添加特殊样式
        const rank = parseInt(text);
        let badgeStyle = {};
        if (rank === 1) {
          badgeStyle = { 
            background: 'linear-gradient(135deg, #FFD700, #FFA500)',
            fontWeight: 'bold',
            color: '#fff',
            padding: '2px 8px',
            borderRadius: '4px',
            display: 'inline-block'
          };
        } else if (rank === 2) {
          badgeStyle = { 
            background: 'linear-gradient(135deg, #C0C0C0, #A9A9A9)',
            fontWeight: 'bold',
            color: '#fff',
            padding: '2px 8px',
            borderRadius: '4px',
            display: 'inline-block'
          };
        } else if (rank === 3) {
          badgeStyle = { 
            background: 'linear-gradient(135deg, #CD7F32, #A0522D)',
            fontWeight: 'bold',
            color: '#fff',
            padding: '2px 8px',
            borderRadius: '4px',
            display: 'inline-block'
          };
        }
        
        return <span style={rank <= 3 ? badgeStyle : { fontWeight: '500', color: '#333333' }}>{text}</span>;
      }
    },
    {
      title: '名称',
      dataIndex: 'name',
      key: 'name',
      width: 150,
      render: (text: string) => (
        <span style={{ fontWeight: '500', color: '#1f2937' }}>{text}</span>
      )
    },
    {
      title: '代码',
      dataIndex: 'symbol',
      key: 'symbol',
      width: 100,
      render: (text: string) => (
        <span style={{ 
          background: 'rgba(22, 119, 255, 0.1)',
          color: '#1677ff',
          padding: '4px 8px',
          borderRadius: '4px',
          fontWeight: '600',
          textTransform: 'uppercase',
          fontSize: '12px'
        }}>
          {text}
        </span>
      )
    },
    {
      title: '价格(USD)',
      dataIndex: 'price',
      key: 'price',
      width: 180,
      render: (text: number) => (
        <span style={{ fontWeight: '600', fontSize: '16px', color: '#1f2937' }}>
          ${text.toFixed(2)}
        </span>
      )
    },
    {
      title: '市值(USD)',
      dataIndex: 'marketCapUsd',
      key: 'marketCapUsd',
      width: 200,
      render: (text?: string) => text ? (
        <span style={{ color: '#666666' }}>
          ${(parseFloat(text) / 1e9).toFixed(2)}B
        </span>
      ) : '-' 
    },
    {
      title: '24h成交量(USD)',
      dataIndex: 'volumeUsd24Hr',
      key: 'volumeUsd24Hr',
      width: 200,
      render: (text?: string) => text ? (
        <span style={{ color: '#666666' }}>
          ${(parseFloat(text) / 1e9).toFixed(2)}B
        </span>
      ) : '-'
    },
    {
      title: '24h涨跌幅',
      dataIndex: 'changePercent',
      key: 'changePercent',
      width: 150,
      render: (text: number) => {
        const percent = text;
        const isPositive = percent >= 0;
        const color = isPositive ? '#52c41a' : '#ff4d4f';
        const background = isPositive ? 'rgba(82, 196, 26, 0.1)' : 'rgba(255, 77, 79, 0.1)';
        
        return (
          <span style={{ 
            color,
            backgroundColor: background,
            padding: '4px 12px',
            borderRadius: '16px',
            fontWeight: '600',
            display: 'inline-flex',
            alignItems: 'center',
            gap: '4px'
          }}>
            {isPositive ? <ArrowUpOutlined /> : <ArrowDownOutlined />}
            {percent.toFixed(2)}%
          </span>
        );
      }
    },
    {
      title: '更新时间',
      dataIndex: 'date',
      key: 'date',
      width: 200,
      render: (text: string) => (
        <span style={{ color: '#666666', fontSize: '13px' }}>
          {new Date(text).toLocaleString()}
        </span>
      )
    }
  ];

  // 自定义加载组件
  const renderLoading = () => (
    <div style={{ 
      display: 'flex', 
      flexDirection: 'column', 
      alignItems: 'center', 
      justifyContent: 'center', 
      padding: '60px 20px',
      color: '#666666'
    }}>
      <Spin size="large" style={{ color: '#1677ff' }} />
      <p style={{ marginTop: '16px', fontSize: '16px' }}>AI正在分析最新数字货币市场数据...</p>
    </div>
  );

  return (
    <div className={styles.cryptoPriceInfoPage}>
      <Card>
        <div className={styles.cardTitle}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
            <StarOutlined style={{ color: '#1677ff' }} />
            <Title level={4} style={{ margin: 0, color: '#1f2937' }}>AI驱动数字货币投资辅助系统</Title>
          </div>
          
          <Space size="large" align="center">
            {lastUpdated && (
              <Text style={{ color: '#1677ff', fontSize: '13px', fontWeight: '500' }}>
                最后更新: {lastUpdated}
              </Text>
            )}
            
            <Button
              type="primary"
              icon={<ReloadOutlined />}
              loading={buttonLoading}
              onClick={handleRefresh}
              size="middle"
              style={{ transition: 'all 0.3s ease' }}
            >
              刷新数据
            </Button>
            
            <Text className="refresh-tips">
              智能AI实时市场分析，助力投资决策
            </Text>
          </Space>
        </div>
        
        <div style={{ position: 'relative' }}>
          {loading && cryptoList.length === 0 ? (
            renderLoading()
          ) : (
            <Table
              className={styles.table}
              dataSource={cryptoList}
              columns={columns}
              rowKey="id"
              loading={loading}
              pagination={{
                total: total,
                current: queryParams.pageNum,
                pageSize: queryParams.pageSize,
                onChange: handlePageChange,
                showSizeChanger: true,
                pageSizeOptions: ['10', '20', '50', '100'],
                showTotal: (total, range) => (
                  <span style={{ color: '#666666' }}>
                    显示 {range[0]}-{range[1]} 条，共 {total} 条
                  </span>
                )
              }}
              scroll={{ x: 'max-content' }}
              rowClassName={(record, index) => (index % 2 === 0 ? 'even-row' : 'odd-row')}
              size="middle"
            />
          )}
        </div>
      </Card>
    </div>
  );
};

export default CryptoPriceInfoPage;
