import { defineStore } from "pinia";

export const accountStore = defineStore("accountStore", {
    state: () => ({
        account: JSON.parse(localStorage.getItem('userData') || '{}').account || '',
        role: JSON.parse(localStorage.getItem('userData') || '{}').administrator || '',
        name: JSON.parse(localStorage.getItem('userData') || '{}').name || '',
        class: JSON.parse(localStorage.getItem('userData') || '{}').class || '',
    }),
    actions: {
        resetState() {
            this.account = JSON.parse(localStorage.getItem('userData') || '{}').account || '',
            this.role = JSON.parse(localStorage.getItem('userData') || '{}').administrator || '',
            this.name = JSON.parse(localStorage.getItem('userData') || '{}').name || '',
            this.class = JSON.parse(localStorage.getItem('userData') || '{}').class || ''
        }
    }
})