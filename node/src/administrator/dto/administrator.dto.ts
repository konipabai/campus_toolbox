// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 前端查询传来的数据
export interface FE_getAdministratorDto {
    account: string;
}

// 前端更新传来的数据
export interface FE_updateAdministratorDto {
    account: string;
    id: number;
    state: string;
    reasonRefusal: string;
}

// 数据库里的数据，name,class为后端处理后需要
export interface DB_resultClassroomAdministratorDto {
    id: number;
    account: string;
    classroomNumber: string;
    reason: string;
    date: Date | string;
    time: string;
    state: string;
    location: string;
    floor: string;
    reasonRefusal: string;
    name?: string;
    class?: string;
}