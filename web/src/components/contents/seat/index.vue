<template>
  <div class="seat">
    <el-card shadow="hover">
      <el-form :inline="true" :model="searchData" ref="seat" class="seat-head">
        <el-row>
          <el-col :span="9">
            <el-form-item label="楼层" prop="floor">
              <el-select v-model="searchData.floor" placeholder="请选择楼层" clearable>
                <template #prefix>
                  <el-icon>
                    <OfficeBuilding />
                  </el-icon>
                </template>
                <el-option v-for="item in floorData" :key="item.value" :value="item.value" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="9">
            <el-form-item label="日期" prop="date">
              <el-config-provider :locale="locale">
                <el-date-picker v-model="searchData.date" type="date" placeholder="请选择日期" />
              </el-config-provider>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item class="seat-head-button">
              <el-button type="primary" @click="">查询</el-button>
              <el-button @click="">重置</el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-card>
    <el-card class="seat-card" shadow="hover">
      <div class="seat-chart">
        <div class="seat-chart-left">
          <div class="seat-chart-left-top">
            <div v-for="col in 8">
              <div v-for="row in 4">
                <div class="seat-chart-item" @click="
                  openDrawer('left-top', col, row, $event.target as Element)
                  " tabindex="1"></div>
              </div>
            </div>
          </div>
          <el-divider />
          <div class="seat-chart-left-bottom">
            <div v-for="col in 8">
              <div v-for="row in 4">
                <div class="seat-chart-item" @click="
                  openDrawer(
                    'left-bottom',
                    col,
                    row,
                    $event.target as Element
                  )
                  " tabindex="1"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="seat-chart-center">
          <div class="seat-chart-center-top">楼梯</div>
          <div class="seat-chart-center-bottom">门口</div>
        </div>
        <div class="seat-chart-right">
          <div class="seat-chart-right-top">
            <div v-for="col in 8">
              <div v-for="row in 4">
                <div class="seat-chart-item" @click="
                  openDrawer('right-top', col, row, $event.target as Element)
                  " tabindex="1"></div>
              </div>
            </div>
          </div>
          <el-divider />
          <div class="seat-chart-right-bottom">
            <div v-for="col in 8">
              <div v-for="row in 4">
                <div class="seat-chart-item" @click="
                  openDrawer(
                    'right-bottom',
                    col,
                    row,
                    $event.target as Element
                  )
                  " tabindex="1"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </el-card>
    <el-drawer v-model="drawer" title="预约详情" @close="closeDrawer()" class="seat-drawer">
      <el-scrollbar>
        <el-form ref="seatDrawerRef" :model="postData" label-width="100px" class="seat-drawer-form">
          <el-form-item label="楼层" prop="floor">
            <el-input v-model="postData.floor" disabled />
          </el-form-item>
          <el-form-item label="日期" prop="date">
            <el-input v-model="postData.date" disabled />
          </el-form-item>
          <el-form-item label="桌号" prop="number">
            <el-input v-model="postData.number" disabled />
          </el-form-item>
          <el-form-item label="已被预订" prop="order" class="seat-drawer-form-order">
            <el-button v-for="item in postData.order">{{ item }}</el-button>
          </el-form-item>
          <el-form-item label="预约时间" prop="time">
            <el-config-provider :locale="locale">
              <el-time-picker v-model="postData.time" is-range range-separator="—" start-placeholder="开始时间"
                end-placeholder="结束时间" format="HH:mm" />
            </el-config-provider>
          </el-form-item>
          <el-form-item label="选择位置" prop="seat">
            <div class="seat-drawer-form-seat">
              <span class="seat-drawer-form-seat-left">
                <img src="../../../assets/icon/seat1.svg" class="seat-drawer-form-seat-item"
                  @click="selectSeat(1, $event.target as Element)" />
                <img src="../../../assets/icon/seat3.svg" class="seat-drawer-form-seat-item"
                  @click="selectSeat(3, $event.target as Element)" />
              </span>
              <span class="seat-drawer-form-seat-center">桌<br />子</span>
              <span class="seat-drawer-form-seat-right">
                <img src="../../../assets/icon/seat2.svg" class="seat-drawer-form-seat-item"
                  @click="selectSeat(2, $event.target as Element)" />
                <img src="../../../assets/icon/seat4.svg" class="seat-drawer-form-seat-item"
                  @click="selectSeat(4, $event.target as Element)" />
              </span>
            </div>
          </el-form-item>
        </el-form>
      </el-scrollbar>
      <template #footer>
        <span>
          <el-button type="primary" @click="">
            确认
          </el-button>
          <el-button @click="drawer = false">取消</el-button>
        </span>
      </template>
    </el-drawer>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, Ref } from "vue";
import { OfficeBuilding } from "@element-plus/icons-vue";
import zhCn from "element-plus/lib/locale/lang/zh-cn";
import moment from "moment";

const locale = zhCn;
const drawer: Ref<boolean> = ref(false);
// const value1: Ref<[Date, Date]> = ref([
//   new Date(2023, 1, 1, 0, 0),
//   new Date(2023, 1, 1, 23, 59)
// ]) as Ref<[Date, Date]>
const searchData = reactive({
  floor: "",
  date: "",
});

const openDrawer = (location: string, col: number, row: number, e: Element) => {
  e.classList.add("active");
  drawer.value = true;
  postData.date =
    searchData.date != "" && searchData.date != null
      ? moment(searchData.date).format("YYYY/MM/DD")
      : new Date().getFullYear() +
      "/" +
      (new Date().getMonth() + 1) +
      "/" +
      new Date().getDate();
  postData.floor =
    searchData.floor != "" && searchData.floor != null
      ? searchData.floor
      : "一楼";
  var area = "";
  if (location == "left-top") {
    area = "A";
  } else if (location == "right-top") {
    area = "B";
  } else if (location == "left-bottom") {
    area = "C";
  } else {
    area = "D";
  }
  postData.number =
    area + "区第 " + row + " 行，第 " + col + " 列，" + area + row + col + " 号桌";
};

const closeDrawer = () => {
  const activeElements = document.querySelector(
    ".seat-chart-item.active"
  ) as Element;
  activeElements.classList.remove("active");
};

const floorData = [
  {
    value: "一楼",
  },
  {
    value: "二楼",
  },
  {
    value: "三楼",
  },
  {
    value: "四楼",
  },
];

const postData = reactive({
  date: "",
  time: [new Date(2023, 1, 1, 0, 0), new Date(2023, 1, 1, 23, 59)] as [
    Date,
    Date
  ],
  floor: "",
  number: "",
  order: [""],
  seat: "",
});
postData.order = [
  "1座 08:03-10:16",
  "3座 08:03-10:16",
  "3座 10:30-12:00",
  "2座 14:30-18:00",
  "3座 14:30-18:00",
  "4座 14:30-18:00",
  "1座 20:11-22:36",
  "3座 20:11-22:36",
  "4座 20:11-22:36",
];

const selectSeat = (seatNum: number, e: Element) => {

  if (e.classList.contains("active")) {
    postData.seat = "";
    e.classList.remove("active");
  } else {
    const activeElements = document.querySelector(
      ".seat-drawer-form-seat-item.active"
    );
    if (activeElements != null) {
      activeElements.classList.remove("active");
    }
    if (seatNum == 1) {
      postData.seat = "1座";
    } else if (seatNum == 2) {
      postData.seat = "2座";
    } else if (seatNum == 3) {
      postData.seat = "3座";
    } else {
      postData.seat = "4座";
    }
    e.classList.add("active");
  }
};
</script>

<style lang="less" scoped>
.seat {
  &-head {
    align-items: center;
    margin-bottom: -20px;

    .el-col:not(:nth-child(3)) {
      padding: 0px 30px;

      &:deep(.el-date-editor.el-input) {
        width: 250px;
      }
    }

    .el-col:nth-child(3) {
      display: flex;
      justify-content: flex-end;
    }

    &-button {
      margin-right: 10px;
    }
  }

  &-card {
    margin-top: 10px;
    height: calc(100vh - 180px);
  }

  &-chart {
    display: flex;

    .el-divider {
      margin: 0 auto;
      width: 90%;
    }

    &-item {
      width: 40px;
      height: 40px;
      border: 1px solid var(--title-hover-bg-color);
      margin: 20px 10px;
      border-radius: 15px;
      display: flex;
      justify-content: center;
      align-items: center;

      &:hover {
        background-color: var(--title-hover-bg-color);
      }

      &.active {
        background-color: var(--element-active-color);
      }
    }

    &-left {
      height: calc(100vh - 220px);
      width: 40%;

      &-top {
        height: 48%;
        display: flex;
        margin-bottom: 2%;
        justify-content: center;
        align-items: center;
        font-size: 25px !important;
      }

      &-bottom {
        height: 48%;
        display: flex;
        margin-top: 2%;
        justify-content: center;
        align-items: center;
        font-size: 25px !important;
      }
    }

    &-center {
      height: calc(100vh - 220px);
      width: 18%;
      margin: 0 1%;

      &-top {
        height: calc(48% - 1px);
        border: 1px solid black;
        margin-bottom: 8%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 25px !important;
        border-radius: 25px;
      }

      &-bottom {
        height: calc(48% - 1px);
        border: 1px solid black;
        margin-top: 8%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 25px !important;
        border-radius: 25px;
      }
    }

    &-right {
      height: calc(100vh - 220px);
      width: 40%;

      &-top {
        height: 48%;
        margin-bottom: 2%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 25px !important;
      }

      &-bottom {
        height: 48%;
        margin-top: 2%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 25px !important;
      }
    }
  }

  &-drawer {
    &-form {
      margin-right: 20px;

      &-order {
        &:deep(.el-form-item__content) {
          .el-button {
            margin: 4px 2px;
            padding: 0 10px;
          }
        }
      }

      &-seat {
        display: flex;
        width: 100%;
        height: 100%;
        align-items: center;
        margin-top: 40px;

        &-left {
          width: 25%;
        }

        &-center {
          width: 50%;
          height: 100%;
          border: 3px solid var(--b-text-color);
          background-color: var(--svg-select-color);
          border-radius: 10px;
          display: flex;
          justify-content: center;
          align-items: center;
        }

        &-right {
          width: 25%;
        }

        &-item {
          width: 80%;
          height: 58px;
          margin: 10%;

          &.active {
            background-color: var(--svg-select-color);
            border-radius: 30px;
          }
        }
      }
    }
  }
}
</style>
