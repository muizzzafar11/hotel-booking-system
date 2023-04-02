<!-- Show a list of hotels chains. When 1 selected, go to that particular HotelPage -->
<template>
  <form>
  <div class="form-group mb-3">
    <v-select
    clearable
    v-model="filters.chainNameFilter"
    label="Chain Name Filter"
    :items=chainNames
  ></v-select>
  </div>
  <div class="form-group mb-3">
    <v-select
    clearable
    v-model="filters.ratingFiler"
    label="Rating Filter"
    :items=ratingList
  ></v-select>
  </div>
  <div class="form-group mb-3">
    <v-select
    clearable
    v-model="filters.roomCapacityFilter"
    label="Room Capacity Filter"
    :items=roomCapacityList
  ></v-select>
  </div>
  <div class="form-group mb-3">
    <label for="checkinDateFilter">Checkin Date Filter</label>
    <vue-date-picker id="checkinDateFilter" v-model="filters.checkinDateFilter" range multi-calendars></vue-date-picker>
  </div>
  <div class="form-group mb-3">
    <input class="form-check-input" type="radio" name="canExtendFilter" id="item1" value="item1" v-model="filters.canExtendFilter">
    <label class="form-check-label ml-3" for="item1">Can Extend Stay</label>
  </div>
  <button type="submit" class="btn btn-primary" v-on:click="sendFilterData">Submit</button>
</form>


</template>

<script>
import axios from 'axios';
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'
// import router from '../router'

export default {
    name: 'LandingPage',
    components: {
        VueDatePicker
    },
    data() {
        return {
            filters: {
                chainNameFilter: null,
                ratingFiler: null,
                roomCapacityFilter: null,
                checkinDateFilter: null,
                viewFilter: null,
                priceFilter: null,
                canExtendFilter: null,
                amenitiesFilter: null
            },
            chainNames: [],
            ratingList: [3, 4, 5],
            roomCapacityList: [1, 2, 3, 4, 5],
            view: null
        }
    },
    mounted() {
        this.fetchData()
    },
    methods: {
        fetchData() {
            axios.get('http://0.0.0.0:8000/api/getChainsNameList')
            .then(response => {
                // this.chainNames = response.data
                this.chainNames = response.data.map(
                    chain => chain[0]
                );
                console.log(this.chainNames)
                // console.log(this.chainArr)
            })
            .catch(error => {
                console.log(error)
            })
        },
        sendFilterData() {
            axios.get('http://0.0.0.0:8000/api/getRoomList', { params: this.filters })
            .then(response => {
                console.log({response})
                // router.push({
                //     name: 'Hotel',
                //     params: response
                // })
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