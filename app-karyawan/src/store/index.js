import Vue from 'vue'
import Vuex from 'vuex'
import task from './modules/task'
import userTaskGroup from './modules/userTaskGroup'
import groupTask from './modules/groupTask'
import user from './modules/user'
import userTask from './modules/userTask'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    insertSuccessMessage: 'Berhasil ditambahkan',
    updateSuccessMessage: 'Berhasil ditambahkan',
    deleteSuccessMessage: 'Berhasil ditambahkan',
    serverErrorMessage: 'Terjadi kesalahan pada server'
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    task,
    userTaskGroup,
    groupTask,
    user,
    userTask
  }
})
