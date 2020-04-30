import Vue from 'vue'
import Vuex from 'vuex'
import search from './modules/searchProduct'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    insertSuccessMessage: 'Berhasil ditambahkan',
    updateSuccessMessage: 'Berhasil ditambahkan',
    deleteSuccessMessage: 'Berhasil ditambahkan',
    serverErrorMessage: 'Terjadi kesalahan pada server',
    karyawan: [],
  },
  mutations: {
    setKaryawan(state, value){
      state.karyawan = value
    }
  },
  actions: {
  },
  modules: {
    search
  }
})
