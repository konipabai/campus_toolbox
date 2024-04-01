<template>
  <el-scrollbar>
    <el-menu :default-active="activeIndex" class="el-menu-vertical" background-color="var(--bg-color)"
      :unique-opened="true" :collapse="menuControl.isCollapse">
      <el-menu-item index="0" class="el-menu-vertical-0">
        <img src="../../assets/icon/logo.svg" class="el-menu-vertical-0-icon" />
        <template #title>
          <span class="el-menu-vertical-0-title">校园百宝箱</span>
        </template>
      </el-menu-item>

      <el-sub-menu index="1" v-if="roleData == 'true'">
        <template #title>
          <img src="../../assets/icon/approval.svg" class="el-menu-vertical-all-icon" />
          <span>管理员菜单</span>
        </template>
        <el-menu-item index="1-1" @click="$router.push('/orders/reserve')">
          <template #title><span>审批预约订单</span></template>
        </el-menu-item>
        <el-menu-item index="1-2" @click="$router.push('/orders/fault')">
          <template #title><span>审批报修订单</span></template>
        </el-menu-item>
        <el-menu-item index="1-3" @click="$router.push('/orders/lf')">
          <template #title><span>管理失物招领</span></template>
        </el-menu-item>
        <el-menu-item index="1-4" @click="$router.push('/orders/recruitment')">
          <template #title><span>发布招聘信息</span></template>
        </el-menu-item>
      </el-sub-menu>

      <el-menu-item index="2" @click="$router.push('/classroom')">
        <img src="../../assets/icon/classroom.svg" class="el-menu-vertical-all-icon" />
        <template #title><span>预约教室</span></template>
      </el-menu-item>

      <el-menu-item index="3" @click="$router.push('/seat')">
        <img src="../../assets/icon/seat.svg" class="el-menu-vertical-all-icon" />
        <template #title><span>预约图书馆座位</span></template>
      </el-menu-item>

      <el-menu-item index="4" @click="$router.push('/sports')">
        <img src="../../assets/icon/sport.svg" class="el-menu-vertical-all-icon" />
        <template #title><span>预约球场</span></template>
      </el-menu-item>

      <el-menu-item index="5" @click="$router.push('/records')">
        <img src="../../assets/icon/record.svg" class="el-menu-vertical-all-icon" />
        <template #title><span>预约记录</span></template>
      </el-menu-item>

      <el-menu-item index="6" @click="$router.push('/fault')">
        <img src="../../assets/icon/malfunction.svg" class="el-menu-vertical-all-icon" />
        <template #title><span>故障报修</span></template>
      </el-menu-item>

      <el-sub-menu index="7">
        <template #title>
          <img src="../../assets/icon/LostAndFound.svg" class="el-menu-vertical-all-icon" />
          <span>失物招领</span>
        </template>
        <el-menu-item index="7-1" @click="$router.push('/lostFound/view')">
          <template #title><span>查看失物招领</span></template>
        </el-menu-item>
        <el-menu-item index="7-2" @click="$router.push('/lostFound/postHistory')">
          <template #title><span>发布与记录</span></template>
        </el-menu-item>
      </el-sub-menu>

      <el-menu-item index="8" @click="$router.push('/recruitment')">
        <img src="../../assets/icon/recruitment.svg" class="el-menu-vertical-all-icon" />
        <template #title><span>校园招聘</span></template>
      </el-menu-item>

      <el-menu-item index="9" @click="$router.push('/news')">
        <img src="../../assets/icon/new.svg" class="el-menu-vertical-all-icon" />
        <template #title><span>校园新闻</span></template>
      </el-menu-item>
    </el-menu>
  </el-scrollbar>
</template>

<script lang="ts" setup>
import { menuControlStore } from "../../store/menuControlStore";
import { watch, ref } from 'vue';
import { useRoute } from 'vue-router';
import { accountStore } from "../../store/accountStore";

const roleData: string = accountStore().role
const menuControl = menuControlStore()

const activeIndex = ref('2');
const route = useRoute();

watch(
  () => route.path, (newPath) => {
    updateMenuSelection(newPath);
  }
);
const updateMenuSelection = (path: string) => {
  if (path.startsWith('/orders')) {
    if (path.includes('/reserve')) {
      activeIndex.value = '1-1';
    } else if (path.includes('/fault')) {
      activeIndex.value = '1-2';
    } else if (path.includes('/lf')) {
      activeIndex.value = '1-3';
    } else if (path.includes('/recruitment')) {
      activeIndex.value = '1-4';
    }
  } else if (path === '/classroom') {
    activeIndex.value = '2';
  } else if (path === '/seat') {
    activeIndex.value = '3';
  } else if (path === '/sports') {
    activeIndex.value = '4';
  } else if (path === '/records') {
    activeIndex.value = '5';
  } else if (path === '/fault') {
    activeIndex.value = '6';
  } else if (path.startsWith('/lostFound')) {
    if (path.includes('/view')) {
      activeIndex.value = '7-1';
    } else if (path.includes('/postHistory')) {
      activeIndex.value = '7-2';
    }
  } else if (path === '/recruitment') {
    activeIndex.value = '8';
  } else if (path === '/news') {
    activeIndex.value = '9';
  }
};


</script>

<style lang="less" scoped>
:deep(*) {
  color: var(--w-text-color) !important;
}

:deep(.el-menu-vertical > .el-sub-menu.is-active > .el-sub-menu__title.el-tooltip__trigger) {
  background-color: var(--element-active-color) !important;

  &:hover {
    background-color: var(--element-hover-color) !important;
  }
}

:deep(.el-sub-menu__title:hover) {
  background-color: var(--element-hover-color) !important;
}

.el-menu-vertical {
  min-height: var(--element-height-full-viewport-height);
  border-right: 1px solid var(--bg-color);

  &:not(.el-menu--collapse) {
    width: 200px;
  }

  &-0 {
    margin-bottom: 10px;

    &-icon {
      width: 35px;
      height: 35px;
      margin-right: 10px;
      margin-left: -8px;
    }

    &-title {
      font-size: var(--title-font-size) !important;
      font-weight: var(--title-font-weight);
    }

    &:hover {
      background-color: var(--title-hover-bg-color);
    }
  }

  &-all {
    &-icon {
      width: 18px;
      height: 18px;
      margin-right: 10px;
    }
  }
}

.el-menu-item {

  &.is-active:not(.el-menu-vertical-0) {
    background-color: var(--element-active-color);
  }

  &:hover:not(.el-menu-vertical-0) {
    background-color: var(--element-hover-color);
  }
}
</style>