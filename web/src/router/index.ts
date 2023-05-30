import { createRouter, createWebHistory, createWebHashHistory, createMemoryHistory, RouteRecordRaw, Router } from "vue-router";

const routes: Array<RouteRecordRaw> = [
    {
        path: '/home',
        component: () => import("../components/contents/home/index.vue")
    },
    {
        path: '/orders/reservations/approveOrders',
        component: () => import("../components/contents/orders/reservations/approveOrders/index.vue")
    },
    {
        path: '/orders/reservations/approvalRecords',
        component: () => import("../components/contents/orders/reservations/approvalRecords/index.vue")
    },
    {
        path: '/orders/maintenance/approveOrders',
        component: () => import("../components/contents/orders/maintenance/approveOrders/index.vue")
    },
    {
        path: '/orders/maintenance/approvalRecords',
        component: () => import("../components/contents/orders/maintenance/approvalRecords/index.vue")
    },
    {
        path: '/orders/lf',
        component: () => import("../components/contents/orders/lf/index.vue")
    },
    {
        path: '/classroom',
        component: () => import("../components/contents/classroom/index.vue")
    },
    {
        path: '/seat',
        component: () => import("../components/contents/seat/index.vue")
    },
    {
        path: '/sports',
        component: () => import("../components/contents/sports/index.vue")
    },
    {
        path: '/records',
        component: () => import("../components/contents/records/index.vue")
    },
    {
        path: '/fault/apply',
        component: () => import("../components/contents/fault/apply/index.vue")
    },
    {
        path: '/fault/records',
        component: () => import("../components/contents/fault/records/index.vue")
    },
    {
        path: '/lostFound/view',
        component: () => import("../components/contents/lostFound/view/index.vue")
    },
    {
        path: '/lostFound/post',
        component: () => import("../components/contents/lostFound/post/index.vue")
    },
    {
        path: '/lostFound/history',
        component: () => import("../components/contents/lostFound/history/index.vue")
    },
    {
        path: '/recruitment/view',
        component: () => import("../components/contents/recruitment/view/index.vue")
    },
    {
        path: '/recruitment/edit',
        component: () => import("../components/contents/recruitment/edit/index.vue")
    },
    {
        path: '/news',
        component: () => import("../components/contents/news/index.vue")
    }
]

const router: Router = createRouter({
    history: createWebHistory(),
    routes
})

export default router