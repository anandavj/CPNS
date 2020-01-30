<template>
    <v-app>
        <v-card :elevation="1" min-height="112" class="text-center py-4 mb-5">
            <v-btn class="mx-2 my-2" fab dark large color="light-blue" v-for="shortcut in shortcuts" :key="shortcut.name">
                <v-icon dark>{{shortcut.icon}}</v-icon>
            </v-btn>
        </v-card>
        <v-card flat color="white" min-height="200" class="pb-4 mb-5">
            <v-card-title><v-badge color="red" dot offset-x="-3">Announcement</v-badge></v-card-title>
            <div class="px-3">
                <v-card :elevation="2" class="mb-5" v-for="announcement in announcements" :key="announcement.title">
                    <v-card-title>{{announcement.title}}</v-card-title>
                    <v-card-text class="pb-0">{{announcement.desc}}</v-card-text>
                    <v-card-actions><v-btn text color="light-blue">Selengkapnya</v-btn></v-card-actions>
                </v-card>
            </div>
        </v-card>
    </v-app>
</template>

<script>
export default {
    name: 'Dashboard',

    data() {
        return {
            announcements: [
                {title: 'Announcement 1', desc: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A, alias!'},
                {title: 'Announcement 2', desc: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A, alias!'},
                {title: 'Announcement 3', desc: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A, alias!'}
            ],
            shortcuts: [
                {name: 'pricelist', icon: 'mdi-currency-usd'},
                {name: 'chart', icon: 'mdi-chart-line'},
                {name: 'account', icon: 'mdi-account'},
                {name: 'contact', icon: 'mdi-contact-phone'}
            ]
        }
    }
    
}
</script>