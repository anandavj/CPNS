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
        
    }
}

export default userTaskGroup