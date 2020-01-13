<template>
    <v-app>
        <v-card :elevation="1" min-height="112" class="text-center py-4 mb-5">
            <v-btn class="mx-2 my-2" fab dark large color="light-blue">
                <v-icon dark>mdi-currency-usd</v-icon>
            </v-btn>
            <v-btn class="mx-2 my-2" fab dark large color="light-blue">
                <v-icon dark>mdi-chart-line</v-icon>
            </v-btn>
            <v-btn class="mx-2 my-2" fab dark large color="light-blue">
                <v-icon dark>mdi-account</v-icon>
            </v-btn>
            <v-btn class="mx-2 my-2" fab dark large color="light-blue">
                <v-icon dark>mdi-contact-phone</v-icon>
            </v-btn>
        </v-card>
        <v-card flat color="white" min-height="200" class="pb-4 mb-5">
            <v-card-title><v-badge color="red" dot offset-x="-3">Announcement</v-badge></v-card-title>
            <div class="px-3">
                <v-card :elevation="2" class="mb-5">
                    <v-card-title>
                        Announcement 1
                    </v-card-title>
                    <v-card-text class="pb-0">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. A, alias!
                    </v-card-text>
                    <v-card-actions>
                        <v-btn text color="light-blue">
                            Selengkapnya
                        </v-btn>
                    </v-card-actions>
                </v-card>
                <v-card :elevation="2" class="mb-5">
                    <v-card-title>
                        Announcement 2
                    </v-card-title>
                    <v-card-text class="pb-0">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. A, alias!
                    </v-card-text>
                    <v-card-actions>
                        <v-btn text color="light-blue">
                            Selengkapnya
                        </v-btn>
                    </v-card-actions>
                </v-card>
            </div>
        </v-card>
    </v-app>
</template>

<script>
export default {
    
}
</script>