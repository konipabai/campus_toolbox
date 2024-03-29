// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 前端查询座位信息传来的数据
export interface FE_getSeatDto {
    floor: string;
    date: Date;
}

// 前端请求预约座位传来的数据
export interface FE_postSeatDto {
    account: string;
    floor: string;
    date: Date;
    number: string;
    time: [Date, Date];
    seat: string;
}

// 后端处理时的临时合并数据
export interface BE_mergedSeatDto {
    time: string;
    seat: string;
}

// 后端处理之后传回前端的数据
export interface BE_filterSeatDto {
    number: string;
    time: string[];
    seat: string[];
}

// 数据库查询出来的数据
export interface DB_resultSeatDto {
    account: string;
    floor: string;
    date: Date;
    number: string;
    time: string;
    seat: string;
}
