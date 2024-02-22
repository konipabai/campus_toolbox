// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 数据库里已审核通过的订单
export interface DB_resultClassroomDto {
    date: Date;
    time: string;
    classroomNumber: string;
}

// 数据库里的订单
export interface DB_pendingClassroomDto {
    account: string;
    classroomNumber: string;
    reason: string;
    date: Date | string;
    time: string;
    state: string;
    location: string;
    floor: string;
}

// 后端筛选出来的教室数据
export interface BE_filterClassroomDto {
    classroomBuilding: string;
    classroomFloor: string;
    classroomNumber: string;
    date: Date | string;
    time: string[];
}

// 前端查询请求的教室数据
export interface FE_getClassroomDto {
    building: string;
    floor: string;
    date: Date;
    time: string;
}

// 前端预约请求的教室数据
export interface FE_postClassroomDto {
    accountAndName: string;
    classroomNumber: string;
    dateAndTime: string;
    reason: string
    location: string;
    floor: string;
}