import { defineStore } from "pinia";

export const accountStore = defineStore("accountStore", {
    state: () => ({
        account: '',
        role: ''
    }),
    actions: {
        changeState(accountData: string, roleData: string) {
            this.account = accountData
            this.role = roleData
        }
    }
})