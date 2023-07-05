<template>
  <el-scrollbar>
    <el-menu
      default-active="1"
      class="el-menu-vertical"
      background-color="var(--bg-color)"
      text-color="var(--text-color)"
      active-text-color="var(--text-color)"
      :unique-opened="true"
      :collapse="menuControl.isCollapse"
      @open="handleOpen"
      @close="handleClose"
    >
      <el-menu-item
        index="0"
        @click="menuChang()"
        class="el-menu-vertical-0"
      >
        <img src="../../assets/icon/logo.svg" class="el-menu-vertical-0-icon" />
        <template #title>
          <span class="el-menu-vertical-0-title">校园百宝箱</span>
        </template>
      </el-menu-item>

      <el-menu-item index="1" @click="$router.push('/home')">
        <img
          src="../../assets/icon/index.svg"
          class="el-menu-vertical-all-icon"
        />
        <template #title><span>首页</span></template>
      </el-menu-item>

      <el-sub-menu index="2">
        <template #title>
          <img
            src="../../assets/icon/approval.svg"
            class="el-menu-vertical-all-icon"
          />
          <span>管理订单</span>
        </template>
        <el-sub-menu index="2-1">
          <template #title><span>管理预约订单</span></template>
          <el-menu-item index="2-1-1" @click="$router.push('/orders/reservations/approveOrders')"><span>审批预约订单</span></el-menu-item>
          <el-menu-item index="2-1-2" @click="$router.push('/orders/reservations/approvalRecords')"><span>审批记录</span></el-menu-item>
        </el-sub-menu>
        <el-sub-menu index="2-2">
          <template #title><span>管理报修订单</span></template>
          <el-menu-item index="2-2-1" @click="$router.push('/orders/maintenance/approveOrders')"><span>审批报修订单</span></el-menu-item>
          <el-menu-item index="2-2-2" @click="$router.push('/orders/maintenance/approvalRecords')"><span>审批记录</span></el-menu-item>
        </el-sub-menu>
        <el-menu-item index="2-3" @click="$router.push('/orders/lf')">
          <template #title><span>管理失物招领</span></template>
        </el-menu-item>
      </el-sub-menu>

      <el-menu-item index="3" @click="$router.push('/classroom')">
        <img
          src="../../assets/icon/classroom.svg"
          class="el-menu-vertical-all-icon"
        />
        <template #title><span>预约教室</span></template>
      </el-menu-item>

      <el-menu-item index="4" @click="$router.push('/seat')">
        <img
          src="../../assets/icon/seat.svg"
          class="el-menu-vertical-all-icon"
        />
        <template #title><span>预约图书馆座位</span></template>
      </el-menu-item>

      <el-menu-item index="5" @click="$router.push('/sports')">
        <img
          src="../../assets/icon/sport.svg"
          class="el-menu-vertical-all-icon"
        />
        <template #title><span>预约球场</span></template>
      </el-menu-item>

      <el-menu-item index="6" @click="$router.push('/records')">
        <img
          src="../../assets/icon/record.svg"
          class="el-menu-vertical-all-icon"
        />
        <template #title><span>预约记录</span></template>
      </el-menu-item>

      <el-sub-menu index="7">
        <template #title>
          <img
            src="../../assets/icon/malfunction.svg"
            class="el-menu-vertical-all-icon"
          />
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
          <img
            src="../../assets/icon/LostAndFound.svg"
            class="el-menu-vertical-all-icon"
          />
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
          <img
            src="../../assets/icon/recruitment.svg"
            class="el-menu-vertical-all-icon"
          />
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
        <img
          src="../../assets/icon/new.svg"
          class="el-menu-vertical-all-icon"
        />
        <template #title><span>校园新闻</span></template>
      </el-menu-item>
    </el-menu>
  </el-scrollbar>
</template>

<script lang="ts" setup>
import { ref } from "vue";
import { menuControlStore } from "../../store/menuControlStore";

const menuControl = menuControlStore()
const menuChang = () => {
  menuControl.changeState()
}

const handleOpen = (key: string, keyPath: string[]) => {
  console.log(key, keyPath);
};
const handleClose = (key: string, keyPath: string[]) => {
  console.log(key, keyPath);
};
</script>

<style lang="less" scoped>
.el-menu-vertical {
  min-height: var(--element-height-full-viewport-height);

  &:not(.el-menu--collapse) {
    width: 200px;
  }

  &-0 {
    &-icon {
      width: 35px;
      height: 35px;
      margin-right: var(--icon-margin-right);
      margin-left: -8px;
    }
    &-title {
      font-size: var(--title-font-size);
      font-weight: var(--title-font-weight);
    }
    &.is-active {
      background-color: var(--bg-color) !important;
    }
    &:hover {
      background-color: var(--title-hover-bg-color) !important;
    }
  }

  &-all-icon {
    width: var(--icon-width);
    height: var(--icon-height);
    margin-right: var(--icon-margin-right);
  }
}

.el-menu-item {
    &.is-active:not(.el-menu-vertical-0) {
      background-color: var(--element-active-color) !important;
    }
    &:hover:not(.el-menu-vertical-0) {
      background-color: var(--element-hover-color) !important;
    }
  }

:deep(.el-sub-menu__title:hover) {
    background-color: var(--element-hover-color) !important;
  }
</style>
