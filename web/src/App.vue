<template>
  <component :is="currentComponent"></component>
</template>

<script setup lang='ts'>
import { ref, watch, markRaw } from "vue";
import { useRoute } from "vue-router";
import box from "./layout/box.vue";
import login from "./components/contents/login/index.vue";
import { accountStore } from "./store/accountStore";
import axios from 'axios'

const currentComponent: any = ref(null);
const route = useRoute();
accountStore().resetState();
axios.defaults.headers.common['token'] = JSON.parse(localStorage.getItem('token') || '{}')

const updateCurrentComponent = () => {
  if (route.path === "/") {
    currentComponent.value = markRaw(login);
  } else {
    currentComponent.value = markRaw(box);
  }
}

updateCurrentComponent;

watch(route, updateCurrentComponent);
</script>

<style lang="less">
html,
body,
#app {
  height: var(--element-height-full);
  width: var(--element-width-full);
}
</style>