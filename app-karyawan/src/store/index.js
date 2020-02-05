import Vue from 'vue'
import Vuex from 'vuex'
import userTaskGroup from './modules/userTaskGroup'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    insertSuccessMessage: 'Berhasil ditambahkan',
    serverErrorMessage: 'Terjadi kesalahan pada server'
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    userTaskGroup,
  }
})
