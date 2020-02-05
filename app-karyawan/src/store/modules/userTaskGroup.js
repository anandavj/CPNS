import axios from 'axios';

const table_name = "user_task_group";

const userTaskGroup = {
    state:{
        id: null,
        name: null
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
        }
    },
    actions: {
        insertUserTaskGroup(){
            return new Promise((resolve, reject) => {
                axios.post(table_name, this.state.userTaskGroup)
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
                axios.get(table_name)
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
                axios.put(table_name, this.state.userTaskGroup)
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
                axios.delete(table_name, {params: {id: this.state.userTaskGroup.id}})
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