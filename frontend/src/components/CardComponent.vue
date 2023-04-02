<template>
  <div class="mb-4">
    <div class="card bg-dark h-100">
      <div class="card-header text-center py-5 mx-0">
        <h5 class="mb-0">{{title}}</h5>
        <!-- <h6 class="mb-0">{{subtitle}}</h6> -->
      </div>
      <div class="card-body">
        <div class="card-body">
          <!-- <ul v-for="item in body" :key="item">
            <li style="color: #e3e3e3">{{item}}</li>
          </ul> -->
          <p style="color: #e3e3e3">Number of hotels: {{body[0]}}</p>
          <p style="color: #e3e3e3">Email: {{body[1]}}</p>
          <p style="color: #e3e3e3">Phone Number: {{body[2]}}</p>
          
        </div>
      </div>
      <div class="card-footer text-center">
        <button class="btn btn-secondary" @click="select()">select</button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'CardComponent',
  props: {
    title: String,
    body: [],
    apiLink: {
      type: String,
      default: "",
    },
    routeLink: String
  },
  methods: {
    select() {
      // Should send a request to the backend end point based off of which selected is clicked
      // one for hotel, the other one for room booking and then change the url to send the user
      // to that particular page
      
      axios.get('http://0.0.0.0:8000/api/'+this.apiLink)
        .then(response => {
          // Send an axios request with the data
          console.log(response)
        })
        .catch(error => {
          console.log(error)
        });
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
