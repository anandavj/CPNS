import axios from "axios"
const tableName = 'task'

const task = {
    state: {
    },
    mutations: {
    },
    actions: {
        getAllTask(){
            return new Promise((resolve, reject) => {
                axios.get(tableName)
                .then(response => {
                    resolve(response.data);
                })
                .catch(error => {
                    if(error.response.status == 500) reject(this.state.serverErrorMessage)
                })
            })
        }
    }
}

export default task