<template>
  <div class="box">
    <el-container class="box-main">
      <el-aside width="auto">
        <collapse_menu />
      </el-aside>
      <el-container>
        <el-header height="50px">Header</el-header>
        <el-main>
          Main
          <!-- <Button @click="date()">aaa</Button> -->
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script setup lang="ts">
import collapse_menu from "../components/menu/index.vue";
import { get_classroom } from "../server";
const date = async () => {
  const qwe = await get_classroom({ building: "", floor: 0 });
  console.log(qwe, 1);
};
</script>

<style scoped lang="less">
.box {
  height: var(--element-height-full);
  &-main {
    height: var(--element-height-full);
  }
}
</style>
