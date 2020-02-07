import axios from 'axios'
const tableName = 'group_task'

const groupTask = {
    state: {

    },
    mutations: {

    },
    actions: {
        getGroupTaskByUserTaskGroupId(){
            return new Promise((resolve, reject) => {
                axios.get(tableName, {params: {userTaskGroupId: this.state.userTaskGroup.id}})
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

export default groupTask