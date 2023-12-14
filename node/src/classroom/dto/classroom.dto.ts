// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 数据库里已处理的订单结果
export interface DB_resultClassroomDto {
    date: string;
    time: string;
    classroomNumber: string;
}

// 数据库里待处理的订单
export interface DB_pendingClassroomDto {
    account: string;
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
export interface FE_getClassroomDto {
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