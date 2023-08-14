// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 后端处理之后的教室数据
export class BE_filterLostFoundDto {
    name: string;
    item: string;
    state: string;
    value: number;
    brand: string;
    location: string;
    time: string;
    description: string;
    contact: string;
    switch: string;
    overdue: string;
}

// 数据库查询出来的数据
export class DB_resultLostFoundDto {
    account: string;
    name: string;
    state: string;
    item: string;
    brand: string;
    location: string;
    description: string;
    contact: string;
    time: string;
    switch: string;
    overdue: string;
}

// 前端发布失物招领传来的数据(switch,overdue是数据库需要)
export interface FE_postLostFoundDto {
    account: string;
    name: string;
    state: string;
    item: string;
    brand: string;
    location: string;
    time: string;
    description: string;
    contact: string;
    switch: string;
    overdue: string;
}

// 前端查询失物招领传来的数据
export interface FE_getLostFoundDto {
    account: string;
}