import axios from 'axios';

const tableName = "user_task_group"

const userTaskGroup = {
    state:{
        id: null,
        name: null,
        permissions: []
    },
    mutations:{
        setNewUserTaskGroup(state){
            state.id = null
            state.name = null
        },
        setUserTaskGroup(state, value){
            state.id = value.id
            state.name = value.name
        },
        setUserTaskGroupId(state, value){
            state.id = value
        },
        setUserTaskGroupName(state, value){
            state.name = value
        },
        setPermissions(state, value){
            state.permissions.push(value)
        }
    },
    actions: {
        insertUserTaskGroup(){
            return new Promise((resolve, reject) => {
                axios.post(tableName, this.state.userTaskGroup)
                .then(() => {
                    resolve(this.state.insertSuccessMessage);
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
                    resolve(this.state.insertSuccessMessage);
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
                    resolve(this.state.insertSuccessMessage);
                })
                .catch(error => {
                    if(error.response.status == 500) reject(this.state.serverErrorMessage)
                })
            })
        },
    }
}

export default userTaskGroup