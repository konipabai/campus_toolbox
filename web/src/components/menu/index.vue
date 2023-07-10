<template>
  <el-scrollbar>
    <el-menu :default-active="activeIndex" class="el-menu-vertical" background-color="var(--bg-color)"
      :unique-opened="true" :collapse="menuControl.isCollapse">
      <el-menu-item index="0" @click="menuChang()" class="el-menu-vertical-0">
        <img src="../../assets/icon/logo.svg" class="el-menu-vertical-0-icon" />
        <template #title>
          <span class="el-menu-vertical-0-title">校园百宝箱</span>
        </template>
      </el-menu-item>

      <el-menu-item index="1" @click="$router.push('/home')">
        <img src="../../assets/icon/index.svg" class="el-menu-vertical-all-icon" />
        <template #title><span>首页</span></template>
      </el-menu-item>

      <el-sub-menu index="2">
        <template #title>
          <img src="../../assets/icon/approval.svg" class="el-menu-vertical-all-icon" />
          <span>管理订单</span>
        </template>
        <el-sub-menu index="2-1">
          <template #title><span>管理预约订单</span></template>
          <el-menu-item index="2-1-1"
            @click="$router.push('/orders/reservations/approveOrders')"><span>审批预约订单</span></el-menu-item>
          <el-menu-item index="2-1-2"
            @click="$router.push('/orders/reservations/approvalRecords')"><span>审批记录</span></el-menu-item>
        </el-sub-menu>
        <el-sub-menu index="2-2">
          <template #title><span>管理报修订单</span></template>
          <el-menu-item index="2-2-1"
            @click="$router.push('/orders/maintenance/approveOrders')"><span>审批报修订单</span></el-menu-item>
          <el-menu-item index="2-2-2"
            @click="$router.push('/orders/maintenance/approvalRecords')"><span>审批记录</span></el-menu-item>
        </el-sub-menu>
        <el-menu-item index="2-3" @click="$router.push('/orders/lf')">
          <template #title><span>管理失物招领</span></template>
        </el-menu-item>
      </el-sub-menu>

      <el-menu-item index="3" @click="$router.push('/classroom')">
        <img src="../../assets/icon/classroom.svg" class="el-menu-vertical-all-icon" />
        <template #title><span>预约教室</span></template>
      </el-menu-item>

      <el-menu-item index="4" @click="$router.push('/seat')">
        <img src="../../assets/icon/seat.svg" class="el-menu-vertical-all-icon" />
        <template #title><span>预约图书馆座位</span></template>
      </el-menu-item>

      <el-menu-item index="5" @click="$router.push('/sports')">
        <img src="../../assets/icon/sport.svg" class="el-menu-vertical-all-icon" />
        <template #title><span>预约球场</span></template>
      </el-menu-item>

      <el-menu-item index="6" @click="$router.push('/records')">
        <img src="../../assets/icon/record.svg" class="el-menu-vertical-all-icon" />
        <template #title><span>预约记录</span></template>
      </el-menu-item>

      <el-sub-menu index="7">
        <template #title>
          <img src="../../assets/icon/malfunction.svg" class="el-menu-vertical-all-icon" />
          <span>故障报修</span>
        </template>
        <el-menu-item index="7-1" @click="$router.push('/fault/apply')">
          <template #title><span>申请报修</span></template>
        </el-menu-item>
        <el-menu-item index="7-2" @click="$router.push('/fault/records')">
          <template #title><span>报修记录</span></template>
        </el-menu-item>
      </el-sub-menu>

      <el-sub-menu index="8">
        <template #title>
          <img src="../../assets/icon/LostAndFound.svg" class="el-menu-vertical-all-icon" />
          <span>失物招领</span>
        </template>
        <el-menu-item index="8-1" @click="$router.push('/lostFound/view')">
          <template #title><span>查看失物招领</span></template>
        </el-menu-item>
        <el-menu-item index="8-2" @click="$router.push('/lostFound/post')">
          <template #title><span>发布失物招领</span></template>
        </el-menu-item>
        <el-menu-item index="8-3" @click="$router.push('/lostFound/history')">
          <template #title><span>发布记录</span></template>
        </el-menu-item>
      </el-sub-menu>

      <el-sub-menu index="9">
        <template #title>
          <img src="../../assets/icon/recruitment.svg" class="el-menu-vertical-all-icon" />
          <span>校园招聘</span>
        </template>
        <el-menu-item index="9-1" @click="$router.push('/recruitment/view')">
          <template #title><span>查看招聘信息</span></template>
        </el-menu-item>
        <el-menu-item index="9-2" @click="$router.push('/recruitment/edit')">
          <template #title><span>编辑招聘信息</span></template>
        </el-menu-item>
      </el-sub-menu>

      <el-menu-item index="10" @click="$router.push('/news')">
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

const menuControl = menuControlStore()
const menuChang = () => {
  menuControl.changeState()
}

const activeIndex = ref('0');
const route = useRoute();

watch(
  () => route.path, (newPath) => {
    updateMenuSelection(newPath);
  }
);
const updateMenuSelection = (path: string) => {
  if (path === '/home') {
    activeIndex.value = '1';
  } else if (path.startsWith('/orders')) {
    if (path.includes('/reservations')) {
      if (path.includes('/approveOrders')) {
        activeIndex.value = '2-1-1';
      } else if (path.includes('/approvalRecords')) {
        activeIndex.value = '2-1-2';
      }
    } else if (path.includes('/maintenance')) {
      if (path.includes('/approveOrders')) {
        activeIndex.value = '2-2-1';
      } else if (path.includes('/approvalRecords')) {
        activeIndex.value = '2-2-2';
      }
    } else if (path.includes('/lf')) {
      activeIndex.value = '2-3';
    }
  } else if (path === '/classroom') {
    activeIndex.value = '3';
  } else if (path === '/seat') {
    activeIndex.value = '4';
  } else if (path === '/sports') {
    activeIndex.value = '5';
  } else if (path === '/records') {
    activeIndex.value = '6';
  } else if (path.startsWith('/fault')) {
    if (path.includes('/apply')) {
      activeIndex.value = '7-1';
    } else if (path.includes('/records')) {
      activeIndex.value = '7-2';
    }
  } else if (path.startsWith('/lostFound')) {
    if (path.includes('/view')) {
      activeIndex.value = '8-1';
    } else if (path.includes('/post')) {
      activeIndex.value = '8-2';
    } else if (path.includes('/history')) {
      activeIndex.value = '8-3';
    }
  } else if (path.startsWith('/recruitment')) {
    if (path.includes('/view')) {
      activeIndex.value = '9-1';
    } else if (path.includes('/edit')) {
      activeIndex.value = '9-2';
    }
  } else if (path === '/news') {
    activeIndex.value = '10';
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