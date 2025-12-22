import React from 'react';
import styles from './index.less'; 
import { FileTextOutlined, UngroupOutlined, TableOutlined, SettingOutlined,BulbOutlined } from '@ant-design/icons';
import { history } from 'umi';
import '../User/Login/Fall.less';

const HomePage = () => {
    const navigateToBasicInfo = (pathname: string) => {
        localStorage.setItem('curpath', pathname);
        history.push('/'+pathname);
    };

    return (
        <div className={styles.container} style={{ backgroundImage: `url(/image/login.jpg)` }}>
            {/* 硬币坠落动画容器 */}
            <div className="coin-fall-container">
                {Array.from({ length: 20 }).map((_, index) => (
                    <div key={index} className={`coin coin-${index + 1}`}></div>
                ))}
            </div>
            <div className={styles.rotatingCoin}></div>
            <div className={styles.title}>AI驱动数字货币投资辅助系统</div>
            <div className={styles.menuGrid}>
                {/* AI爬取新闻 */}
                <div className={styles.menuItem}>
                    <button onClick={() => navigateToBasicInfo("Get")} className={styles.menuButton}>
                        <TableOutlined className={styles.menuIcon} />
                        <div className={styles.menuText}>AI爬取新闻</div>
                    </button>
                </div>

                {/* 虚拟货币行情 */}
                <div className={styles.menuItem}>
                    <button onClick={() => navigateToBasicInfo("GetList")} className={styles.menuButton}>
                        <UngroupOutlined className={styles.menuIcon} />
                        <div className={styles.menuText}>虚拟货币行情</div>
                    </button>
                </div>

                {/* 虚拟货币商店 */}
                <div className={styles.menuItem}>
                    <button onClick={() => navigateToBasicInfo("GetListAi")} className={styles.menuButton}>
                        <BulbOutlined className={styles.menuIcon} />
                        <div className={styles.menuText}>虚拟货币商店</div>
                    </button>
                </div>
            </div>
        </div>
    );
};

export default HomePage;