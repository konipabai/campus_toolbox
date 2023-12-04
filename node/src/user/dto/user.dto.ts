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
}