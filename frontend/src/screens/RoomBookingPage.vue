<!-- Customer choses the room and the bookign type he wants with entering his details etc etc -->
<!-- After selecting the room, go to the confirmation screen -->
<template>
    <!-- <div>Room Booking page</div> -->
    <div v-if="show_booking_date" class="form-group mb-3">
        <label for="checkinDateFilter">Date Filter</label>
        <vue-date-picker id="checkinDateFilter" v-model="dateRange" range multi-calendars></vue-date-picker>
    </div>
    <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-header bg-lightgreen">
            <img src="@/assets/user-logo.png" alt="User Logo" class="user-logo fluid-image">
            <h3 class="card-title text-white"><i class="fas fa-user-circle"></i> Personal Information</h3>
          </div>
          <div class="card-body">
            <form>
              <div class="form-group mb-3">
                <label for="ssn_customer"><i class="fas fa-id-card"></i> SSN</label>
                <input type="text" class="form-control" id="ssn_customer" v-model="ssn_customer">
              </div>
              <div class="form-group mb-3">
                <label for="first_name"><i class="fas fa-user"></i> First Name</label>
                <input type="text" class="form-control" id="first_name" v-model="first_name">
              </div>
              <div class="form-group mb-3">
                <label for="last_name"><i class="fas fa-user"></i> Last Name</label>
                <input type="text" class="form-control" id="last_name" v-model="last_name">
              </div>
              <button type="submit" class="btn btn-primary bg-green mb-3" @click.prevent="submitForm()"><i class="fas fa-check"></i> Submit</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import router from '../router'
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'

export default {
    name: 'RoomBookingPage',
    components: {
        VueDatePicker
    },
    data() {
        return {
            dataArr: {},
            ssn_customer: '',
            first_name: '',
            last_name: '',
            checkin_date: null,
            checkout_date: null,
            show_booking_date: false,
            dateRange: [],
            postReqData: {}
        }
    },
    created() {
        this.fetchData()
    },
    methods: {
        fetchData() {
            const jsonString = localStorage.getItem('selected_room_data');
            const myObject = JSON.parse(jsonString);
            this.dataArr = myObject
            // console.log('Data Arr room number',this.dataArr['room_number'])
            this.checkin_date = localStorage.getItem('checkin_date');
            this.checkout_date = localStorage.getItem('checkout_date');
            this.show_booking_date = this.checkin_date != null && this.checkout_date != null
            console.log(this.checkin_date)
        },
        submitForm() {
            if(this.dateRange?.length > 0) {
              const date1 = new Date(this.dateRange[0]);
              const checkinDate = date1.toISOString().split('T')[0];
              const date2 = new Date(this.dateRange[1]);
              const checkoutDate = date2.toISOString().split('T')[0];
              this.checkin_date = checkinDate
              this.checkout_date = checkoutDate
            }
            const ssn_employee = localStorage.getItem('ssn_employee');
            console.log(ssn_employee)
            if(ssn_employee != null) {
              this.postReqData = {
                ssn_customer: this.ssn_customer,
                first_name: this.first_name,
                last_name: this.last_name,
                room_number: this.dataArr['room_number'],
                checkin_date: this.checkin_date,
                checkout_date: this.checkout_date,
                ssn_employee: ssn_employee
              }
              axios.post('http://0.0.0.0:8000/api/rent', this.postReqData)
              .then(response => {
                  localStorage.setItem('checkin_date', this.checkin_date);
                  localStorage.setItem('checkout_date', this.checkout_date);
                  const jsonString = JSON.stringify(response.data);
                  localStorage.setItem('confirmation', jsonString);
                  router.push({
                      name: 'Confirmation',
                  })
              })
              .catch(error => {
                  console.log(error);
              });
            } else {
              this.postReqData = {
                ssn_customer: this.ssn_customer,
                first_name: this.first_name,
                last_name: this.last_name,
                room_number: this.dataArr['room_number'],
                checkin_date: this.checkin_date,
                checkout_date: this.checkout_date,
              }
              axios.post('http://0.0.0.0:8000/api/book', this.postReqData)
              .then(response => {
                  localStorage.setItem('checkin_date', this.checkin_date);
                  localStorage.setItem('checkout_date', this.checkout_date);
                  const jsonString = JSON.stringify(response.data);
                  localStorage.setItem('confirmation', jsonString);
                  router.push({
                      name: 'Confirmation',
                  })
              })
              .catch(error => {
                  console.log(error);
              }); 
            }
        }
    },
}
</script>

<style>
.card {
  border: 2px solid #126a3f;
  border-radius: 5px;
  margin-top: 30px;
}
.card-header {
  background-color: #56c066;
  border-bottom: 1px solid #56c066;
  padding: 10px;
}
.card-title {
  margin-bottom: 0;
}
.form-group label {
  font-weight: bold;
  color: #146e19;
}
.btn-primary {
  background-color: #00cec9;
  border-color: #00cec9;
}
.btn-primary:hover {
  background-color: #00b894;
  border-color: #00b894;
}
.bg-lightgreen {
  background-color: #2d813f;
}
.bg-green {
  background-color: #00b894;
  border-color: #00b894;
}
.text-white {
  color: #fff;
}

.user-logo {
  width: 100px;
  height: 100px;
}

</style>