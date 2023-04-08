<template>
    <h1 class="my-5">Select filters for the room</h1>

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
        <v-select
        clearable
        v-model="filters.areaFilter"
        label="Area Filter"
        :items=area
        ></v-select>
        </div>

        <div class="form-group mb-3">
        <label class="sr-only" for="exampleInputAmount">Number of Rooms in hotel Filter</label>
        <div class="input-group">
            <input type="number" min="0.00" step="1" v-model="filters.roomNumberFilter" id="exampleInputAmount" class="form-control" placeholder="Room Number Filter">
        </div>
        </div>

        <div class="form-group mb-3">
        <label for="checkinDateFilter">Date Filter</label>
        <vue-date-picker id="checkinDateFilter" v-model="dateRange" range multi-calendars></vue-date-picker>
        </div>

        <div class="form-group mb-3">
        <label class="sr-only" for="exampleInputAmount">Price Filter</label>
        <div class="input-group">
            <div class="input-group-prepend">
            <span class="input-group-text">$</span>
            </div>
            <input type="number" min="0.00" step="100" v-model="filters.priceFilter" id="exampleInputAmount" class="form-control" placeholder="Price Filter">
        </div>
        </div>

        <button class="btn btn-success text-white" v-on:click="sendFilterData">Submit</button>

    </form>
</template>

<script>
import axios from 'axios';
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'
import router from '../router'
export default {
    name: 'RoomFilterComponent',
    components: {
        VueDatePicker
    },
    data() {
        return {
            filters: {
                chainNameFilter: null,
                ratingFiler: null,
                roomCapacityFilter: null,
                viewFilter: null,
                priceFilter: null,
                canExtendFilter: null,
                amenitiesFilter: null,
                checkinDateFilter: null,
                checkoutDateFilter: null,
                areaFilter: null,
                roomNumberFilter: null
            },
            dateRange: [],
            chainNames: [],
            ratingList: [3, 4, 5],
            roomCapacityList: [1, 2, 3, 4, 5],
            Amneties: ['AC', 'TV', 'Mini Bar', 'Sofa', 'Jacuzzi'],
            view: ['City View', 'Pool View'],
            area:['Lowertown', 'Middletown', 'Downtown']
        }
    },
    mounted() {
        this.fetchData()
    },
    methods: {
        fetchData() {
            axios.get('http://0.0.0.0:8000/api/getChainsNameList')
            .then(response => {
                this.chainNames = response.data.map(
                    chain => chain[0]
                );
            })
            .catch(error => {
                console.log(error)
            })
        },
        sendFilterData() {
            // console.log(this.filters)
            if(this.dateRange?.length > 0) {
              const date1 = new Date(this.dateRange[0]);
              const checkinDate = date1.toISOString().split('T')[0];
              const date2 = new Date(this.dateRange[1]);
              const checkoutDate = date2.toISOString().split('T')[0];
              this.filters.checkinDateFilter = checkinDate
              this.filters.checkoutDateFilter = checkoutDate
            }
            axios.get('http://0.0.0.0:8000/api/getRoomList', { params: this.filters })
            .then(response => {
                localStorage.setItem('checkin_date', this.filters.checkinDateFilter);
                localStorage.setItem('checkout_date', this.filters.checkoutDateFilter);
                const jsonString = JSON.stringify(response);
                localStorage.setItem('filtered_data', jsonString);
                router.push({
                    name: 'Hotel',
                })
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