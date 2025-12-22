import { request } from '@umijs/max';

// 查询虚拟货币价格信息列表（分页）
export async function listCryptoPriceInfoPage(query?: any) {
  return request('/api/wms/cryptoPriceInfo/list', {
    method: 'GET',
    params: query,
    // 设置请求头避免缓存
    headers: {
      'Cache-Control': 'no-cache',
      'Pragma': 'no-cache'
    },
    // 不使用缓存
    skipErrorHandler: false
  });
}

// 查询虚拟货币价格信息列表（无分页）
export async function listCryptoPriceInfo(query?: any) {
  return request('/api/wms/cryptoPriceInfo/listNoPage', {
    method: 'GET',
    params: query
  });
}

// 刷新虚拟货币价格信息 - 使用AI爬取最新数据
export async function refreshCryptoPriceInfo() {
  return request('/api/wms/cryptoPriceInfo/refresh', {
    method: 'POST',
    timeout: 600000, // 设置10分钟超时，因为从AI爬取数据可能需要较长时间
    // 确保每次都是新请求
    data: { _t: Date.now() }
  });
}