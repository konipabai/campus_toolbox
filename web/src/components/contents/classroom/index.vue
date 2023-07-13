<template>
  <div class="classroom">
    <el-card shadow="hover">
      <el-row>
        <el-col :span="5">
          <el-form-item label="地点">
            <el-select v-model="buildingValue" placeholder="请选择楼名" clearable>
              <el-option v-for="item in buildingData" :key="item.value" :value="item.value" />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="楼层">
            <el-select v-model="floorValue" placeholder="请选择楼层" clearable>
              <el-option v-for="item in floorData" :key="item.value" :value="item.value" />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="日期">
            <el-config-provider :locale="locale">
              <el-date-picker v-model="dateValue" type="date" placeholder="请选择日期" />
            </el-config-provider>
          </el-form-item>
        </el-col>
        <el-col :span="7">
          <el-form-item label="时间段">
            <el-time-select v-model="startTime" :max-time="endTime" placeholder="开始" start="08:30" step="00:30"
              end="22:00" />
            <el-time-select v-model="endTime" :min-time="startTime" placeholder="结束" start="08:30" step="00:30"
              end="22:00" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col class="classroom-head-button">
          <el-form-item>
            <el-button type="primary">查询</el-button>
            <el-button @click="resetForm()">重置</el-button>
          </el-form-item>
        </el-col>
      </el-row>
    </el-card>
    <el-card shadow="hover" class="classroom-main-card">
      <el-table :data="tableData" class="classroom-main-table">
        <el-table-column prop="building" label="地点" min-width="2" />
        <el-table-column prop="floor" label="楼层" min-width="2" />
        <el-table-column prop="date" label="日期" min-width="2" />
        <el-table-column prop="time" label="时间段" min-width="2" />
        <el-table-column min-width="1">
          <el-button type="primary">预约</el-button>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue'
import zhCn from 'element-plus/lib/locale/lang/zh-cn'

const buildingValue = ref('')
const floorValue = ref('')
const dateValue = ref('')
const startTime = ref('')
const endTime = ref('')
const locale = zhCn

const resetForm = () => {
  buildingValue.value = ''
  floorValue.value = ''
  dateValue.value = ''
  startTime.value = ''
  endTime.value = ''
}

const buildingData = [
  {
    value: 'ALGOL 教学楼',
  },
  {
    value: 'BASIC 教学楼',
  },
  {
    value: 'C++ 教学楼',
  },
  {
    value: 'DELPHI 教学楼',
  },
  {
    value: 'ERLANG 教学楼',
  }
]
const floorData = [
  {
    value: '一楼',
  },
  {
    value: '二楼',
  },
  {
    value: '三楼',
  },
  {
    value: '四楼',
  }
]
const tableData = [
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  },
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  },
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  },
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  },
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  },
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  },
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  },
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  },
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  },
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  },
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  },
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  },
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  },
  {
    building: 'ALGOL教学楼',
    floor: '二楼',
    date: '2023/07/12',
    time: '10:00-10:30'
  }
]
</script>

<style lang="less" scoped>
:deep(.el-input--prefix > .el-input__wrapper) {
  width: 98px;
}

:deep(.el-input__wrapper) {
  width: 160px;
}

:deep(.el-button.el-button--primary) {
  background-color: var(--bg-color);

  &:hover {
    background-color: var(--element-hover-color);
  }

  &>span {
    color: var(--button-text-color) !important;
  }
}

.el-col {
  display: flex;
  justify-content: center;
  align-items: center;
}

.classroom {
  display: flex;
  flex-direction: column;
  height: var(--element-height-full);

  &-head {
    &-button {
      display: flex;
      margin-bottom: -23px;
      justify-content: flex-end;
    }
  }

  &-main {
    &-card {
      margin-top: 10px;
      overflow: auto;
      flex: 1;
      overflow: hidden;
    }

    &-table {
      height: calc(100vh - 270px);
    }
  }
}
</style>
