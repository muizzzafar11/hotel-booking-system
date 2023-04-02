import * as VueRouter from 'vue-router'
import LandingPage from './screens/LandingPage.vue'
import ConfirmationPage from './screens/ConfirmationPage.vue'
import HotelPage from './screens/HotelPage.vue'
import RoomBookingPage from './screens/RoomBookingPage.vue'

const routes = [
    { path: '/', name: "Home", component: LandingPage },
    { path: '/hotel', name: "Hotel", component: HotelPage },
    { path: '/book', name: "Book-Room", component: RoomBookingPage },
    { path: '/confirmation', name: "Confirmation", component: ConfirmationPage },
]

const router = VueRouter.createRouter({
    history: VueRouter.createWebHashHistory(),
    routes: routes,
})

export default router