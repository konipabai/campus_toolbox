// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 前端查询球场信息传来的数据
export interface FE_getSportsDto {
    type: string;
    time: [Date, Date];
    date: string;
}

// 前端请求预约球场传来的数据
export interface FE_postSportsDto {
    account: string;
    date: string;
    time: [Date, Date];
    type: string;
    court: string;
    location: string;
    collaborative: string;
    number: string;
}