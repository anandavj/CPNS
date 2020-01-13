import Vue from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify';
import firebase from'firebase';

Vue.config.productionTip = false

const config = {
  apiKey: "AIzaSyAobkxlDIvHQzVCZAWHbdMkp-s7pBMxbIQ",
  authDomain: "buana-paksa.firebaseapp.com",
  databaseURL: "https://buana-paksa.firebaseio.com",
  projectId: "buana-paksa",
  storageBucket: "buana-paksa.appspot.com",
  messagingSenderId: "759752117446",
  appId: "1:759752117446:web:99cbb7601d135e5fc39bc7",
  measurementId: "G-BENKLSZT65"
}

firebase.initializeApp(config)

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
