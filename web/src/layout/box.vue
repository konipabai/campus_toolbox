<template>
  <div class="box">
    <el-container class="box-main">
      <el-aside width="auto">
        <collapse_menu />
      </el-aside>
      <el-container>
        <el-header height="56px" class="box-main-head">
          <page_header />
        </el-header>
        <el-main class="box-main-text">
          <RouterView v-slot="{ Component }">
            <transition name="fade" mode="out-in">
              <component :is="Component"/>
            </transition>
          </RouterView>
          <!-- <Button @click="date()">aaa</Button> -->
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script setup lang="ts">
import collapse_menu from "../components/menu/index.vue";
import page_header from "../components/head/index.vue";
import { get_classroom } from "../server";
const date = async () => {
  const qwe = await get_classroom({ building: "", floor: 0 });
  console.log(qwe, 1);
};
</script>

<style lang="less" scoped>
.box {
  height: var(--element-height-full);

  &-main {
    height: var(--element-height-full);

    &-head {
      padding: 0px !important;
    }

    &-text {
      overflow: hidden;
      background-color: var(--main-bg-color);
    }
  }
}

.fade-enter-from{
  opacity: 0;
  transform: translateX(-100%);
}
 
.fade-enter-to{
  transform: translateX(0%);
  opacity: 1; 
}
 
.fade-leave-active,.fade-enter-active {
    transition: all 0.25s ease-out;
}
 
.fade-leave-from {
  transform: translateX(0%);
  opacity: 1;
}
 
.fade-leave-to{
  transform: translateX(100%);
  opacity: 0;
}
</style>
