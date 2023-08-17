export interface getLostFoundType {
    id: number,
    item: string,
    state: string,
    name: string,
    value: number,
    brand: string,
    location: string,
    time: string,
    description: string,
    contact: string,
    switch: string,
    overdue: string
}

export interface postLostFoundType {
    id: number,
    account: string,
    name: string,
    state: string,
    item: string,
    brand: string,
    location: string,
    time: string,
    description: string,
    contact: string,
    switch: string
}

export interface deleteLostFoundType {
    id: number,
}

export interface getAccountLostFoundType {
    account: string
}