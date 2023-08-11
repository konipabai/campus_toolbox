export interface findClassroomType {
    classroomBuilding: string;
    classroomFloor: string;
    classroomNumber: string;
    date: string;
    time: string[];
}

export interface searchClassroomType {
    building: string;
    floor: string;
    date: string;
    time: string;
}

export interface reserveClassroomType {
    accountAndName: string;
    classroomNumber: string;
    dateAndTime: string;
    reason: string;
}

export interface paginationClassroomType {
    currentPage: number;
    pageSize: number;
}