import { defineStore } from "pinia";

export const menuControlStore = defineStore("menuControlStore", {
    state: () => ({
        isCollapse: false
    }),
    actions: {
        changeState() {
            this.isCollapse = !this.isCollapse
        }
    }
})