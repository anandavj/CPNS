import axios from 'axios';

const tableName = "user_task_group"

const userTaskGroup = {
    state:{
        id: null,
        name: null,
        taskId: []
    },
    mutations:{
        setNewUserTaskGroup(state){
            state.id = null
            state.name = null
            state.taskId = []
        },
        setUserTaskGroup(state, value){
            state.id = value.id
            state.name = value.name
            state.taskId = value.taskId
        },
        setUserTaskGroupId(state, value){
            state.id = value
        },
        setUserTaskGroupName(state, value){
            state.name = value
        },
        setTaskId(state, value){
            state.taskId = value
        }
    },
    actions: {
        insertUserTaskGroup(){
            return new Promise((resolve, reject) => {
                axios.post(tableName, this.state.userTaskGroup)
                .then(response => {
                    this.state.userTaskGroup.id = response.data.id
                    resolve(this.state.insertSuccessMessage)
                })
                .catch(error => {
                    if(error.response.status == 500) reject(this.state.serverErrorMessage)
                })
            })
        },
        getAllUserTaskGroup(){
            return new Promise((resolve, reject) => {
                axios.get(tableName)
                .then(response => {
                    resolve(response.data);
                })
                .catch(error => {
                    if(error.response.status == 500) reject(this.state.serverErrorMessage)
                })
            })
        },
        updateUserTaskGroup(){
            return new Promise((resolve, reject) => {
                axios.put(tableName, this.state.userTaskGroup)
                .then(() => {
                    resolve(this.state.updateSuccessMessage);
                })
                .catch(error => {
                    if(error.response.status == 500) reject(this.state.serverErrorMessage)
                })
            })
        },
        deleteUserTaskGroup(){
            return new Promise((resolve, reject) => {
                axios.delete(tableName, {params: {id: this.state.userTaskGroup.id}})
                .then(() => {
                    resolve(this.state.deleteSuccessMessage);
                })
                .catch(error => {
                    if(error.response.status == 500) reject(this.state.serverErrorMessage)
                })
            })
        },
    }
}

export default userTaskGroup