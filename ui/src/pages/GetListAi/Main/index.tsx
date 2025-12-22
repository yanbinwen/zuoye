import React, { useState, useEffect } from 'react';
import { Button, Card, Space, Table, Modal, Form, InputNumber, Select } from 'antd';
import { ReloadOutlined, PlusOutlined, DeleteOutlined, ShoppingCartOutlined } from '@ant-design/icons';
import { message } from 'antd';
import { useModel } from '@umijs/max';
import { listUserCryptoPurchasesPage, addUserCryptoPurchases, removeUserCryptoPurchases, editUserCryptoPurchases, getCryptoNames, getLatestPrices } from '@/services/wms/userCryptoPurchases';
import styles from './index.less';

// 推荐加密货币数据类型
interface RecommendedCoin {
  name: string;
  symbol: string;
  price: number;
  change: number;
  change_percent: number;
  num: number;
}

interface UserCryptoPurchases {
  id: number;
  userId: number;
  cryptoName: string;
  amount: number;
  pricePerUnit: number;
  totalSpent: number;
  purchaseDate: string;
  createTime: string;
  updateTime: string;
}

// 定义分页结果类型
interface PageResult {
  current: number;
  pageSize: number;
  total: number;
  rows: UserCryptoPurchases[];
}

// 定义API返回结果类型
interface ApiResult<T> {
  code: number;
  message: string;
  data: T;
}

// 定义分页请求参数类型
interface PageParams {
  pageNum?: number;
  pageSize?: number;
  [key: string]: any;
}

const UserCryptoPurchasesPage: React.FC = () => {
  const [purchasesList, setPurchasesList] = useState<UserCryptoPurchases[]>([]);
  const [total, setTotal] = useState(0);
  const [loading, setLoading] = useState(false);
  const [buttonLoading, setButtonLoading] = useState(false);
  const [queryParams, setQueryParams] = useState({ 
    pageNum: 1, 
    pageSize: 10 
  });
  
  // 虚拟货币名称列表
  const [cryptoNames, setCryptoNames] = useState<string[]>([]);
  // 虚拟货币价格映射
  const [cryptoPrices, setCryptoPrices] = useState<Map<string, number>>(new Map());
  // 价格输入是否禁用
  const [priceDisabled, setPriceDisabled] = useState(false);
  // 选中的记录
  const [selectedRecord, setSelectedRecord] = useState<UserCryptoPurchases | null>(null);

  // Buy and Sell modals
  const [buyModalVisible, setBuyModalVisible] = useState(false);
  const [sellModalVisible, setSellModalVisible] = useState(false);
  const [sellAmount, setSellAmount] = useState(0);
  const [buyForm] = Form.useForm();
  const [sellForm] = Form.useForm();

  const { initialState } = useModel('@@initialState');
  
  // 推荐加密货币状态
  const [recommendedCoins, setRecommendedCoins] = useState<RecommendedCoin[]>([]);
  const [showRecommendations, setShowRecommendations] = useState(false);
  const [recommendationLoading, setRecommendationLoading] = useState(false);
  
  // 格式化价格函数
  const formatPrice = (value: any): string => {
    try {
      const numValue = Number(value);
      if (isNaN(numValue)) {
        return '0.00';
      }
      // 格式化数字，确保只有两位小数
      const formatted = numValue.toFixed(2);
      return formatted;
    } catch (error) {
      console.error('格式化价格出错:', error, '原始值:', value);
      return '0.00';
    }
  };
  
  // 获取推荐的加密货币
  const fetchRecommendedCoins = async () => {
    setRecommendationLoading(true);
    setShowRecommendations(true);
    try {
      // 简化token获取逻辑
      const token = localStorage.getItem('token') || localStorage.getItem('Authorization') || '';
      
      // 构建请求头
      const headers = {
        'Authorization': token ? `Bearer ${token}` : '',
        'Content-Type': 'application/json'
      };
      
      // 发起请求
      const response = await fetch('/wms/cryptoRecommendation/getRecommendations', {
        headers: headers
      });
      
      // 检查网络响应状态
      if (!response.ok) {
        message.error(`获取推荐货币失败：网络请求错误（状态码: ${response.status}）`);
        setRecommendedCoins([]);
        return;
      }
      
      // 解析JSON响应
      const data = await response.json();
      
      // 处理业务逻辑
      if (data.code === 200) {
        // 检查是否有数据
        if (data.data && data.data.length > 0) {
          message.success('获取推荐货币成功');
          setRecommendedCoins(data.data);
        } else {
          // 显示友好提示，即使没有数据也不报错
          message.info('暂无推荐货币数据');
          setRecommendedCoins([]);
        }
      } else {
        message.error(data.message || '获取推荐货币失败');
        setRecommendedCoins([]);
      }
    } catch (error) {
      console.error('获取推荐货币发生错误:', error);
      // 优化错误提示，避免用户困惑
      message.error('获取推荐货币时出现网络问题，请稍后重试');
      setRecommendedCoins([]);
    } finally {
      setRecommendationLoading(false);
    }
  };

  // 获取用户虚拟货币购买记录列表
  const fetchPurchasesList = async () => {
    setLoading(true);
    try {
      const res = await listUserCryptoPurchasesPage(queryParams);
      if (res.code === 200) {
          const originalList = res.rows || [];
          // 强制限制每页显示数量为10条
          const limitedList = originalList.slice(0, 10);
          setPurchasesList(limitedList);
          setTotal(res.total || 0);
      } else {
        message.error(res.msg || '获取用户虚拟货币购买记录失败');
        setPurchasesList([]);
        setTotal(0);
      }
    } catch (error) {
      message.error('获取用户虚拟货币购买记录失败');
      setPurchasesList([]);
      setTotal(0);
    } finally {
      setLoading(false);
    }
  };
    
  // 合并相同名称的虚拟货币
  const mergeCryptoPurchases = (purchases: UserCryptoPurchases[]): UserCryptoPurchases[] => {
    const mergedMap = new Map<string, UserCryptoPurchases>();
    
    purchases.forEach(purchase => {
      const key = purchase.cryptoName;
      if (mergedMap.has(key)) {
        const existing = mergedMap.get(key)!;
        existing.amount += purchase.amount;
        existing.totalSpent += purchase.totalSpent;
      } else {
        mergedMap.set(key, { ...purchase });
      }
    });
    
    return Array.from(mergedMap.values());
  };

  // Handle sell
  const handleSell = (record: UserCryptoPurchases) => {
    setSelectedRecord(record);
    setSellAmount(record.amount); // 默认卖出全部数量
    setSellModalVisible(true);
  };

  // Handle buy form submit
  const handleBuySubmit = () => {
    buyForm.validateFields().then((values: any) => {
      // 处理cryptoName字段，确保它是字符串类型而不是数组
      const cryptoName = Array.isArray(values.cryptoName) ? values.cryptoName[0] : values.cryptoName;
      
      const params = {
        ...values,
        cryptoName,
        userId: 1, // Replace with actual user ID from authentication context
        totalSpent: values.amount * values.pricePerUnit,
        purchaseDate: new Date().toISOString(), // 使用标准ISO格式，后端已配置对应的解析器
      };
      addUserCryptoPurchases(params).then(res => {
        if (res.code === 200) {
          message.success('购买成功');
          setBuyModalVisible(false);
          fetchPurchasesList(); // Refresh the list
          // 清除缓存，确保下次能获取最新的虚拟货币信息
          localStorage.removeItem('cryptoNamesCache');
          localStorage.removeItem('cryptoPricesCache');
          localStorage.removeItem('cryptoNamesCacheTime');
          buyForm.resetFields();
        } else {
          message.error(res.msg || '购买失败');
        }
      }).catch(error => {
        message.error('购买失败');
      });
    }).catch(error => {
      // Form validation failed
    });
  };

  // Handle sell form submit
  const handleSellSubmit = () => {
    if (!selectedRecord || sellAmount <= 0) return;
    
    // 卖出数量等于持有数量时，直接删除记录
    if (sellAmount >= selectedRecord.amount) {
      removeUserCryptoPurchases(selectedRecord.id).then(res => {
        if (res.code === 200) {
          message.success('卖出成功');
          setSellModalVisible(false);
          fetchPurchasesList(); // Refresh the list
          setSelectedRecord(null);
          // 清除缓存，确保下次能获取最新的虚拟货币信息
          localStorage.removeItem('cryptoNamesCache');
          localStorage.removeItem('cryptoPricesCache');
          localStorage.removeItem('cryptoNamesCacheTime');
        } else {
          message.error(res.msg || '卖出失败');
        }
      }).catch(error => {
        message.error('卖出失败');
      });
    } else {
      // 卖出数量小于持有数量时，更新记录
      const updateParams = {
        id: selectedRecord.id,
        amount: selectedRecord.amount - sellAmount,
        totalSpent: selectedRecord.totalSpent - (sellAmount * selectedRecord.pricePerUnit),
        userId: selectedRecord.userId
      };
      
      editUserCryptoPurchases(updateParams).then(res => {
        if (res.code === 200) {
          message.success('卖出成功');
          setSellModalVisible(false);
          fetchPurchasesList(); // Refresh the list
          setSelectedRecord(null);
        } else {
          message.error(res.msg || '卖出失败');
        }
      }).catch(error => {
        message.error('卖出失败');
      });
    }
  };

  // Handle modal close
  const handleBuyModalClose = () => {
    setBuyModalVisible(false);
    buyForm.resetFields();
  };

  const handleSellModalClose = () => {
    setSellModalVisible(false);
    setSelectedRecord(null);
    sellForm.resetFields();
  };

  // 分页变化
  const handlePageChange = (page: number, pageSize: number) => {
    setQueryParams(prev => ({
      ...prev,
      pageNum: page,
      pageSize: pageSize
    }));
  };

  // 获取虚拟货币名称列表和价格（带缓存逻辑）
  const fetchCryptoNamesAndPrices = async () => {
    // 尝试从缓存获取
    const cacheKey = 'cryptoNamesCache';
    const cachePricesKey = 'cryptoPricesCache';
    const cacheTimeKey = 'cryptoNamesCacheTime';
    const cacheValidity = 5 * 60 * 1000; // 缓存有效期5分钟
    
    try {
      // 检查缓存是否存在且有效
      const cachedTime = localStorage.getItem(cacheTimeKey);
      if (cachedTime) {
        const timeDiff = Date.now() - parseInt(cachedTime, 10);
        if (timeDiff < cacheValidity) {
          const cachedNames = localStorage.getItem(cacheKey);
          const cachedPrices = localStorage.getItem(cachePricesKey);
          if (cachedNames && cachedPrices) {
            const names = JSON.parse(cachedNames);
            const pricesObj = JSON.parse(cachedPrices);
            const pricesMap = new Map<string, number>();
            Object.entries(pricesObj).forEach(([key, value]) => {
              pricesMap.set(key, Number(value));
            });
            setCryptoNames(names);
            setCryptoPrices(pricesMap);
            return; // 缓存有效，直接返回
          }
        }
      }
      
      // 缓存无效或不存在，从后端获取
      const [namesRes, pricesRes] = await Promise.all([
        getCryptoNames(),
        getLatestPrices()
      ]);
      
      // 更新名称列表
      if (namesRes.code === 200 && namesRes.data) {
        setCryptoNames(namesRes.data);
        localStorage.setItem(cacheKey, JSON.stringify(namesRes.data));
      }
      
      // 更新价格映射
      if (pricesRes.code === 200 && pricesRes.data) {
        const pricesMap = new Map<string, number>();
        Object.entries(pricesRes.data).forEach(([key, value]) => {
          pricesMap.set(key, Number(value));
        });
        setCryptoPrices(pricesMap);
        localStorage.setItem(cachePricesKey, JSON.stringify(pricesRes.data));
      }
      
      // 更新缓存时间
      localStorage.setItem(cacheTimeKey, Date.now().toString());
    } catch (error) {
      console.error('获取虚拟货币信息失败:', error);
    }
  };

  // 处理购买推荐的货币
  const handleBuyRecommendedCoin = (coin: RecommendedCoin) => {
    // 打开购买弹窗
    setBuyModalVisible(true);
    
    // 确保价格是有效数字，使用更严格的验证
    let validPrice = 0;
    try {
      // 先尝试直接使用price属性
      validPrice = Number(coin.price);
      // 如果不是有效数字，默认为0
      if (isNaN(validPrice)) {
        validPrice = 0;
      }
    } catch (error) {
      console.error('处理推荐货币价格出错:', error, '原始价格:', coin.price);
      validPrice = 0;
    }
    
    // 填充表单数据
    buyForm.setFieldsValue({
      cryptoName: coin.name,
      pricePerUnit: validPrice,
      amount: 1, // 默认购买少量
    });
    
    // 禁用价格输入
    setPriceDisabled(true);
  };

  // 初始化数据
  useEffect(() => {
    fetchPurchasesList();
    fetchCryptoNamesAndPrices();
  }, [queryParams]);
  
  // 当打开购买模态框时，刷新虚拟货币名称列表和价格
  useEffect(() => {
    if (buyModalVisible) {
      fetchCryptoNamesAndPrices();
    }
  }, [buyModalVisible]);

  // 表格列配置
  const columns = [
    {
      title: '记录ID',
      key: 'rowIndex',
      width: 100,
      render: (_: any, __: any, index: number) => <span className={styles.fontStyles.price}>{index + 1}</span>
    },
    {
      title: '用户ID',
      dataIndex: 'userId',
      key: 'userId',
      width: 100,
      render: (text: number) => <span className={styles.fontStyles.price}>{text}</span>
    },
    {
      title: '虚拟货币名称',
      dataIndex: 'cryptoName',
      key: 'cryptoName',
      width: 150,
      render: (text: string) => <span className={styles.fontStyles.emphasis}>{text}</span>
    },
    {
      title: '购买数量',
      dataIndex: 'amount',
      key: 'amount',
      width: 120,
      render: (text: number) => <span className={styles.fontStyles.price}>{text.toFixed(8)}</span>
    },
    {
      title: '单价(USD)',
      dataIndex: 'pricePerUnit',
      key: 'pricePerUnit',
      width: 150,
      render: (text: number) => <span className={styles.fontStyles.price}>${text.toFixed(2)}</span>
    },
    {
      title: '总花费(USD)',
      dataIndex: 'totalSpent',
      key: 'totalSpent',
      width: 150,
      render: (text: number) => <span className={styles.fontStyles.price}>${text.toFixed(2)}</span>
    },
    {
      title: '购买时间',
      dataIndex: 'purchaseDate',
      key: 'purchaseDate',
      width: 200,
      render: (text: string) => <span className={styles.fontStyles.small}>{new Date(text).toLocaleString()}</span>
    },
    {
      title: '操作',
      key: 'action',
      width: 120,
      render: (_: unknown, record: UserCryptoPurchases) => (
        <Button 
          type="primary" 
          danger 
          onClick={() => handleSell(record)}
          icon={<DeleteOutlined />}
        >
          卖出
        </Button>
      )
    }
  ];

  return (
    <div className={styles.userCryptoPurchasesPage}>
      <Card 
        className={styles.card}
        title={
          <div className={styles.header}>
            <h2 className={styles.title}>虚拟货币持仓</h2>
            <Space className={styles.buttonGroup}>
              <Button 
                type="primary" 
                onClick={() => setBuyModalVisible(true)}
                icon={<PlusOutlined />}
              >
                购买虚拟货币
              </Button>
              <Button 
                onClick={fetchRecommendedCoins}
                icon={<ReloadOutlined />}
                loading={recommendationLoading}
                className={styles.recommendationButton}
              >
                获取推荐
              </Button>
            </Space>
          </div>
        }
      >
        <div className={styles.table}>
          <Table
            columns={columns}
            dataSource={purchasesList.slice(0, 10)}
            rowKey="id"
            loading={loading}
            pagination={{
              current: queryParams.pageNum,
              pageSize: 10,
              total: total,
              onChange: handlePageChange,
              showSizeChanger: false,
              pageSizeOptions: ['10']
            }}
          />
        </div>
      </Card>

      {/* Buy Modal */}
      <Modal
        title="购买虚拟货币"
        visible={buyModalVisible}
        onOk={handleBuySubmit}
        onCancel={handleBuyModalClose}
        okText="确认购买"
        cancelText="取消"
        className={styles.modal}
      >
        <div className={styles.modalContent}>
          <Form form={buyForm} layout="vertical">
            <Form.Item
              name="cryptoName"
              label="虚拟货币名称"
              rules={[{ required: true, message: '请输入虚拟货币名称' }]}
              className={styles.formItem}
            >
              <Select
                mode="tags"
                placeholder="选择或输入虚拟货币名称"
                style={{ width: '100%' }}
                filterOption={(inputValue, option) => {
                  if (!inputValue || !option) return false;
                  return option.label.toLowerCase().includes(inputValue.toLowerCase());
                }}
                options={cryptoNames.map(name => ({ label: name, value: name }))}
                onChange={(value) => {
                  // 处理选择或输入的虚拟货币名称
                  const selectedName = Array.isArray(value) ? value[0] : value;
                  if (selectedName) {
                    // 检查是否为已有货币名称
                    const isExistingCrypto = cryptoNames.includes(selectedName);
                    if (isExistingCrypto) {
                      // 自动填充最新价格
                      const latestPrice = cryptoPrices.get(selectedName);
                      if (latestPrice !== undefined) {
                        buyForm.setFieldsValue({ pricePerUnit: latestPrice });
                        setPriceDisabled(true);
                      } else {
                        setPriceDisabled(false);
                      }
                    } else {
                      setPriceDisabled(false);
                    }
                  }
                }}
              />
            </Form.Item>
            <Form.Item
              name="pricePerUnit"
              label="单价(USD)"
              rules={[{ required: true, type: 'number', min: 0.01, message: '请输入有效的单价' }]}
              className={styles.formItem}
            >
              <InputNumber 
                style={{ width: '100%' }} 
                placeholder="单价" 
                step={0.01}
                disabled={priceDisabled}
              />
            </Form.Item>
            <Form.Item
              name="amount"
              label="购买数量"
              rules={[{ required: true, type: 'number', min: 0.00000001, message: '请输入有效的购买数量' }]}
              className={styles.formItem}
            >
              <InputNumber style={{ width: '100%' }} placeholder="数量" step={0.00000001} />
            </Form.Item>
          </Form>
        </div>
      </Modal>

      {/* 推荐购买区域 */}
      {showRecommendations && (
        <div className={styles.recommendationCard}>
          <div className={styles.recommendationHeader}>
            <h3 className={`${styles.recommendationTitle} ${styles.fontStyles.subtitle}`}>推荐购买</h3>
          </div>
          <div className={styles.recommendationContent}>
            {recommendedCoins.length > 0 ? (
              <div className={styles.recommendationList}>
                {recommendedCoins.map((coin, index) => (
                  <div key={index} className={styles.recommendationItem}>
                    <h4 className={`${styles.recommendationItemTitle} ${styles.fontStyles.emphasis}`}>{coin.name} ({coin.symbol})</h4>
                    <div className={`${styles.recommendationItemPrice} ${styles.fontStyles.price}`}>${formatPrice(coin.price)}</div>
                    <div 
                      className={`${styles.recommendationItemChange} ${coin.change_percent > 0 ? styles.positiveChange : styles.negativeChange}`}
                    >
                      <span className={styles.fontStyles.small}>{Math.abs(coin.change_percent).toFixed(2)}%</span>
                    </div>
                    <Button 
                      className={`${styles.buyButton} ${styles.fontStyles.button}`}
                      onClick={() => handleBuyRecommendedCoin(coin)}
                      icon={<ShoppingCartOutlined />}
                    >
                      立即购买
                    </Button>
                  </div>
                ))}
              </div>
            ) : (
              <p className={styles.fontStyles.body}>暂无推荐的虚拟货币</p>
            )}
          </div>
        </div>
      )}

      {/* Sell Modal */}
      <Modal
        title="卖出虚拟货币"
        visible={sellModalVisible}
        onOk={handleSellSubmit}
        onCancel={handleSellModalClose}
        okText="确认卖出"
        cancelText="取消"
        className={styles.modal}
      >
        <div className={styles.modalContent}>
          <Form form={sellForm} layout="vertical">
            <Form.Item className={styles.formItem}>
              <p><strong>虚拟货币名称:</strong> {selectedRecord?.cryptoName}</p>
              <p><strong>当前持有数量:</strong> {selectedRecord?.amount.toFixed(8)}</p>
              <p><strong>单价:</strong> ${selectedRecord?.pricePerUnit.toFixed(2)}</p>
              <p><strong>总花费:</strong> ${selectedRecord?.totalSpent.toFixed(2)}</p>
              <p><strong>购买时间:</strong> {selectedRecord?.purchaseDate ? new Date(selectedRecord.purchaseDate).toLocaleString() : ''}</p>
            </Form.Item>
            <Form.Item
              name="sellAmount"
              label="卖出数量"
              initialValue={sellAmount}
              rules={[{ required: true, type: 'number', min: 0.00000001, message: '请输入有效的卖出数量' }]}
              className={styles.formItem}
            >
              <InputNumber
                style={{ width: '100%' }}
                min={0.00000001}
                max={selectedRecord?.amount || 0}
                step={0.00000001}
                value={sellAmount}
                onChange={(value) => value !== null && setSellAmount(value)}
              />
            </Form.Item>
          </Form>
        </div>
      </Modal>
    </div>
  );
};

export default UserCryptoPurchasesPage;