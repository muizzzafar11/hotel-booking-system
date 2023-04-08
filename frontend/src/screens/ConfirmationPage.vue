<template>
  <div class="receipt">
    <div class="header">
      <img src="@/assets/logo.png" alt="Logo" class="logo">
      <h2>Booking Confirmation</h2>
    </div>
    <div class="body">
      <h3>Thank you for your booking!</h3>
      <p>Your booking has been confirmed and the following details have been saved:</p>
      <table>
        <tr>
          <td>Hotel:</td>
          <td>{{ booking.hotelName }}</td>
        </tr>
        <tr>
          <td>Chain:</td>
          <td>{{ booking.chainName }}</td>
        </tr>
        <tr>
          <td>Address:</td>
          <td>{{ booking.address }}</td>
        </tr>
        <tr>
          <td>Price:</td>
          <td>{{ booking.price }}</td>
        </tr>
        <tr>
          <td>Room number:</td>
          <td>{{ booking.room_number }}</td>
        </tr>
        <tr>
          <td>Check-in date:</td>
          <td>{{ booking.checkin }}</td>
        </tr>
        <tr>
          <td>Check-out date:</td>
          <td>{{ booking.checkout }}</td>
        </tr>
      </table>
    </div>
    <div class="footer">
      <p>Please keep this receipt for your records. If you have any questions or concerns, please contact us at the phone number or email address provided.</p>
      <p>Thank you for choosing us and we hope you enjoy your stay!</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ConfirmationPage',
  created() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      const jsonString = localStorage.getItem('selected_room_data');
      const myObject = JSON.parse(jsonString);
      this.booking = {
        hotelName: myObject['hotelName'],
        chainName: myObject['chainName'],
        address: myObject['address'],
        price: myObject['price'],
        room_number: myObject['room_number'],
        checkin: localStorage.getItem('checkin_date'),
        checkout: localStorage.getItem('checkout_date'),
      }
    }
  },
  data() {
    return {
      booking: { }
    }
  },
}
</script>

<style>
.receipt {
  background-color: #fff;
  color: #000;
  width: 80%;
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  font-family: Arial, sans-serif;
  border: 1px solid #ccc;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  height: 50px;
}

h2 {
  font-size: 24px;
  margin: 0;
}

.body {
  margin: 30px 0;
}

h3 {
  font-size: 20px;
  margin: 0;
}

table {
  width: 100%;
  margin-top: 20px;
  border-collapse: collapse;
}

tr {
  border-bottom: 1px solid #ccc;
}

td {
  padding: 10px;
  text-align: left;
  font-size: 16px;
}

td:first-child {
  font-weight: bold;
}

.footer {
  border-top: 1px solid #ccc;
  margin-top: 30px;
  font-size: 16px;
  line-height: 1.5;
}
</style>
