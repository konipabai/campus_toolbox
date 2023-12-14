// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 后端处理之后的教室数据
export interface BE_filterLostFoundDto {
    id: number;
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
export interface DB_resultLostFoundDto {
    id: number;
    account: string;
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

// 前端发布/更新失物招领传来的数据(switch,overdue是数据库需要)
export interface FE_postLostFoundDto {
    id?: number;
    account: string;
    state: string;
    item: string;
    brand: string;
    location: string;
    time: string;
    description: string;
    contact: string;
    switch?: string;
    overdue?: string;
}

// 前端查询失物招领传来的数据
export interface FE_getLostFoundDto {
    account: string;
}