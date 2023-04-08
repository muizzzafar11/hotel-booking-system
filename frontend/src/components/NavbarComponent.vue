<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="d-flex flex-start align-items-center">
      <router-link to="/" class="navbar-brand">
        <font-awesome-icon :icon="['fas', 'home']" />
      </router-link>
      <div class="d-flex flex-start align-items-center">
        <router-link to="/" class="nav-link mx-4">Customer</router-link>
        <router-link to="/employee" class="nav-link">Employee</router-link>
      </div>
    </div>
  </nav>
</template>
  
  <script>
  export default {
    name: 'NavigationBar'
  }
  </script>
  