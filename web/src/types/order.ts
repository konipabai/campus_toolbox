export interface getOrderType {
    account: string;
    orderType: string;
}

export interface updateOrderClassroomType {
    account: string;
    id: number;
    state: string;
    reasonRefusal: string;
    orderType: string;
}

export interface updateOrderFaultType {
    account: string;
    id: number;
    state: string;
    orderType: string;
}

export interface updateOrderLFType {
    account: string;
    id: number;
    overdue: string;
    orderType: string;
}

export interface deleteOrderRecruitmentType {
    account: string;
    id: number;
    orderType: string;
}

export interface resultOrderClassroomType {
    id: number;
    account: string;
    classroomNumber: string;
    reason: string;
    date: Date | string;
    time: string;
    state: string;
    location: string;
    floor: string;
    reasonRefusal: string;
    name?: string;
    class?: string;
}

export interface resultOrderFaultType {
    id: number;
    account: string;
    item: string;
    location: string;
    number: string;
    contact: string;
    description: string;
    date: Date | string;
    name?: string;
    class?: string;
}

export interface resultOrderLFType {
    id: number;
    account: string;
    state: string;
    item: string;
    brand: string;
    location: string;
    description: string;
    contact: string;
    date: Date;
    switch: string;
    overdue: string;
    name?: string;
    class?: string;
}

export interface paginationOrderType {
    currentPage: number;
    pageSize: number;
}