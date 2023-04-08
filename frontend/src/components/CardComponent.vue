<template>
  <div class="mb-4">
    <div class="card bg-dark h-100">
      <div class="card-header text-center py-5 mx-0">
        <h5 class="mb-0">Hotel Name: {{hotelName}}</h5>
        <h6 class="mb-0">Chain Name: {{chainName}}</h6>
        <p style="color: #e3e3e3">Address:{{ address }} </p>
        <p style="color: #e3e3e3">Email: {{ email }}</p>
        <p style="color: #e3e3e3">Phone Number: {{ phone }}</p>
      </div>
      <div class="card-body">
        <div class="card-body">
          <p style="color: #e3e3e3">Price: {{ price }}</p>
          <p style="color: #e3e3e3">Amenities: {{ amenities }}</p>
          <p style="color: #e3e3e3">View: {{ view }}</p>
          <p style="color: #e3e3e3">Room Number: {{ room_number }}</p>
          <p style="color: #e3e3e3">Rating: {{ rating }}</p>
        </div>
      </div>
      <div class="card-footer text-center">
        <button class="btn btn-secondary" @click="select()">select</button>
      </div>
    </div>
  </div>
</template>

<script>
import router from '../router'
export default {
  name: 'CardComponent',
  props: {
    hotelName: String,
    chainName: String,
    address: String,
    email: String,
    phone: String,
    price: Number,
    amenities: String,
    view: String,
    room_number: Number,
    rating: Number,
    apiLink: {
      type: String,
      default: "",
    },
    routeLink: String
  },
  methods: {
    select() {
      const data = {
        hotelName: this.hotelName,
        chainName: this.chainName,
        address: this.address,
        email: this.email,
        phone: this.phone,
        price: this.price,
        amenities: this.amenities,
        view: this.view,
        room_number: this.room_number,
        rating: this.rating,
        routeLink: this.routeLink
      };
      const jsonString = JSON.stringify(data);
      localStorage.setItem('selected_room_data', jsonString);
      router.push({
        name: 'Book-Room',
      })
    }
  }, watch: {
    buttonBool(newVal) {
      this.selected = newVal;
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  h5, h6 {
    color: #ffffff;
  }
</style>
