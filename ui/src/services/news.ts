import { request } from '@umijs/max';

// 定义新闻数据类型
export interface NewsItem {
  id: string;
  title: string;
  content: string;
  source: string;
  publishTime: string;
  url: string;
  sentiment?: 'positive' | 'negative' | 'neutral';
  keywords?: string[];
}

// 刷新爬取新闻
export async function refreshNews() {
  return request<{ success: boolean; message: string }>('/api/news/refresh', {
    method: 'POST',
  });
}

// 获取爬取的新闻列表
export async function getNewsList(params?: { page?: number; pageSize?: number; source?: string }) {
  return request<{ data: NewsItem[]; total: number }>('/api/news/list', {
    method: 'GET',
    params,
  });
}

// 使用AI分析新闻
export async function analyzeNewsWithAI(params?: { newsIds?: string[] }) {
  return request<{ success: boolean; message: string; analysis?: any }>('/api/news/analyze', {
    method: 'POST',
    data: params,
  });
}