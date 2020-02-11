import axios from 'axios';

const tableName = "user"

const user = {
    state: {
        id:null,
        email:'',
        password: '',
        name:'',
        userTaskGroup:'', 
        birthPlace:'',
        birthDate: '',
        religion:'',
        status:'', 
        address:'',
        telephone:'',
        user_task: []
    },

    mutations: {
        setNewUser(state) {
            state.id = null
            state.email = ''
            state.password = ''
            state.name = ''
            state.userTaskGroup = ''
            state.birthPlace = ''
            state.birthDate = ''
            state.religion = ''
            state.status = ''
            state.address = ''
            state.telephone = ''
            state.user_task = []
        },
        setUser(state, value) {
            state.id = value.id
            state.email = value.email
            state.password = value.password
            state.name = value.name
            state.userTaskGroup = value.userTaskGroup
            state.birthPlace = value.birthPlace
            state.birthDate = ''
            state.religion = ''
            state.status = ''
            state.address = ''
            state.telephone = ''
            state.user_task = []
        }
    },

    actions: {

    }
}