import { request } from '@umijs/max';

/** 查询用户虚拟货币购买记录列表 */
export async function listUserCryptoPurchasesPage(params: any) {
  return request<{
    code: number;
    msg: string;
    rows: any[];
    total: number;
  }>('/api/wms/userCryptoPurchases/list', { params });
}

/** 查询用户虚拟货币购买记录列表(不分页) */
export async function listUserCryptoPurchases(params: any) {
  return request('/api/wms/userCryptoPurchases/listNoPage', { params });
}

/** 查询用户虚拟货币购买记录详情 */
export async function getUserCryptoPurchases(id: number) {
  return request(`/api/wms/userCryptoPurchases/${id}`);
}

/** 新增用户虚拟货币购买记录 */
export async function addUserCryptoPurchases(params: any) {
  return request('/api/wms/userCryptoPurchases', { method: 'POST', data: params });
}

/** 修改用户虚拟货币购买记录 */
export async function editUserCryptoPurchases(params: any) {
  return request('/api/wms/userCryptoPurchases', { method: 'PUT', data: params });
}

/** 调整用户虚拟货币购买记录卖出数量 */
export async function adjustUserCryptoPurchasesSellQuantity(params: any) {
  return request('/api/wms/userCryptoPurchases/adjustSellQuantity', { method: 'PUT', data: params });
}

/** 删除用户虚拟货币购买记录 */
export async function removeUserCryptoPurchases(id: number) {
  return request(`/api/wms/userCryptoPurchases/${id}`, { method: 'DELETE' });
}

/** 批量删除用户虚拟货币购买记录 */
export async function removeUserCryptoPurchasesBatch(ids: number[]) {
  return request('/api/wms/userCryptoPurchases/removeBatch', { method: 'DELETE', data: ids });
}

/** 获取虚拟货币名称列表 */
export async function getCryptoNames() {
  return request('/api/wms/userCryptoPurchases/cryptoNames');
}

/** 获取所有虚拟货币最新价格 */
export async function getLatestPrices() {
  return request('/api/wms/userCryptoPurchases/latestPrices');
}

/** 获取指定虚拟货币最新价格 */
export async function getLatestPrice(cryptoName: string) {
  return request(`/api/wms/userCryptoPurchases/latestPrice/${cryptoName}`);
}