// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 数据库查询出来的用户数据
export interface DB_resultUserDto {
    account: string;
    name: string;
    class: string;
    password: string;
    administrator: string;
}

// 前端登录传来的数据
export interface FE_getUserDto {
    account: string;
    password: string;
}

// 后端筛选出来的数据
export interface BE_filterUserDto {
    account: string;
    name: string;
    class: string;
    administrator: string;
}