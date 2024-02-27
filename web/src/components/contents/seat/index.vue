<template>
  <div class="seat">
    <el-card shadow="hover">
      <el-form :inline="true" :model="searchData" ref="seatRef" class="seat-head">
        <el-form-item label="楼层" prop="floor" class="seat-head-form">
          <el-select v-model="searchData.floor" placeholder="请选择楼层" clearable>
            <template #prefix>
              <el-icon>
                <OfficeBuilding />
              </el-icon>
            </template>
            <el-option v-for="(item, index) in floorData" :key="index" :value="item.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="日期" prop="date" class="seat-head-form">
          <el-config-provider :locale="locale">
            <el-date-picker v-model="searchData.date" type="date" placeholder="请选择日期" />
          </el-config-provider>
        </el-form-item>
        <el-form-item class="seat-head-button">
          <el-button type="primary" @click="searchForm()">查询</el-button>
          <el-button @click="resetForm(seatRef)">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>
    <el-card class="seat-card" shadow="hover">
      <div class="seat-chart" v-loading="loading">
        <div class="seat-chart-left">
          <div class="seat-chart-left-top">
            <div v-for="col in 8" :key="col">
              <div v-for="row in 4" :key="row">
                <div class="seat-chart-item" :class="getSeatClass('A', col, row)"
                  @click="openDrawer('A', col, row, $event.target as Element)" tabindex="1"></div>
              </div>
            </div>
          </div>
          <el-divider />
          <div class="seat-chart-left-bottom">
            <div v-for="col in 8" :key="col">
              <div v-for="row in 4" :key="row">
                <div class="seat-chart-item" :class="getSeatClass('C', col, row)"
                  @click="openDrawer('C', col, row, $event.target as Element)" tabindex="1"></div>
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
            <div v-for="col in 8" :key="col">
              <div v-for="row in 4" :key="row">
                <div class="seat-chart-item" :class="getSeatClass('B', col, row)"
                  @click="openDrawer('B', col, row, $event.target as Element)" tabindex="1"></div>
              </div>
            </div>
          </div>
          <el-divider />
          <div class="seat-chart-right-bottom">
            <div v-for="col in 8" :key="col">
              <div v-for="row in 4" :key="row">
                <div class="seat-chart-item" :class="getSeatClass('D', col, row)"
                  @click="openDrawer('D', col, row, $event.target as Element)" tabindex="1"></div>
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
            <el-button v-if="postData.order.length == 0">暂无预定</el-button>
            <el-button v-else v-for="(item, index) in postData.order" :key="index">{{ item }}</el-button>
          </el-form-item>
          <el-form-item label="预约时间" prop="time">
            <el-config-provider :locale="locale">
              <el-time-picker v-model="postData.time" is-range range-separator="—" start-placeholder="开始时间"
                end-placeholder="结束时间" format="HH:mm" :clearable="false" />
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
          <el-button type="primary" @click="submitForm()">
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
import { getSeat, postSeat } from "../../../server";
import { ElMessage, FormInstance } from "element-plus";
import type { findSeatType, postSeatType, getSeatType } from "../../../types/seat"
import { accountStore } from "../../../store/accountStore";

const loading: Ref<boolean> = ref(false)
const locale = zhCn;
const drawer: Ref<boolean> = ref(false);
const result: Ref<findSeatType[]> = ref([])
const seatRef: Ref<FormInstance | undefined> = ref()
const searchData: getSeatType = reactive({
  floor: "",
  date: "",
});

const openDrawer = (location: string, col: number, row: number, e: Element) => {
  e.classList.add("active");
  drawer.value = true;
  postData.number = `${location}区第 ${row} 行，第 ${col} 列，${location}${row}${col} 号桌`;
  postData.order = []
  result.value.map((item: findSeatType) => {
    if (item.number == location + row + col) {
      for (let index = 0; index < item.seat.length; index++) {
        postData.order.push(item.seat[index] + " " + item.time[index])
      }
    }
  })
};

const closeDrawer = () => {
  const activeElements: Element = document.querySelector(".seat-chart-item.active") as Element;
  activeElements.classList.remove("active");
};

const floorData: { value: string }[] = [
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

const postData: postSeatType = reactive({
  account: accountStore().account,
  date: "",
  time: [new Date(2023, 1, 1, 0, 0), new Date(2023, 1, 1, 23, 59)] as [Date, Date],
  floor: "",
  number: "",
  order: [],
  seat: "",
});

const selectSeat = (seatNum: number, e: Element) => {
  if (e.classList.contains("active")) {
    postData.seat = "";
    e.classList.remove("active");
  } else {
    const activeElements: Element | null = document.querySelector(
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

const searchForm = async () => {
  try {
    if (searchData.date) {
      searchData.date = moment(searchData.date).format("YYYY-MM-DD")
    } else {
      searchData.date = moment().format('YYYY-MM-DD');
    }
    if (!searchData.floor) {
      searchData.floor = "一楼"
    }
    postData.date = searchData.date
    postData.floor = searchData.floor
    loading.value = true
    await new Promise(resolve => setTimeout(resolve, 500));
    const data = await getSeat(searchData);
    loading.value = false
    if (data.length != 0) {
      result.value = data;
    } else {
      ElMessage({
        message: '未找到对应数据，请选择其他楼层或日期',
        type: 'warning'
      })
    }
  } catch (error) {
    ElMessage.error('未知错误，请稍后再试')
    console.log(error);
  }
}
searchForm()

const resetForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.resetFields()
}

const submitForm = async () => {
  if (!postData.seat) {
    ElMessage.error('请选择座位')
  } else {
    try {
      const data = await postSeat(postData);
      if (data == true) {
        drawer.value = false
        searchForm()
        ElMessage({
          message: '预约成功',
          type: 'success'
        })
      } else {
        ElMessage.error('请选择空闲的座位或正确的时间')
      }
    } catch (error) {
      console.log(error);
    }
  }
}

const getSeatClass = (location: string, col: number, row: number) => {
  const number = `${location}${row}${col}`;
  const item = result.value.find((data) => data.number === number);
  if (item && item.time.length == 0) {
    return 'zero';
  } else if (item && item.time.length >= 1 && item.time.length <= 2) {
    return 'oneOrTwo';
  } else if (item && item.time.length >= 3 && item.time.length <= 4) {
    return 'threeOrFour';
  } else if (item && item.time.length >= 5 && item.time.length <= 6) {
    return 'fiveOrSix';
  } else if (item && item.time.length >= 7 && item.time.length <= 8) {
    return 'sevenOrEight';
  } else {
    return 'over';
  }
}
</script>

<style lang="less" scoped>
.seat {
  &-head {
    align-items: center;
    margin-bottom: -20px;
    display: flex;

    &-form {
      box-sizing: border-box;
      padding: 0px 30px;
      width: 30%;
      margin-left: auto;
      margin-right: auto;
    }

    &-button {
      margin-left: auto;
      width: 20%;

      :deep(.el-form-item__content) {
        justify-content: flex-end;
      }
    }

    .el-select,
    :deep(.el-date-editor.el-date-editor--date) {
      width: var(--element-width-full);
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
        background-color: var(--title-hover-bg-color) !important;
      }

      &.active {
        background-color: var(--element-active-color) !important;
      }

      &.oneOrTwo {
        background-color: #c9ffd0;
      }

      &.threeOrFour {
        background-color: #86FD70;
      }

      &.fiveOrSix {
        background-color: #E6FF01;
      }

      &.sevenOrEight {
        background-color: #FC9300;
      }

      &.over {
        background-color: #FF3F00;
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
            margin: 4px 6px;
            padding: 0 10px;
          }
        }
      }

      &-seat {
        display: flex;
        width: var(--element-width-full);
        height: var(--element-height-full);
        align-items: center;
        margin-top: 40px;

        &-left {
          width: 25%;
        }

        &-center {
          width: 50%;
          height: var(--element-height-full);
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
