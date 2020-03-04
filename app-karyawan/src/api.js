import axios from 'axios'

const taskTable = 'task'
const groupTaskTable = 'group_task'
const userTable = 'user'
const userTaskTable = 'user_task'
const userTaskGroupTable = 'user_task_group'
const productTable = 'product'
const categoryTable = 'category'
const unitTable = 'unit'
const insertSuccessMessage = 'Berhasil ditambahkan'
// const updateSuccessMessage = 'Berhasil ditambahkan'
// const deleteSuccessMessage = 'Berhasil ditambahkan'
const serverErrorMessage = 'Terjadi kesalahan pada server'

const api = {
    
    /* ================================================================================================================================================= */
    /* USER */
    /* ================================================================================================================================================= */

    //TASK
    getAllTask(){
        return new Promise((resolve, reject) => {
            axios.get(taskTable)
            .then(response => {
                resolve(response.data);
            })
            .catch(error => {
                if(error.response.status == 500) reject(serverErrorMessage)
            })
        })
    },

    //GROUP TASK
    insertGroupTask(){
        return new Promise((resolve, reject) => {
            let data = {
                userTaskGroupId: this.state.userTaskGroup.id,
                taskId: this.state.userTaskGroup.taskId
            }

            axios.post(groupTaskTable, data).then(() => {
                resolve(this.state.insertSuccessMessage)
            }).catch(error => {
                if(error.response.status == 500) reject(serverErrorMessage)
            })
        })
    },

    getGroupTaskByUserTaskGroupId(userTaskGroupId){
        return new Promise((resolve, reject) => {
            axios.get(groupTaskTable, {params: {userTaskGroupId: userTaskGroupId}})
            .then(response => {
                resolve(response.data);
            })
            .catch(error => {
                if(error.response.status == 500) reject(serverErrorMessage)
            })
        })
    },
    updateGroupTask(){
        return new Promise((resolve, reject) => {
            let data = {
                userTaskGroupId: this.state.userTaskGroup.id,
                taskId: this.state.userTaskGroup.taskId
            }

            axios.put(groupTaskTable, data).then(() => {
                resolve(this.state.insertSuccessMessage)
            }).catch(error => {
                if(error.response.status == 500) reject(serverErrorMessage)
            })
        })
    },

    //USER
    getAllUser(){
        return new Promise((resolve, reject) => {
            axios.get(userTable).then(response => {
                resolve(response.data)
            })
            .catch(error => {
                if(error.response.status == 500) reject(serverErrorMessage)
            })
        })
    },

    //USER TASK
    getUserTaskById(id){
        return new Promise((reslove, reject) => {
            axios.get(userTaskTable, {params: {id: id}}).then(response => {
                reslove(response.data)
            }).catch(error => {
                reject(error)
            })
        })
    },

    //USER TASK GROUP
    getAllUserTaskGroup(){
        return new Promise((resolve, reject) => {
            axios.get(userTaskGroupTable)
            .then(response => {
                resolve(response.data);
            })
            .catch(error => {
                if(error.response.status == 500) reject(serverErrorMessage)
            })
        })
    },

    /* ================================================================================================================================================= */
    /* ================================================================================================================================================= */

    /* ================================================================================================================================================= */
    /* Product */
    /* ================================================================================================================================================= */

    // PRODUCT
    getAllProducts() {
        return new Promise( (resolve, reject) => {
            axios.get(productTable)
                .then(response => {
                    resolve(response.data)
                }) .catch(error => {
                    if(error.response.status == 500) reject(serverErrorMessage)
                })
        } )
    },
    addProduct(product) {
        return new Promise( (resolve, reject) => {
            axios.post(productTable,product)
                .then(() => {
                    resolve(insertSuccessMessage)
                }) .catch(error => {
                    if(error.response.status == 500) reject(serverErrorMessage)
                })
        } )
    },

    // CATEGORY
    getAllCategory() {
        return new Promise( (resolve, reject) => {
            axios.get(categoryTable)
                .then(response => {
                    resolve(response.data)
                }) .catch(error => {
                    if(error.response.status == 500) reject(serverErrorMessage)
                })
        } )
    },
    addCategory(name) {
        return new Promise( (resolve, reject) => {
            axios.post(categoryTable, {name:name})
                .then(() => {
                    resolve(insertSuccessMessage)
                }) .catch(error => {
                    if(error.response.status == 500) reject(serverErrorMessage)
                })
        } )
    },

    // UNIT
    getAllUnit() {
        return new Promise( (resolve, reject) => {
            axios.get(unitTable)
                .then(response => {
                    resolve(response.data)
                }) .catch(error => {
                    if(error.respose.status == 500) reject(serverErrorMessage)
                })
        } )
    },
    addUnit(unit) {
        return new Promise( (resolve, reject) => {
            axios.post(unitTable, unit)
                .then(() => {
                    resolve(insertSuccessMessage)
                }) .catch(error => {
                    if(error.response.status == 500) reject(serverErrorMessage)
                })
        } )
    }

    /* ================================================================================================================================================= */
    /* ================================================================================================================================================= */
    
}

export default api