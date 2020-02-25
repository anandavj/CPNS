import Vue from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify';
import VueSelectImage from 'vue-select-image'
Vue.use(VueSelectImage)

// add stylesheet
require('vue-select-image/dist/vue-select-image.css')
Vue.config.productionTip = false

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
