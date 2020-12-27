import Vue from "vue"
import VueRouter from "vue-router"

import HelloWorld from "../views/HelloWorld"

Vue.use(VueRouter)

const routes = [
    {
        path: "/",
        name: "HelloWorld",
        component: HelloWorld
    }
]

const router = new VueRouter({
    mode: "history",
    routes
})

export default router
