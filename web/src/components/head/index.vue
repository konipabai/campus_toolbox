<template>
  <div class="head-box">
    <span class="head-box-span-0">
      <el-icon v-if="menuControl.isCollapse" color="var(--button-color)" class="head-box-span-0-icon"
        @click="menuChang()">
        <Expand class="head-box-span-0-img" />
      </el-icon>
      <el-icon v-else color="var(--button-color)" class="head-box-span-0-icon" @click="menuChang()">
        <Fold class="head-box-span-0-img" />
      </el-icon>
    </span>
    <span class="head-box-span-1">
      <el-breadcrumb :separator-icon="ArrowRight">
        <el-breadcrumb-item v-for="(item, index) in $route.matched" :key="index">
          <template v-if="item.meta.father == 'true'">
            <el-dropdown>
              <span class="head-box-span-1-title">
                {{ item.meta.msg }}
                <el-icon class="head-box-span-1-icon">
                  <arrow-down />
                </el-icon>
              </span>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item v-for="(items, index) in (item.children as any)" @click="dropDown(item, items)"
                    :key="index">
                    {{ items.meta.msg }}
                  </el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
          </template>
          <template v-else>
            <span class="head-box-span-1-title">{{ item.meta.msg }}</span>
          </template>
        </el-breadcrumb-item>
      </el-breadcrumb>
    </span>
    <span class="head-box-span-2">
      <template v-if="fullScreen == false">
        <el-tooltip effect="dark" content="全屏" placement="bottom">
          <img src="../../assets/icon/fullScreen.svg" @click="changeFullScreen()"
            class="head-box-span-2-img head-box-span-2-all" />
        </el-tooltip>
      </template>
      <template v-else>
        <el-tooltip effect="dark" content="取消全屏" placement="bottom">
          <img src="../../assets/icon/cancelFullScreen.svg" @click="changeFullScreen()"
            class="head-box-span-2-img head-box-span-2-all" />
        </el-tooltip>
      </template>
      <span class="head-box-span-2-name">
        <el-popconfirm width="100" confirm-button-text="确定" cancel-button-text="取消" title="退出账号" @confirm="logout()">
          <template #reference>
            <div class="head-box-span-2-div">
              <el-avatar :src="profilePhoto" />
              <span class="head-box-span-2-div-text">卡拉米</span>
            </div>
          </template>
        </el-popconfirm>
      </span>
    </span>
  </div>
</template>

<script setup lang="ts">
import { Fold, Expand, ArrowRight, ArrowDown } from "@element-plus/icons-vue";
import { menuControlStore } from "../../store/menuControlStore";
import router from "../../router";
import { onMounted, ref } from "vue";
import profilePhoto from '../../assets/image/profilePhoto.png'

const menuControl = menuControlStore();
const menuChang = () => {
  menuControl.changeState();
};

const dropDown = (item: any, items: any) => {
  if (!('children' in items)) {
    router.push(item.path + '/' + items.path)
  }
  else {
    router.push(item.path + '/' + items.path + '/' + items.children[0].path)
  }
}

const fullScreen = ref(false)
const changeFullScreen = () => {
  const isFullscreen = document.fullscreenElement !== null;
  fullScreen.value = !isFullscreen;
  if (fullScreen.value == true) {
    document.documentElement.requestFullscreen();
  } else {
    document.exitFullscreen();
  }
};

const updateFullScreenState = () => {
  const isFullscreen = document.fullscreenElement !== null;
  fullScreen.value = isFullscreen;
};

const logout = () => {
  router.push('/')
  localStorage.clear()
};

onMounted(() => {
  document.addEventListener("fullscreenchange", updateFullScreenState);
});

const drawer = ref(false)
</script>

<style lang="less" scoped>
.head-box {
  height: var(--element-height-full);
  display: flex;

  &-span-0 {
    height: var(--element-height-full);

    &-icon {
      height: var(--element-height-full);
      width: 30px;
      padding: 0px 8px;

      &:hover {
        background-color: var(--button-hover-color);
      }

      &:active {
        background-color: var(--button-active-color);
      }
    }

    &-img {
      height: 25px;
      width: 25px;
    }
  }

  &-span-1 {
    height: var(--element-height-full);
    display: flex;
    align-items: center;
    padding: 0 10px;

    :deep(:focus-visible) {
      outline: none;
    }

    &-title:hover {
      font-weight: bold;
    }

    &-icon {
      height: 10px;
    }
  }

  &-span-2 {
    height: var(--element-height-full);
    display: flex;
    align-items: center;
    margin-left: auto;

    &-all {
      height: var(--element-height-full);
      display: flex;
      align-items: center;
      padding: 0 10px;

      &:hover {
        background-color: var(--button-hover-color);
      }

      &:active {
        background-color: var(--button-active-color);
      }
    }

    &-name {
      height: var(--element-height-full);
      display: flex;
      align-items: center;
      padding: 0 10px;
      margin-right: 30px;

      &:hover {
        background-color: var(--button-hover-color);
      }

      &:active {
        background-color: var(--button-active-color);
      }
    }

    &-img {
      height: var(--element-height-full);
      width: 25px;
    }

    &-div {
      display: flex;
      align-items: center;

      &-text {
        padding-top: 5px;
        padding-left: 5px;
      }
    }
  }
}

:deep(.el-dropdown-menu__item):hover {
  font-weight: bold;
  background-color: var(--button-hover-color) !important;
}
</style>
