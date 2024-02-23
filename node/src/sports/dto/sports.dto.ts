// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 前端查询球场信息传来的数据
export interface FE_getSportsDto {
    type: string;
    time: [Date, Date];
    date: Date;
}

// 前端请求预约球场传来的数据
export interface FE_postSportsDto {
    id: number;
    account: string;
    date: Date;
    time: [Date | string, Date | string];
    typeAndCourt: string;
    location: string;
    collaborative: string;
    number: number;
    ownership: string;
}

// 后端处理之后传回前端的数据
export interface BE_filterSportsDto {
    id: number[];
    sportsType: string;
    sportsCourt: string;
    date: Date;
    reserveTime: [Date, Date],
    time: [Date, Date][];
    location: string[];
    number: number[];
    collaborative: string[];
}

// 数据库查询出来的数据
export interface DB_resultSportsDto {
    id: number;
    account: string;
    date: Date;
    startTime: Date;
    endTime: Date;
    type: string;
    court: string;
    location: string;
    collaborative: string;
    number: number;
    ownership: string;
    valid: string;
}

// 后端处理时的临时合并数据
export interface BE_mergedSportsDto {
    time: [Date, Date];
    location: string;
    number: number;
    collaborative: string;
    id: number;
}