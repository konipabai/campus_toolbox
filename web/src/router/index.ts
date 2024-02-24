import { createRouter, createWebHistory, RouteRecordRaw, Router } from "vue-router";

const routes: Array<RouteRecordRaw> = [
    {
        path: '/orders',
        meta: {
            msg: "管理员菜单",
            father: "true"
        },
        children: [
            {
                path: 'reserve',
                meta: {
                    msg: "审批预约订单",
                    father: "false"
                },
                component: () => import("../components/contents/orders/reserve/index.vue")
            },
            {
                path: 'fault',
                meta: {
                    msg: "审批报修订单",
                    father: "false"
                },
                component: () => import("../components/contents/orders/fault/index.vue")
            },
            {
                path: 'lf',
                meta: {
                    msg: "管理失物招领",
                    father: "false"
                },
                component: () => import("../components/contents/orders/lf/index.vue")
            },
            {
                path: 'recruitment',
                meta: {
                    msg: "发布招聘信息",
                    father: "false"
                },
                component: () => import("../components/contents/orders/recruitment/index.vue")
            }
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
            father: "false"
        },
        component: () => import("../components/contents/fault/index.vue")

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
                path: 'postHistory',
                meta: {
                    msg: "发布与记录",
                    father: "false"
                },
                component: () => import("../components/contents/lostFound/postHistory/index.vue")
            }
        ]

    },
    {
        path: '/recruitment',
        meta: {
            msg: "校园招聘",
            father: "false"
        },
        component: () => import("../components/contents/recruitment/index.vue")
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