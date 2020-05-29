import Vue from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify';
import firebase from'firebase';
import axios from 'axios'
import api from '@/api.js'

Vue.config.productionTip = false
// axios.defaults.baseURL = 'http://cpns.palugada.biz.id/backend/api'
axios.defaults.baseURL = 'http://localhost:8000/backend/api'

const config = {
  apiKey: "AIzaSyAGXPPSZkTQC0Qq5zoFmoDe3AdvbPBHYKE",
  authDomain: "test-7a393.firebaseapp.com",
  databaseURL: "https://test-7a393.firebaseio.com",
  projectId: "test-7a393",
  storageBucket: "test-7a393.appspot.com",
  messagingSenderId: "41585094071",
  appId: "1:41585094071:web:7ea0c93d5c38f5f0ac8c32"
}

firebase.initializeApp(config)

router.beforeEach((to, from, next) => {
  if(to.name != "Login"){
    firebase.auth().onAuthStateChanged(function(user) {
      if (user) {
        api.getAllUserWhereUID(user.uid).then(response => {
          if(response.length == 0){
            firebase.auth().signOut()
          }else{
            store.commit('setKaryawan', response)
            localStorage.setItem('tasks', JSON.stringify(response.tasks))
            next()
          }
        }).catch(() => {
          firebase.auth().signOut()
          next({ name: 'Login' })
        })
      }else next({ name: 'Login' })
    });
  }else{
    next()
  }
})


new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
