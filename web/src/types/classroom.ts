export interface findClassroomType {
    classroomBuilding: string;
    classroomFloor: string;
    classroomNumber: string;
    date: string;
    time: string[];
}

export interface searchType {
    buildingValue: string;
    floorValue: string;
    dateValue: string;
    timeValue: string;
}

export interface reserveType {
    accountAndName: string;
    classroomNumber: string;
    dateAndTime: string;
    reason: string;
}

export interface paginationType {
    currentPage: number;
    pageSize: number;
}