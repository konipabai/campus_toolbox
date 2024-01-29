export interface getSportsType {
    type: string;
    date: Date | string;
    time: [Date | string, Date | string];
}

export interface postSportsType {
    id: number;
    account: string;
    date: Date | string;
    time: [Date | string, Date | string];
    typeAndCourt: string;
    location: string;
    collaborative: string;
    number: number;
    ownership: string;
}

export interface reserveSportsType {
    typeAndCourt: string;
    dateAndTime: string;
    reserveOrder: [string, string[], number, string, number, string][];
    reserveTime: [Date | string, Date | string];
    location: string;
    collaborative: string;
    number: number;
    ownership: string;
}

export interface resultSportsType {
    sportsType: string;
    sportsCourt: string;
    date: Date;
    reserveTime: [Date, Date];
    time: string[][];
    location: string[];
    collaborative: string;
    number: number[];
    id: number[];
}