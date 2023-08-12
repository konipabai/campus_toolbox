export interface getLostFoundType {
    state: string,
    name: string,
    value: number,
    brand: string,
    location: string,
    time: string,
    description: string,
    contact: string
}

export interface postLostFoundType {
    account: string,
    name: string,
    state: string,
    item: string,
    brand: string,
    location: string,
    time: string,
    description: string,
    contact: string
}