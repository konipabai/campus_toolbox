<template>
  <div class="records">
    <el-card shadow="hover">
      <el-form :inline="true" :model="searchData" ref="recordsRef" class="records-head">
        <el-form-item>
          <div style="height: 15px;width: 15px;background-color: #76ADFF;border-radius: 15px;margin: 0 5px 0 20px;"></div>
          待审核
          <div style="height: 15px;width: 15px;background-color: #76ae81;border-radius: 15px;margin: 0 5px 0 20px;"></div>
          预约成功
          <div style="height: 15px;width: 15px;background-color: #F67D7D;border-radius: 15px;margin: 0 5px 0 20px;"></div>
          预约失败
        </el-form-item>
        <el-form-item label="预约类型" prop="reservedType" class="records-head-item">
          <el-select v-model="searchData.reservedType" placeholder="请选择预约类型" clearable>
            <template #prefix>
              <el-icon>
                <Aim />
              </el-icon>
            </template>
            <el-option v-for="(item, index) in ['预约教室记录', '预约图书馆座位记录', '预约球场记录']" :key="index" :value="item" />
          </el-select>
        </el-form-item>
        <el-form-item class="records-head-button">
          <el-button type="primary" @click="searchForm()">查询</el-button>
          <el-button @click="resetForm(recordsRef)">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>
    <el-card shadow="hover" class="records-main">
      <el-table :data="paginatedData" class="records-main-table" ref="tableTop" v-loading="loading">
        <template #empty>
          <div class="tableEmpty">
            <span class="tableEmptyIcon"></span>
            <span>暂无数据</span>
          </div>
        </template>
        <template v-if="formFlag == '预约图书馆座位记录'">
          <el-table-column prop="date" label="日期" min-width="2" :show-overflow-tooltip=true />
          <el-table-column prop="time" label="时间段" min-width="2" :show-overflow-tooltip=true />
          <el-table-column prop="floor" label="楼层" min-width="2" :show-overflow-tooltip=true />
          <el-table-column prop="number" label="桌号" min-width="2" :show-overflow-tooltip=true />
          <el-table-column prop="seat" label="座位" min-width="2" :show-overflow-tooltip=true />
        </template>
        <template v-else-if="formFlag == '预约球场记录'">
          <el-table-column prop="date" label="&nbsp; 日期" min-width="2" :show-overflow-tooltip=true>
            <template #default="scope">
              <div style="display: flex; align-items: center">
                <div
                  :style="{ backgroundColor: scope.row.valid == 'true' ? '#76ae81' : '#F67D7D', width: '15px', 'height': '15px', borderRadius: '15px' }">
                </div>
                <span style="margin-left: 10px">{{ scope.row.date }}</span>
              </div>
            </template>
          </el-table-column>
          <el-table-column label="时间段" min-width="2">
            <template #default="props">
              {{ props.row.startTime }}-{{ props.row.endTime }}
            </template>
          </el-table-column>
          <el-table-column prop="type" label="场地类型" min-width="2" :show-overflow-tooltip=true />
          <el-table-column prop="court" label="场地" min-width="2" :show-overflow-tooltip=true />
          <el-table-column prop="location" label="半场/全场" min-width="2" :show-overflow-tooltip=true />
        </template>
        <template v-else>
          <el-table-column prop="date" label="&nbsp; 日期" min-width="2" :show-overflow-tooltip=true>
            <template #default="scope">
              <div style="display: flex; align-items: center">
                <div
                  :style="{ backgroundColor: scope.row.state == 'true' ? '#76ae81' : scope.row.reasonRefusal == '' ? '#76ADFF' : '#F67D7D', width: '15px', 'height': '15px', borderRadius: '15px' }">
                </div>
                <span style="margin-left: 10px">{{ scope.row.date }}</span>
              </div>
            </template>
          </el-table-column>
          <el-table-column prop="time" label="时间段" min-width="3" :show-overflow-tooltip=true />
          <el-table-column prop="location" label="地点" min-width="3" :show-overflow-tooltip=true />
          <el-table-column prop="floor" label="楼层" min-width="1" :show-overflow-tooltip=true />
          <el-table-column prop="classroomNumber" label="教室号" min-width="1" :show-overflow-tooltip=true />
        </template>
        <el-table-column min-width="1" label="操作" :show-overflow-tooltip=true>
          <template #default="scope">
            <el-button type="primary" @click="openDrawer(scope.row)">详情</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-config-provider :locale="locale">
        <el-pagination :model="paginationData" layout="prev, pager, next, jumper"
          v-model:page-size="paginationData.pageSize" :total="result.length" :pager-count="5" background small
          v-model:current-page="paginationData.currentPage" @current-change="CurrentChange"
          class="records-main-pagination" />
      </el-config-provider>
    </el-card>
    <el-drawer v-model="drawer" title="预约订单信息" @close="closeDrawer()">
      <el-scrollbar ref="topRef">
        <el-descriptions :column="1" border direction="vertical" class="records-drawer">
          <template v-if="formFlag == '预约图书馆座位记录'">
            <el-descriptions-item>
              <template #label>日期</template>
              {{ (showData as updateSeatRecordsType).date }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>时间段</template>
              {{ (showData as updateSeatRecordsType).time }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>楼层</template>
              {{ (showData as updateSeatRecordsType).floor }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>桌号</template>
              {{ (showData as updateSeatRecordsType).number }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>座位</template>
              {{ (showData as updateSeatRecordsType).seat }}
            </el-descriptions-item>
          </template>
          <template v-else-if="formFlag == '预约球场记录'">
            <el-descriptions-item>
              <template #label>日期</template>
              {{ (showData as updateSportsRecordsType).date }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>时间段</template>
              {{ (showData as updateSportsRecordsType).startTime }}-{{ (showData as updateSportsRecordsType).endTime }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>场地类型</template>
              {{ (showData as updateSportsRecordsType).type }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>场地</template>
              {{ (showData as updateSportsRecordsType).court }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>半场/全场</template>
              {{ (showData as updateSportsRecordsType).location }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>允许加入</template>
              {{ (showData as updateSportsRecordsType).collaborative }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>人数</template>
              {{ (showData as updateSportsRecordsType).number }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>订单所有权</template>
              {{ (showData as updateSportsRecordsType).ownership == 'true' ? '是' : '否' }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>订单有效性</template>
              {{ (showData as updateSportsRecordsType).valid == 'true' ? '有效' : '无效，该订单为随从订单，发起订单已被取消' }}
            </el-descriptions-item>
          </template>
          <template v-else>
            <el-descriptions-item>
              <template #label>日期</template>
              {{ (showData as updateClassroomRecordsType).date }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>时间段</template>
              {{ (showData as updateClassroomRecordsType).time }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>场地</template>
              {{ (showData as updateClassroomRecordsType).location }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>楼层</template>
              {{ (showData as updateClassroomRecordsType).floor }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>教室号</template>
              {{ (showData as updateClassroomRecordsType).classroomNumber }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>订单状态</template>
              {{ (showData as updateClassroomRecordsType).state == 'true' ? '预约成功' : (showData as
                updateClassroomRecordsType).reasonRefusal == '' ? '待审核' : '预约失败' }}
            </el-descriptions-item>
            <el-descriptions-item>
              <template #label>申请原因</template>
              {{ (showData as updateClassroomRecordsType).reason }}
            </el-descriptions-item>
            <el-descriptions-item v-if="(showData as updateClassroomRecordsType).reasonRefusal != ''">
              <template #label>拒绝原因</template>
              {{ (showData as updateClassroomRecordsType).reasonRefusal }}
            </el-descriptions-item>
          </template>
        </el-descriptions>
      </el-scrollbar>
      <template #footer>
        <span>
          <el-popconfirm width="220" confirm-button-text="确定" cancel-button-text="取消" title="确定删除吗?"
            @confirm="deleteOrder()">
            <template #reference>
              <el-button type="danger">删除</el-button>
            </template>
          </el-popconfirm>
          <el-button @click="drawer = false">返回</el-button>
        </span>
      </template>
    </el-drawer>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, Ref, ComputedRef, computed } from "vue";
import zhCn from "element-plus/lib/locale/lang/zh-cn";
import { deleteRecords, getRecords } from "../../../server";
import { ElMessage, ElScrollbar, ElTable, FormInstance } from "element-plus";
import type { getRecordsType, updateClassroomRecordsType, updateSeatRecordsType, updateSportsRecordsType, deleteRecordsType, paginationRecordsType } from "../../../types/records"
import { Aim } from '@element-plus/icons-vue'
import { accountStore } from "../../../store/accountStore";

const loading: Ref<boolean> = ref(false)
const locale = zhCn;
const drawer: Ref<boolean> = ref(false);
const result: Ref<updateClassroomRecordsType[] | updateSeatRecordsType[] | updateSportsRecordsType[]> = ref([])
const recordsRef: Ref<FormInstance | undefined> = ref()
const tableTop: Ref<typeof ElTable | undefined> = ref();
const topRef: Ref<typeof ElScrollbar | undefined> = ref();
const formFlag: Ref<string> = ref('')
const searchData: getRecordsType = reactive({
  account: accountStore().account,
  reservedType: ""
});
const showData: Ref<updateClassroomRecordsType | updateSeatRecordsType | updateSportsRecordsType | {}> = ref({})

const openDrawer = (item: any) => {
  drawer.value = true;
  showData.value = item
};

const closeDrawer = () => {
  drawer.value = false;
  if (topRef.value) {
    topRef.value.setScrollTop(0);
  }
};

const deleteOrder = async () => {
  try {
    const result: boolean = await deleteRecords({
      account: (showData.value as (updateClassroomRecordsType | updateSeatRecordsType | updateSportsRecordsType)).account,
      id: (showData.value as (updateClassroomRecordsType | updateSeatRecordsType | updateSportsRecordsType)).id,
      reservedType: formFlag.value
    })
    if (result) {
      drawer.value = false
      searchForm()
      ElMessage({
        message: '删除完成',
        type: 'success'
      })
    } else {
      ElMessage.error('未知错误,请稍后再试')
    }
  } catch (error) {
    ElMessage.error('未知错误,请稍后再试')
  }
}

const searchForm = async () => {
  try {
    loading.value = true
    if (searchData.reservedType == '') {
      searchData.reservedType = '预约教室记录'
    }
    await new Promise(resolve => setTimeout(resolve, 500));
    const data = await getRecords(searchData);
    loading.value = false
    formFlag.value = searchData.reservedType
    result.value = data;
  } catch (error) {
    ElMessage.error('未知错误，请稍后再试')
    console.log(error);
  }
}

const resetForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.resetFields()
}

const paginationData: paginationRecordsType = reactive({
  currentPage: 1,
  pageSize: 15
})

const CurrentChange = () => {
  if (tableTop.value) {
    tableTop.value.setScrollTop(0);
  }
}

const paginatedData: ComputedRef<updateClassroomRecordsType[] | updateSeatRecordsType[] | updateSportsRecordsType[]> = computed(() => {
  const startIndex = (paginationData.currentPage - 1) * paginationData.pageSize;
  const endIndex = startIndex + paginationData.pageSize;
  return result.value.slice(startIndex, endIndex);
});
</script>

<style lang="less" scoped>
.records {
  &-head {
    align-items: center;
    margin-bottom: -20px;
    display: flex;

    &-item {
      box-sizing: border-box;
      padding: 0px 20px;
      width: 40%;
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

    .el-select {
      width: var(--element-width-full);
    }
  }

  &-main {
    margin-top: 10px;
    overflow: auto;
    flex: 1;
    overflow: hidden;

    &-table {
      height: calc(100vh - 260px);

      :deep(.el-popper.is-dark) {
        color: var(--w-text-color) !important;
      }
    }

    &-pagination {
      margin-top: 20px;
      display: flex;
      justify-content: flex-end;
    }
  }

  &-drawer {
    box-sizing: border-box;
    padding: 0 10px;
  }
}
</style>
