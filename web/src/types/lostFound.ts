export interface getLostFoundType {
    id: number,
    item: string,
    state: string,
    name: string,
    value: number,
    brand: string,
    location: string,
    date: Date,
    description: string,
    contact: string,
    switch: string,
    overdue: string
}

export interface postLostFoundType {
    id: number,
    account: string,
    state: string,
    item: string,
    brand: string,
    location: string,
    date: Date | string,
    description: string,
    contact: string,
    switch: string
}

export interface deleteLostFoundType {
    id: number,
    account: string
}

export interface getAccountLostFoundType {
    account: string
}