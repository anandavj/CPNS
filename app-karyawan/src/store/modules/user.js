import axios from 'axios';

const tableName = "user"

const user = {
    state: {
        id: null,
        email: null,
        password: null,
        name: null,
        userTaskGroup: null, 
        birthPlace: null,
        birthDate: null,
        religion: null,
        status: null, 
        address: null,
        telephone: null,
        user_task: []
    },

    mutations: {
        setNewUser(state) {
            state.id =null
            state.email = null
            state.password = null
            state.name = null
            state.userTaskGroup = null
            state.birthPlace = null
            state.birthDate = null
            state.religion = null
            state.status = null 
            state.address = null
            state.telephone = null
            state.user_task = []
        },
        setUserId(state, value){
            state.id = value
        },
        setEmail(state, value){
            state.id = value
        },
        setPassword(state, value){
            state.id = value
        },
    },

    actions: {
        insertUser(commit, karyawan){
            // let data = {
            //     name: karyawan.nama,
            //     email: karyawan.email,
            //     password: karyawan.password,
            //     placeOfBirth: karyawan.tempatLahir,
            //     dateOfBirth: karyawan.tanggalLahir,
            //     religion: karyawan.agama,
            //     status: karyawan.status,
            //     address: karyawan.alamat,
            //     telephone: karyawan.noTelp,
            //     tasks: karyawan.tasks,
            //     userTaskGroupId: karyawan.userTaskGroupId,
            //     uid: ''
            // }
            return new Promise((resolve, reject) => {
                axios.post(tableName, karyawan)                
                .then(() => {
                    resolve(this.state.insertSuccessMessage)
                })
                .catch(error => {
                    if(error.response.status == 500) reject(this.state.serverErrorMessage)
                })
            })
        },

        getAllUser(){
            return new Promise((resolve, reject) => {
                axios.get(tableName).then(response => {
                    resolve(response.data)
                })
                .catch(error => {
                    if(error.response.status == 500) reject(this.state.serverErrorMessage)
                })
            })
        }
    }
}

export default user