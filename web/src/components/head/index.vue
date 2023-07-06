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
        <el-breadcrumb-item v-for="item in $route.matched">
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
                  <el-dropdown-item v-for="items in (item.children as any)" @click="dropDown(item, items)">
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
  </div>
</template>

<script setup lang="ts">
import { Fold, Expand } from "@element-plus/icons-vue";
import { menuControlStore } from "../../store/menuControlStore";
import { ArrowRight, ArrowDown } from '@element-plus/icons-vue'
import router from "../../router";

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

    &-title {
      color: var(--b-text-color);

      &:hover {
        font-weight: bold;
      }
    }

    &-icon {
      height: 10px;
    }
  }
}

:deep(.el-dropdown-menu__item) {
  color: var(--b-text-color);

  &:hover {
    font-weight: bold;
    color: var(--b-text-color) !important;
    background-color: var(--button-hover-color) !important;
  }
}
</style>
