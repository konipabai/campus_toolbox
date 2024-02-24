// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 后端处理之后的数据
export interface BE_filterRecruitmentDto {
    id: number;
    name: string;
    hr: string;
    job: string;
    description: string;
    salary: number;
    requirements: string[];
    benefits: string;
    contact: string;
    location: string;
}

// 数据库查询出来的数据
export interface DB_resultRecruitmentDto {
    id?: number;
    name: string;
    hr: string;
    job: string;
    description: string;
    salary: number;
    requirements: string;
    benefits: string;
    contact: string;
    location: string;
}

// 前端查询传来的数据
export interface FE_getRecruitmentDto {
    job: string;
    bottom: number;
    top: number;
}