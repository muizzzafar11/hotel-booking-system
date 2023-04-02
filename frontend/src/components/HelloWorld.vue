<template>
  <div class="container">
    <h1>Contact Form</h1>
    <form @submit.prevent="submitForm">
      <div class="form-group">
        <label for="firstName">Name</label>
        <input type="text" class="form-control" id="firstName" v-model="firstName" required>
      </div>
      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" class="form-control" id="email" v-model="email" required>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
</template>
<script>
import axios from 'axios';
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  data() {
    return {
      firstName: '',
      email: '',
    };
  },
  methods: {
    submitForm() {
      console.log("booking called")
      axios.post('http://0.0.0.0:8000/api/bookings', {
        firstName: this.firstName,
        lastName: "World",
        phoneNum: "000-000-0000",
        email: this.email
      }).then(response => {
          console.log(response);
        })
        .catch(error => {
          console.error(error);
        });
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
