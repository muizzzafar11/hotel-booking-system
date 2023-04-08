<!-- Show a list of hotels chains. When 1 selected, go to that particular HotelPage -->
<template>
  <img src="@/assets/home-image.png" class="img-fluid mb-5" alt="Responsive image">
  <RoomFilterComponent></RoomFilterComponent>
</template>

<script>
import RoomFilterComponent from '@/components/RoomFilterComponent.vue'

export default {
    name: 'LandingPage',
    components: {
        RoomFilterComponent
    },
    mounted() {
      localStorage.clear();
    }
}
</script>

<style>

</style>