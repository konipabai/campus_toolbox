// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 前端查询传来的数据
export interface FE_getAdministratorDto {
    account: string;
    orderType: string;
}

// 预约教室前端更新传来的数据
export interface FE_updateClassroomAdministratorDto {
    account: string;
    id: number;
    state: string;
    reasonRefusal: string;
    orderType: string;
}

// 故障报修前端更新传来的数据
export interface FE_updateFaultAdministratorDto {
    account: string;
    id: number;
    state: string;
    orderType: string;
}

// 失物招领前端更新传来的数据
export interface FE_updateLFAdministratorDto {
    account: string;
    id: number;
    overdue: string;
    orderType: string;
}

// 预约教室数据库里的数据，name,class为后端处理后需要
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

// 故障报修数据库里的数据，name,class为后端处理后需要
export interface DB_resultFaultAdministratorDto {
    id: number;
    account: string;
    item: string;
    location: string;
    number: string;
    contact: string;
    description: string;
    date: Date | string;
    name?: string;
    class?: string;
}

// 失物招领数据库查询出来的数据，name,class为后端处理后需要
export interface DB_resultLostFoundAdministratorDto {
    id: number;
    account: string;
    state: string;
    item: string;
    brand: string;
    location: string;
    description: string;
    contact: string;
    date: Date;
    switch: string;
    overdue: string;
    name?: string;
    class?: string;
}