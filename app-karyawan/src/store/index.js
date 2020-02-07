import Vue from 'vue'
import Vuex from 'vuex'
import task from './modules/task'
import userTaskGroup from './modules/userTaskGroup'
import groupTask from './modules/groupTask'

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
    task,
    userTaskGroup,
    groupTask
  }
})
