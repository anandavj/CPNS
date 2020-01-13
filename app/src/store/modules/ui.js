
const UI = {
    state: {
        showNavbar: false
    },
    mutations: {
        SET_SHOWNAVBAR(state){
            
            state.showNavbar = !state.showNavbar
            console.log(`navbar changed, status: ${state.showNavbar}`);
        },
    },
    actions: {
    },
    modules: {
    }
}
export default UI;