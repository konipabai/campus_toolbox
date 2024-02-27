<template>
  <div class="classroom">
    <el-card shadow="hover">
      <el-form :inline="true" :model="searchData" ref="classroomRef" class="classroom-head">
        <el-row>
          <el-col :span="6">
            <el-form-item label="地点" prop="building" class="classroom-head-search">
              <el-select v-model="searchData.building" placeholder="请选择地点" clearable>
                <template #prefix>
                  <el-icon>
                    <MapLocation />
                  </el-icon>
                </template>
                <el-option v-for="(item, index) in buildingData" :key="index" :value="item.value" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="楼层" prop="floor" class="classroom-head-search">
              <el-select v-model="searchData.floor" placeholder="请选择楼层" clearable>
                <template #prefix>
                  <el-icon>
                    <OfficeBuilding />
                  </el-icon>
                </template>
                <el-option v-for="(item, index) in floorData" :key="index" :value="item.value" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="日期" prop="date" class="classroom-head-search">
              <el-config-provider :locale="locale">
                <el-date-picker v-model="searchData.date" type="date" placeholder="请选择日期" />
              </el-config-provider>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="时间" prop="time" class="classroom-head-search">
              <el-select v-model="searchData.time" placeholder="请选择时间" clearable>
                <template #prefix>
                  <el-icon>
                    <Timer />
                  </el-icon>
                </template>
                <el-option v-for="(item, index) in timeData" :key="index" :value="item" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item class="classroom-head-item">
              <el-button type="primary" @click="searchForm()">查询</el-button>
              <el-button @click="resetForm(classroomRef)">重置</el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-card>
    <el-card shadow="hover" class="classroom-main-card">
      <el-table :data="paginatedData" class="classroom-main-table" ref="tableTop" v-loading="loading">
        <template #empty>
          <div class="tableEmpty">
            <span class="tableEmptyIcon"></span>
            <span>暂无数据</span>
          </div>
        </template>
        <el-table-column prop="classroomBuilding" label="地点" min-width="2" />
        <el-table-column prop="classroomFloor" label="楼层" min-width="2" />
        <el-table-column prop="classroomNumber" label="教室号" min-width="2" />
        <el-table-column prop="date" label="日期" min-width="2" />
        <el-table-column prop="time" label="时间段" min-width="2" />
        <el-table-column min-width="1" label="操作">
          <template #default="scope">
            <el-button type="primary" @click="reserveForm(scope.row)">预约</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-config-provider :locale="locale">
        <el-pagination :model="paginationData" layout="prev, pager, next, jumper"
          v-model:page-size="paginationData.pageSize" :total="resultData.length" :pager-count="5" background small
          v-model:current-page="paginationData.currentPage" @current-change="CurrentChange"
          class="classroom-main-pagination" />
      </el-config-provider>
    </el-card>
    <el-dialog v-model="dialogVisible" title="预约" width="400px" draggable center>
      <el-form label-width="80px" :model="reserveData">
        <el-form-item label="申请人">
          <el-input v-model="reserveData.accountAndName" disabled />
        </el-form-item>
        <el-form-item label="教室">
          <el-input v-model="reserveData.classroomNumber" disabled />
        </el-form-item>
        <el-form-item label="时间">
          <el-input v-model="reserveData.dateAndTime" disabled />
        </el-form-item>
        <el-form-item label="申请理由">
          <el-input v-model="reserveData.reason" type="textarea" />
        </el-form-item>
      </el-form>
      <template #footer>
        <span>
          <el-button type="primary" @click="submitForm">
            确认
          </el-button>
          <el-button @click="dialogVisible = false">取消</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script lang="ts" setup>
import { computed, ComputedRef, reactive, Ref, ref, watch } from 'vue'
import zhCn from 'element-plus/lib/locale/lang/zh-cn'
import { Timer, MapLocation, OfficeBuilding } from '@element-plus/icons-vue'
import { postClassroom, getClassroom } from "../../../server/index";
import type { getClassroomType, searchClassroomType, reserveClassroomType, paginationClassroomType } from "../../../types/classroom"
import { ElMessage, FormInstance, ElTable } from 'element-plus';
import { accountStore } from "../../../store/accountStore";

const locale = zhCn
const result: Ref<getClassroomType[]> = ref([])
const resultData: Ref<getClassroomType[]> = ref([])
const dialogVisible: Ref<boolean> = ref(false)
const tableTop: Ref<typeof ElTable | undefined> = ref();
const loading: Ref<boolean> = ref(false)
const classroomRef: Ref<FormInstance | undefined> = ref()

const searchData: searchClassroomType = reactive({
  building: '',
  floor: '',
  date: '',
  time: ''
})

const reserveData: reserveClassroomType = reactive({
  accountAndName: accountStore().name + ' ' + accountStore().account,
  classroomNumber: '',
  dateAndTime: '',
  reason: '',
  location: '',
  floor: ''
})

const paginationData: paginationClassroomType = reactive({
  currentPage: 1,
  pageSize: 15
})

const CurrentChange = () => {
  if (tableTop.value) {
    tableTop.value.setScrollTop(0);
  }
}

const paginatedData: ComputedRef<getClassroomType[]> = computed(() => {
  const startIndex = (paginationData.currentPage - 1) * paginationData.pageSize;
  const endIndex = startIndex + paginationData.pageSize;
  return resultData.value.slice(startIndex, endIndex);
});

const searchForm = async () => {
  try {
    loading.value = true
    await new Promise(resolve => setTimeout(resolve, 300));
    const data = await getClassroom(searchData);
    loading.value = false
    if (data.length != 0) {
      result.value = data;
    } else {
      ElMessage({
        message: '未找到对应数据，请选择其他楼层',
        type: 'warning'
      })
    }
  } catch (error) {
    ElMessage.error('未知错误，请稍后再试')
    console.log(error);
  } finally {
    paginationData.currentPage = 1
    loading.value = false;
  }
};

const reserveForm = (row: getClassroomType) => {
  dialogVisible.value = true;
  reserveData.classroomNumber = row.classroomNumber;
  reserveData.dateAndTime = row.date + " " + row.time;
  reserveData.location = row.classroomBuilding
  reserveData.floor = row.classroomFloor
};

watch(result, () => {
  const newData: getClassroomType[] = [];
  result.value.forEach(item => {
    item.time.forEach(timeEntry => {
      newData.push({
        classroomBuilding: item.classroomBuilding,
        classroomFloor: item.classroomFloor,
        classroomNumber: item.classroomNumber,
        date: item.date,
        time: [timeEntry]
      });
    });
  });
  resultData.value = newData;
});

const resetForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.resetFields()
}

const submitForm = async () => {
  if (reserveData.reason == '') {
    ElMessage.error('请输入理由')
  } else {
    try {
      const state = await postClassroom(reserveData)
      if (state == true) {
        dialogVisible.value = false
        ElMessage({
          message: '等待审核',
          type: 'success'
        })
      } else {
        ElMessage.error('未知错误，请稍后再试')
      }
    } catch (error) {
      console.log(error);
      ElMessage.error('未知错误，请稍后再试')
    }
  }
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
.el-select-dropdown__item.selected {
  background-color: var(--select-color);
  font-weight: normal;
}

.classroom {
  display: flex;
  flex-direction: column;
  height: var(--element-height-full);

  &-head {

    .el-select,
    :deep(.el-date-editor.el-date-editor--date) {
      width: var(--element-width-full);
    }

    .el-col {
      display: flex;
      justify-content: center;
    }

    &-search {
      width: 90%;
    }

    &-item {
      margin-bottom: -5px;
      margin-left: auto;
      margin-right: 10px;
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
      height: calc(100vh - 300px);
    }

    &-pagination {
      margin-top: 15px;
      display: flex;
      justify-content: flex-end;
    }
  }
}
</style>
