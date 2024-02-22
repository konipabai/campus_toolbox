// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 前端查询传来的数据
export interface FE_getRecordsDto {
    account: string;
    reservedType: string;
}

// 前端删除传来的数据
export interface FE_deleteRecordsDto {
    id: number;
    reservedType: string;
}

// 数据库查询出来的数据-预约教室
export interface DB_resultClassroomDto {
    id: number;
    account: string;
    reason: string;
    date: Date;
    time: string;
    classroomNumber: string;
    state: string;
}

// 数据库查询出来的数据-预约座位
export interface DB_resultSeatDto {
    id: number;
    account: string;
    floor: string;
    date: Date;
    number: string;
    time: string;
    seat: string;
}

// 数据库查询出来的数据-预约球场
export interface DB_resultSportsDto {
    id: number;
    account: string;
    date: Date;
    startTime: Date | string;
    endTime: Date | string;
    type: string;
    court: string;
    location: string;
    collaborative: string;
    number: number;
    ownership: string;
}

// 前端更新传来的数据-预约教室
export interface FE_resultClassroomDto {
    id: number;
    account: string;
    reason: string;
    date: Date;
    time: string;
    classroomNumber: string;
    state: string;
    reservedType: string;
}

// 前端更新传来的数据-预约座位
export interface FE_resultSeatDto {
    id: number;
    account: string;
    floor: string;
    date: Date;
    number: string;
    time: string;
    seat: string;
    reservedType: string;
}

// 前端更新传来的数据-预约球场
export interface FE_resultSportsDto {
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
    reservedType: string;
}