<template>
    <div class="head-box">
      <span class="head-box-span-0">
        <el-icon v-if="menuControl.isCollapse" size="28" color="var(--button-color)" class="head-box-span-0-icon"
          @click="menuChang()">
          <Expand />
        </el-icon>
        <el-icon v-else size="28" color="var(--button-color)" class="head-box-span-0-icon" @click="menuChang()">
          <Fold />
        </el-icon>
      </span>
    </div>
  </template>
  
  <script setup lang="ts">
  import { Fold, Expand } from "@element-plus/icons-vue";
  import { menuControlStore } from "../../store/menuControlStore";
  
  const menuControl = menuControlStore();
  const menuChang = () => {
    menuControl.changeState();
  };
  </script>
  
  <style lang="less" scoped>
  .head-box {
    height: var(--element-height-full);
  
    &-span-0 {
      height: var(--element-height-full);
  
      &-icon {
        height: var(--element-height-full);
        padding: 0px 8px;
  
        &:hover {
          background-color: var(--button-hover-color);
        }
      }
    }
  }
  </style>
  