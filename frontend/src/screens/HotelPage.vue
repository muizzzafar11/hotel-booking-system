<!-- First show categorie dropdown -->
<!-- Then when selected the categorie, show the hotel based off of the categorie -->
<!-- When hotel selected, go to the RoomBooking Page -->
<template>
  <div>Hotel page</div>
  <!-- <div>Landing page</div> -->
  <!-- <p>{{ dataArr[0][0] }}</p> -->
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 justify-content-center">
      <div v-for="room in dataArr" class="" :key="room[4]">
          <card-component 
            :hotelName="room[0]" 
            :chainName="room[9]"
            :address="room[1]"
            :email="room[2]"
            :phone="room[3]"
            :price="room[5]"
            :amenities="room[6]"
            :view="room[8]"
            :room_number="room[4]"
            :rating="room[10]"
            apiLink="getHotelList" 
            routeLink="book"
          >
          </card-component>
      </div>
    </div>
</template>

<script>
import CardComponent from '@/components/CardComponent.vue'
// import {Chain} from '@/models/ChainModel'
// import axios from 'axios';
export default {
    name: 'HotelPage',
    components: {
        CardComponent
    },
    data() {
        return {
            chainArr: [],
            dataArr: []
        }
    },
    created() {
        this.fetchData()
    },
    methods: {
        fetchData() {
            const jsonString = localStorage.getItem('filtered_data');
            const myObject = JSON.parse(jsonString);
            this.dataArr = myObject.data
            // console.log(this.dataArr)
        }
    },
}
</script>

<style>

</style>