import { createRouter, createWebHistory } from 'vue-router'

// 연결할 각 컴포넌트 import (src/views폴더 아래 컴포넌트들 생성해둠)
import MainPage from '../views/HomeView.vue'
import Page1 from '../views/Page1.vue'
import Page2 from '../views/Page2.vue'
import Page3 from '../views/Page3.vue'

// 라우터 설계
const routes = [
    {
        path: '/',
        name: 'main',
        component: MainPage,
    },
    {
        path: '/page1',
        name: 'page1',
        component: Page1,
    },
    {
        path: '/page2',
        name: 'page2',
        component: Page2,
    },
    {
        path: '/page3',
        name: 'page3',
        component: Page3,
    },
]
  
// 라우터 생성
const router = createRouter({
    history: createWebHistory(),
    routes
});

// 라우터 추출 (main.js에서 import)
export {router}