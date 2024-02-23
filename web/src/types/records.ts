export interface getRecordsType {
    account: string;
    reservedType: string;
}

export interface updateClassroomRecordsType {
    id: number;
    account: string;
    reason: string;
    date: Date;
    time: string;
    classroomNumber: string;
    state: string;
    location: string;
    floor: string;
    reasonRefusal: string;
    reservedType: string;
}

export interface updateSeatRecordsType {
    id: number;
    account: string;
    floor: string;
    date: Date;
    number: string;
    time: string;
    seat: string;
    reservedType: string;
}

export interface updateSportsRecordsType {
    id: number;
    account: string;
    date: Date;
    startTime: Date;
    endTime: Date;
    type: string;
    court: string;
    location: string;
    collaborative: string;
    number: number;
    ownership: string;
    valid: string;
    reservedType: string;
}

export interface deleteRecordsType {
    id: number;
    reservedType: string;
}

export interface paginationRecordsType {
    currentPage: number;
    pageSize: number;
}