import axios from 'axios'

const taskTable = 'task'
const groupTaskTable = 'group_task'
const userTable = 'user'
const userTaskTable = 'user_task'
const userTaskGroupTable = 'user_task_group'
const productTable = 'product'
const categoryTable = 'category'
const unitTable = 'unit'
const tagTable = 'tag'
const insertSuccessMessage = 'Berhasil ditambahkan'
const updateSuccessMessage = 'Berhasil diperbarui'
const deleteSuccessMessage = 'Berhasil dihapus'
const insertFailedMessage = 'Gagal ditambahkan'
const serverErrorMessage = 'Terjadi kesalahan pada server'
const existErrorMessage = 'Sudah terdaftar'

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
    insertGroupTask(userTaskGroup){
        return new Promise((resolve, reject) => {
            let data = {
                userTaskGroupId: userTaskGroup.id,
                taskId: userTaskGroup.taskId
            }

            axios.post(groupTaskTable, data).then(() => {
                resolve(insertSuccessMessage)
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
    updateGroupTask(userTaskGroup){
        return new Promise((resolve, reject) => {
            let data = {
                userTaskGroupId: userTaskGroup.id,
                taskId: userTaskGroup.taskId
            }

            axios.put(groupTaskTable, data).then(() => {
                resolve(updateSuccessMessage)
            }).catch(error => {
                if(error.response.status == 500) reject(serverErrorMessage)
            })
        })
    },

    //USER
    insertUser(karyawan){
        return new Promise((resolve, reject) => {
            axios.post(userTable, karyawan)                
            .then(() => {
                resolve(insertSuccessMessage)
            })
            .catch(error => {
                if(error.response.status == 500) reject(serverErrorMessage)
                else reject(insertFailedMessage)
            })
        })
    },
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
    updateUser(karyawan){
        return new Promise((resolve, reject) => {
            axios.put(userTable, karyawan).then(() => {
                resolve(updateSuccessMessage)
            }).catch(error => {
                if(error.response.status == 500) reject(serverErrorMessage)
                else reject(insertFailedMessage)
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
    insertUserTaskGroup(userTaskGroup){
        return new Promise((resolve, reject) => {
            axios.post(userTaskGroupTable, userTaskGroup)
            .then(response => {
                userTaskGroup.id = response.data.id
                resolve(insertSuccessMessage)
            })
            .catch(error => {
                if(error.response.status == 500) reject(serverErrorMessage)
            })
        })
    },
    updateUserTaskGroup(userTaskGroup){
        return new Promise((resolve, reject) => {
            axios.put(userTaskGroupTable, userTaskGroup)
            .then(() => {
                resolve(updateSuccessMessage);
            })
            .catch(error => {
                if(error.response.status == 500) reject(serverErrorMessage)
            })
        })
    },
    deleteUserTaskGroup(userTaskGroup){
        return new Promise((resolve, reject) => {
            axios.delete(userTaskGroupTable, {params: {id: userTaskGroup.id}})
            .then(() => {
                resolve(deleteSuccessMessage);
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
    updateProductOpenPrice(product) {
        return new Promise( (resolve, reject) => {
            let data = {
                id: product.id,
                openPrice: product.openPrice
            }

            axios.put(productTable, data)
                .then(() => {
                    resolve(updateSuccessMessage)
                }) .catch(error => {
                    if(error.response.status == 500) reject(serverErrorMessage)
                })
        } )
    },
    updateProduct(product) {
        return new Promise( (resolve, reject) => {
            axios.put(productTable, product)
                .then(() => {
                    resolve(updateSuccessMessage)
                }) .catch(error => {
                    if(error.response.status == 500) reject(serverErrorMessage)
                })
        } )
    },
    deleteProduct(product) {
        return new Promise( (resolve, reject) => {
            axios.delete(productTable, {params: {id: product.id}})
                .then(() => {
                    resolve(deleteSuccessMessage);
                })
                .catch(error => {
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
                    if(error.response.status == 500) reject(serverErrorMessage)
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
    },

    // TAG
    getAllTag() {
        return new Promise( (resolve, reject) => {
            axios.get(tagTable)
                .then(response => {
                    resolve(response.data)
                }) .catch(error => {
                    if(error.response.status == 500) reject(serverErrorMessage)
                })
        } )
    },
    addTag(tag) {
        return new Promise( (resolve, reject) => {
            axios.post(tagTable, {tagName:tag})
                .then(() => {
                    resolve(insertSuccessMessage)
                }) .catch(error => {
                    if(error.response.status == 500) {
                        reject(serverErrorMessage)
                    } else {
                        if(error.response.status == 400) {
                            reject(existErrorMessage)
                        }
                    }
                })
        } )
    }

    /* ================================================================================================================================================= */
    /* ================================================================================================================================================= */
    
}

export default api