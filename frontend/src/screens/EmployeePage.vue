<template>

<form class="mb-4">
    <div class="form-group">
        <label for="ssnCustomer">Enter Employee ID (ssn_employee)</label>
        <input type="text" class="form-control" id="ssnCustomer" v-model="ssn_employee">
    </div>
    <button class="btn btn-success mt-3" @click="submitEmployeeId">Submit</button>
</form>
    
<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        View Booked Rooms
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <div>
          <h1 class="mt-4 mb-4">View Booked Rooms</h1>

          <div class="row justify-content-center">
            <div class="col-md-11">
              <form class="mb-4" @submit.prevent="getBookingData">
                <div class="form-group">
                  <label for="ssnCustomer">Enter SSN</label>
                  <input type="text" class="form-control" id="ssnCustomer" v-model="ssn_customer">
                </div>
                <button type="submit" class="btn btn-success mt-3 text-white">Submit</button>
              </form>
            </div>
          </div>

          <div v-if="bookings.length" class="row justify-content-center">
            <div class="col">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th class="text-center">Hotel Name</th>
                    <th class="text-center">Address</th>
                    <th class="text-center">Email</th>
                    <th class="text-center">Phone</th>
                    <th class="text-center">Room #</th>
                    <th class="text-center">Price</th>
                    <th class="text-center">Amenities</th>
                    <th class="text-center">Capacity</th>
                    <th class="text-center">View</th>
                    <th class="text-center">Chain Name</th>
                    <th class="text-center">Rating</th>
                    <th class="text-center">Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="room in bookings" :key="room.room_number">
                    <td class="text-center">{{ room[0] }}</td>
                    <td class="text-center">{{ room[1] }}</td>
                    <td class="text-center">{{ room[2] }}</td>
                    <td class="text-center">{{ room[3] }}</td>
                    <td class="text-center">{{ room[4] }}</td>
                    <td class="text-center">{{ room[5] }}</td>
                    <td class="text-center">{{ room[6] }}</td>
                    <td class="text-center">{{ room[7] }}</td>
                    <td class="text-center">{{ room[8] }}</td>
                    <td class="text-center">{{ room[9] }}</td>
                    <td class="text-center">{{ room[10] }}</td>
                    <td class="text-center">
                      <button class="btn btn-success" @click="changeBookingType(room[11])">
                        <p class="mb-0">Book -> Rent</p>
                      </button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <p v-else>No bookings found for this customer.</p>
      </div>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Assign Room to Renting Table
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <RoomFilterComponent></RoomFilterComponent>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import axios from 'axios'
import RoomFilterComponent from '@/components/RoomFilterComponent.vue'

export default {
    name: "EmployeePage",
    components: {
        RoomFilterComponent
    },
    mounted() {
        localStorage.clear();
    },
    data() {
        return {
            ssn_customer: '',
            bookings: {},
            roomNumber: null,
            ssn_customer_rent: null,
            dateRange: [],
            ssn_employee: null,
        }
    },
    methods: {
        submitEmployeeId() {
            localStorage.setItem('ssn_employee', this.ssn_employee)
        },
        getBookingData() {
            if(this.ssn_employee == null) {
                alert("Please Enter ssn_employee");
            } else {
                axios.get(`http://0.0.0.0:8000/api/bookingRooms/${this.ssn_customer}`)
                .then(response => {
                    this.bookings = response.data
                })
                .catch(error => {
                console.log(error)
                })
            }
        },
        changeBookingType(booking_id) {
            if(this.ssn_employee == null) {
                alert("Please Enter ssn_employee");
            } else {
                axios.post(`http://0.0.0.0:8000/api/changeBookingType/${booking_id}`)
                .then(response => {
                   alert('updated booking to renting', response)
                })
                .catch(error => {
                    console.log(error)
                })
            }
        }
    },
}
</script>

<style>
/* Add some styling to make the table look pretty */
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

th {
  background-color: #ddd;
  font-weight: bold;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
</style>