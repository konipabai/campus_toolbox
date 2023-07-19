<template>
  <div class="classroom">
    <el-card shadow="hover">
      <el-row>
        <el-col :span="6">
          <el-form-item label="地点">
            <el-select v-model="buildingValue" placeholder="请选择楼名" clearable>
              <template #prefix>
                <el-icon>
                  <MapLocation />
                </el-icon>
              </template>
              <el-option v-for="item in buildingData" :key="item.value" :value="item.value" />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="楼层">
            <el-select v-model="floorValue" placeholder="请选择楼层" clearable>
              <template #prefix>
                <el-icon>
                  <OfficeBuilding />
                </el-icon>
              </template>
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
        <el-col :span="6">
          <el-form-item label="时间段">
            <el-select v-model="time" class="m-2" placeholder="请选择时间" clearable>
              <template #prefix>
                <el-icon>
                  <Timer />
                </el-icon>
              </template>
              <el-option v-for="item in timeData" :key="item" :value="item" />
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col class="classroom-head-button">
          <el-form-item>
            <el-button type="primary" @click="searchForm()">查询</el-button>
            <el-button @click="resetForm()">重置</el-button>
          </el-form-item>
        </el-col>
      </el-row>
    </el-card>
    <el-card shadow="hover" class="classroom-main-card">
      <el-table :data="resultData" class="classroom-main-table">
        <el-table-column prop="classroomBuilding" label="地点" min-width="2" />
        <el-table-column prop="classroomFloor" label="楼层" min-width="2" />
        <el-table-column prop="classroomNumber" label="教室号" min-width="2" />
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
import { Ref, ref, watch } from 'vue'
import zhCn from 'element-plus/lib/locale/lang/zh-cn'
import { Timer, MapLocation, OfficeBuilding } from '@element-plus/icons-vue'
import { getClassroom } from "../../../server/index";
import type { classroomType } from "../../../types/classroom"

const buildingValue: Ref<string> = ref('')
const floorValue: Ref<string> = ref('')
const dateValue: Ref<string> = ref('')
const time: Ref<string> = ref('')
const locale = zhCn
const result: Ref<classroomType[]> = ref([])
const resultData: Ref<classroomType[]> = ref([]);

const searchForm = async () => {
  const data = await getClassroom({ building: buildingValue.value, floor: floorValue.value, date: dateValue.value, time: time.value });
  result.value = data;
};

watch(result, () => {
  const newData: classroomType[] = [];
  result.value.forEach(item => {
    item.time.forEach(timeEntry => {
      newData.push({
        classroomBuilding: item.classroomBuilding,
        classroomFloor: item.classroomFloor,
        classroomNumber: item.classroomNumber,
        date: item.date.replace(/ /g, '/'),
        time: [timeEntry]
      });
    });
  });
  resultData.value = newData;
});

const resetForm = () => {
  buildingValue.value = ''
  floorValue.value = ''
  dateValue.value = ''
  time.value = ''
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
const timeData = [
  '第1节 8:30-9:15',
  '第2节 9:20-10:05',
  '第3节 10:25-11:10',
  '第4节 11:15-12:00',
  '第5节 14:00-14:45',
  '第6节 14:50-15:35',
  '第7节 15:55-16:40',
  '第8节 16:45-17:30',
  '第9节 18:30-19:15',
  '第10节 19:20-20:05',
  '第11节 20:25-21:10',
  '第12节 21:15-22:00'
]
</script>

<style lang="less" scoped>
:deep(.el-input__wrapper) {
  width: 190px;
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

.el-select-dropdown__item.selected {
  background-color: var(--select-color);
  font-weight: normal;
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
