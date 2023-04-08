import { createApp } from 'vue'
import App from './App.vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap'
import 'bootstrap/dist/js/bootstrap.bundle.min.js'
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'
import router from './router'
import { library } from '@fortawesome/fontawesome-svg-core';
import { faHome, faExchange } from '@fortawesome/free-solid-svg-icons';
import '@fortawesome/fontawesome-svg-core/styles.css'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

const vuetify = createVuetify({
    components,
    directives,
  })

library.add(faHome, faExchange);
createApp(App)
.use(router)
.use(vuetify)
.component('VueDatePicker', VueDatePicker)
.component('font-awesome-icon', FontAwesomeIcon)
.mount('#app')
