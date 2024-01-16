export interface searchSportsType {
    type: string;
    date: string;
    time: [Date, Date];
}

export interface reserveSportsType {
    typeAndCourt: string;
    dateAndTime: string;
    reserveOrder: string[];
    location: string;
    collaborative: string;
    number: number;
}