// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 数据库里已处理的订单结果
export class DB_resultClassroomDto {
    account: string;
    name: string;
    reason: string;
    date: string;
    time: string;
    classroomNumber: string;
    state: string;
}

// 数据库里待处理的订单
export class DB_pendingClassroomDto {
    account: string;
    name: string;
    classroomNumber: string;
    reason: string;
    date: string;
    time: string;
}

// 后端筛选出来的教室数据
export interface BE_filterClassroomDto {
    classroomBuilding: string;
    classroomFloor: string;
    classroomNumber: string;
    date: string;
    time: string[];
}

// 前端查询请求的教室数据
export interface FE_findClassroomDto {
    building: string;
    floor: string;
    date: string;
    time: string;
}

// 前端预约请求的教室数据
export interface FE_reserveClassroomDto {
    accountAndName: string;
    classroomNumber: string;
    dateAndTime: string;
    reason: string
}