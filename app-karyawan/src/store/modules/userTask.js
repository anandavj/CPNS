import axios from 'axios'
const tableName = 'user_task'

const userTask = {
    state: {
    },
    mutations: {
    },
    actions: {
        getUserTaskById(commit, id){
            return new Promise((reslove, reject) => {
                axios.get(tableName, {params: {id: id}}).then(response => {
                    reslove(response.data)
                }).catch(error => {
                    reject(error)
                })
            })
        }
    }
}

export default userTask