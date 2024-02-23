export interface getOrderReserveType {
    account: string;
}

export interface updateOrderReserveType {
    account: string;
    id: number;
    state: string;
    reasonRefusal: string;
}

export interface resultOrderReserveType {
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

export interface paginationOrderReserveType {
    currentPage: number;
    pageSize: number;
}