export interface findRecruitmentType {
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

export interface getRecruitmentType {
    job: string;
    bottom: number;
    top: number;
}

export interface paginationRecruitmentType {
    currentPage: number;
    pageSize: number;
}