export interface getFaultType {
    id: number,
    account: string,
    item: string,
    location: string,
    number: string,
    contact: string,
    description: string,
    date: Date | string,
    state: string
}

export interface postFaultType {
    id: number,
    account: string,
    item: string,
    location: string,
    number: string,
    contact: string,
    description: string,
}

export interface deleteFaultType {
    id: number,
}

export interface getAccountFaultType {
    account: string
}