<template>
  <div class="mx-3 my-2">
    <NavigationBar class="mb-3"/>
    <router-view />
  </div>
</template>

<script>
import NavigationBar from './components/NavbarComponent.vue';
// import router from './router';
export default {
  name: 'App',
  components: {
    NavigationBar,
    // router
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 0px;
}
</style>
