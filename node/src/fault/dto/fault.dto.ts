// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 数据库查询出来的数据
export interface DB_resultFaultDto {
    id: number;
    account: string;
    item: string;
    location: string;
    number: string;
    contact: string;
    description: string;
    date: Date | string;
}

// 前端发布/更新失物招领传来的数据
export interface FE_postFaultDto {
    id?: number;
    account: string;
    item: string;
    location: string;
    number: string;
    contact: string;
    description: string;
    date?: Date | string;
    state?: string;
}

// 前端查询失物招领传来的数据
export interface FE_getFaultDto {
    account: string;
}