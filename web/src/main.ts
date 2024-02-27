import { createApp } from 'vue'
import './assets/css/reset.less'
import "./assets/css/elementuiVariables.css";
import App from './App.vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import { createPinia } from 'pinia'
import router from './router';

const pinia = createPinia()
const app = createApp(App)

const access: string[] = [
    '/classroom',
    '/lostFound/view',
    '/lostFound/postHistory',
    '/seat',
    '/sports',
    '/fault',
    '/news',
    '/recruitment',
    '/records',
    '/orders/reserve',
    '/orders/fault',
    '/orders/lf',
    '/orders/recruitment',
]
router.beforeEach((to, from, next) => {
    if ((access.includes(to.path) && localStorage.getItem('token') && localStorage.getItem('userData')) || to.path == '/') {
        next()
    } else {
        next('/')
    }
})

app.use(ElementPlus)
app.use(pinia)
app.use(router)

app.mount('#app')
