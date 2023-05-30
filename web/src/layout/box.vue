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
        <el-main>
          <router-view />
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
      border-bottom: 1px solid #E6E6E6;
    }
  }
}
</style>
