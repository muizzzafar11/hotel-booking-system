<!-- First show categorie dropdown -->
<!-- Then when selected the categorie, show the hotel based off of the categorie -->
<!-- When hotel selected, go to the RoomBooking Page -->
<template>
  <!-- <div>Hotel page</div> -->
  <template>
  <!-- <div>Landing page</div> -->
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 justify-content-center">
      <div v-for="chain in chainArr" :key="chain.chainName">
          <card-component :title="chain.chainName" :body=chain.details apiLink="getHotelList" routeLink="book"></card-component>
      </div>
    </div>
  </template>
</template>

<script>
import CardComponent from '@/components/CardComponent.vue'
import {Chain} from '@/models/ChainModel'
import axios from 'axios';
export default {
    name: 'HotelPage',
    components: {
        CardComponent
    },
    data() {
        return {
            chainArr: []
        }
    },
    created() {
      console.log('params', this.$route.params)
    },
    mounted() {
        this.fetchChainData()
    },
    methods: {
        fetchChainData() {
            axios.get('http://0.0.0.0:8000/api/getChainsList')
            .then(response => {
                // this.chainArr = response.data
                this.chainArr = response.data.map(
                    chain => new Chain(
                        chain[1], chain[2], chain[3], chain[4], chain[5]
                    )
                );
                console.log(response.data)
                console.log(this.chainArr)
            })
            .catch(error => {
                console.log(error)
            })
        }
    },
}
</script>

<style>

</style>