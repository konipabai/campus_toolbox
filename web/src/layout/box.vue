<template>
  <div class="box">
    <el-container class="box-main">
      <el-aside width="auto">
        <collapseMenu />
      </el-aside>
      <el-container>
        <el-header height="56px" class="box-main-head">
          <pageHeader />
        </el-header>
        <el-main class="box-main-text">
          <RouterView v-slot="{ Component }">
            <transition name="fade" mode="out-in">
              <component :is="Component" />
            </transition>
          </RouterView>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script setup lang="ts">
import collapseMenu from "../components/menu/index.vue";
import pageHeader from "../components/head/index.vue";
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

.fade-enter-from {
  opacity: 0;
  transform: translateX(-100%);
}

.fade-enter-to {
  transform: translateX(0%);
  opacity: 1;
}

.fade-leave-active,
.fade-enter-active {
  transition: all 0.25s ease-out;
}

.fade-leave-from {
  transform: translateX(0%);
  opacity: 1;
}

.fade-leave-to {
  transform: translateX(100%);
  opacity: 0;
}
</style>
