export interface getSeatType {
    floor: string;
    date: string;
}

export interface postSeatType {
    account: string,
    date: string
    time: [Date, Date]
    floor: string,
    number: string,
    order: string[],
    seat: string,
}

export interface findSeatType {
    number: string;
    time: string[];
    seat: string[];
}