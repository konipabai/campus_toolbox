import { createRouter, createWebHistory, createWebHashHistory, createMemoryHistory, RouteRecordRaw, Router } from "vue-router";

const routes: Array<RouteRecordRaw> = [
    {
        path: '/home',
        meta: {
            msg: "首页",
            father: "false"
        },
        component: () => import("../components/contents/home/index.vue")
        
    },
    {
        path: '/orders',
        meta: {
            msg: "管理订单",
            father: "true"
        },
        children: [
            {
                path: 'reservations',
                meta: {
                    msg: "管理预约订单",
                    father: "true"
                },
                children: [
                    {
                        path: 'approveOrders',
                        meta: {
                            msg: "审批预约订单",
                            father: "false"
                        },
                        component: () => import("../components/contents/orders/reservations/approveOrders/index.vue")
                    },
                    {
                        path: 'approvalRecords',
                        meta: {
                            msg: "审批记录",
                            father: "false"
                        },
                        component: () => import("../components/contents/orders/reservations/approvalRecords/index.vue")
                    }
                ]
            },
            {
                path: 'maintenance',
                meta: {
                    msg: "管理报修订单",
                    father: "true"
                },
                children: [
                    {
                        path: 'approveOrders',
                        meta: {
                            msg: "审批报修订单",
                            father: "false"
                        },
                        component: () => import("../components/contents/orders/maintenance/approveOrders/index.vue")
                    },
                    {
                        path: 'approvalRecords',
                        meta: {
                            msg: "审批记录",
                            father: "false"
                        },
                        component: () => import("../components/contents/orders/maintenance/approvalRecords/index.vue")
                    },
                ]
            },
            {
                path: 'lf',
                meta: {
                    msg: "管理失物招领",
                    father: "false"
                },
                component: () => import("../components/contents/orders/lf/index.vue")
            },
        ]
    },
    {
        path: '/classroom',
        meta: {
            msg: "预约教室",
            father: "false"
        },
        component: () => import("../components/contents/classroom/index.vue")
    },
    {
        path: '/seat',
        meta: {
            msg: "预约图书馆座位",
            father: "false"
        },
        component: () => import("../components/contents/seat/index.vue")
    },
    {
        path: '/sports',
        meta: {
            msg: "预约球场",
            father: "false"
        },
        component: () => import("../components/contents/sports/index.vue")
    },
    {
        path: '/records',
        meta: {
            msg: "预约记录",
            father: "false"
        },
        component: () => import("../components/contents/records/index.vue")
    },
    {
        path: '/fault',
        meta: {
            msg: "故障报修",
            father: "true"
        },
        children: [
            {
                path: 'apply',
                meta: {
                    msg: "申请报修",
                    father: "false"
                },
                component: () => import("../components/contents/fault/apply/index.vue")
            },
            {
                path: 'records',
                meta: {
                    msg: "报修记录",
                    father: "false"
                },
                component: () => import("../components/contents/fault/records/index.vue")
            }
        ]

    },
    {
        path: '/lostFound',
        meta: {
            msg: "失物招领",
            father: "true"
        },
        children: [
            {
                path: 'view',
                meta: {
                    msg: "查看失物招领",
                    father: "false"
                },
                component: () => import("../components/contents/lostFound/view/index.vue")
            },
            {
                path: 'post',
                meta: {
                    msg: "发布失物招领",
                    father: "false"
                },
                component: () => import("../components/contents/lostFound/post/index.vue")
            },
            {
                path: 'history',
                meta: {
                    msg: "发布记录",
                    father: "false"
                },
                component: () => import("../components/contents/lostFound/history/index.vue")
            },
        ]

    },
    {
        path: '/recruitment',
        meta: {
            msg: "校园招聘",
            father: "true"
        },
        children: [
            {
                path: 'view',
                meta: {
                    msg: "查看招聘信息",
                    father: "false"
                },
                component: () => import("../components/contents/recruitment/view/index.vue")
            },
            {
                path: 'edit',
                meta: {
                    msg: "编辑招聘信息",
                    father: "false"
                },
                component: () => import("../components/contents/recruitment/edit/index.vue")
            },
        ]
    },
    {
        path: '/news',
        meta: {
            msg: "校园新闻",
            father: "false"
        },
        component: () => import("../components/contents/news/index.vue")
    }
]

const router: Router = createRouter({
    history: createWebHistory(),
    routes
})

export default router