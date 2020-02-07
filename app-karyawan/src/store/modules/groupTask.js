import axios from 'axios'
const tableName = 'group_task'

const groupTask = {
    state: {
    },
    mutations: {
    },
    actions: {
        insertGroupTask(){
            return new Promise((resolve, reject) => {
                let data = {
                    userTaskGroupId: this.state.userTaskGroup.id,
                    taskId: this.state.userTaskGroup.taskId
                }

                axios.post(tableName, data).then(() => {
                    resolve(this.state.insertSuccessMessage)
                }).catch(error => {
                    if(error.response.status == 500) reject(this.state.serverErrorMessage)
                })
            })
        },
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