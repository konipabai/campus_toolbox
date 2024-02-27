// 数据提供者
// 数据库: DB = database
// 前端:   FE = frontend
// 后端:   BE = backend

// 前端获取新闻传来的数据
export interface FE_getNewsDto {
    url: string;
    detail: string;
}

// 后端处理之后传回前端的数据
export interface BE_filterNewsDto {
    title: string;
    description: string;
    date: string;
    imgUrl: string;
    detailUrl: string;
}

