import { createApp } from 'vue'
import App from './App.vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap'
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'
import router from './router'

const vuetify = createVuetify({
    components,
    directives,
  })

createApp(App)
.use(router)
.use(vuetify)
.component('VueDatePicker', VueDatePicker)
.mount('#app')
