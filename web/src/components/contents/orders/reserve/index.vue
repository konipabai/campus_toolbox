<template>
  <div class="reserve">
    <el-card shadow="hover" class="reserve-main">
      <el-table :data="paginatedData" class="reserve-main-table" ref="tableTop" v-loading="loading">
        <template #empty>
          <div class="tableEmpty">
            <span class="tableEmptyIcon"></span>
            <span>暂无数据</span>
          </div>
        </template>
        <el-table-column prop="date" label="日期" min-width="4" :show-overflow-tooltip=true />
        <el-table-column prop="time" label="时间段" min-width="7" :show-overflow-tooltip=true />
        <el-table-column prop="location" label="地点" min-width="5" :show-overflow-tooltip=true />
        <el-table-column prop="floor" label="楼层" min-width="3" :show-overflow-tooltip=true />
        <el-table-column prop="classroomNumber" label="教室号" min-width="3" :show-overflow-tooltip=true />
        <el-table-column prop="name" label="申请人" min-width="3" :show-overflow-tooltip=true />
        <el-table-column prop="class" label="申请人班级" min-width="6" :show-overflow-tooltip=true />
        <el-table-column prop="reason" label="申请理由" min-width="8" :show-overflow-tooltip=true />
        <el-table-column min-width="6" label="操作" :show-overflow-tooltip=true>
          <template #default="scope">
            <el-button type="primary" @click="updateForm(scope.row, 'true')">通过</el-button>
            <el-button type="primary" @click="openDialog(scope.row)">驳回</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-config-provider :locale="locale">
        <el-pagination :model="paginationData" layout="prev, pager, next, jumper"
          v-model:page-size="paginationData.pageSize" :total="result.length" :pager-count="5" background small
          v-model:current-page="paginationData.currentPage" @current-change="CurrentChange"
          class="reserve-main-pagination" />
      </el-config-provider>
    </el-card>
    <el-dialog v-model="dialogVisible" title="填写驳回原因" width="400px" draggable center>
      <el-input v-model="searchData.reasonRefusal" :rows="8" type="textarea" resize="none" />
      <template #footer>
        <span>
          <el-button type="primary" @click="updateForm(searchData, 'false')">
            确认
          </el-button>
          <el-button @click="dialogVisible = false">取消</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, Ref, ComputedRef, computed } from "vue";
import zhCn from "element-plus/lib/locale/lang/zh-cn";
import { getOrder, updateOrder } from "../../../../server";
import { ElMessage, ElTable } from "element-plus";
import type { updateOrderClassroomType, resultOrderClassroomType, paginationOrderType } from "../../../../types/order"
import { accountStore } from "../../../../store/accountStore";

const loading: Ref<boolean> = ref(false)
const locale = zhCn;
const result: Ref<resultOrderClassroomType[]> = ref([])
const tableTop: Ref<typeof ElTable | undefined> = ref();
const dialogVisible: Ref<boolean> = ref(false)
const searchData: updateOrderClassroomType = reactive({
  account: accountStore().account,
  id: 0,
  state: '',
  reasonRefusal: '',
  orderType: '预约'
});

const openDialog = (item: any) => {
  dialogVisible.value = true
  searchData.id = item.id
  searchData.state = 'false'
}

const updateForm = async (item: any, state: string) => {
  try {
    let result: boolean = false
    if (state == 'true') {
      searchData.id = item.id
      searchData.state = state
      searchData.reasonRefusal = ''
      result = await updateOrder(searchData)
      if (result) {
        searchForm()
        ElMessage({
          message: '审批完成',
          type: 'success'
        })
      } else {
        ElMessage.error('未知错误,请稍后再试')
      }
    } else {
      if (item.reasonRefusal == '') {
        ElMessage({
          message: '请输入驳回理由',
          type: 'warning'
        })
      } else {
        result = await updateOrder(item)
        if (result) {
          searchForm()
          ElMessage({
            message: '审批完成',
            type: 'success'
          })
        } else {
          ElMessage.error('未知错误,请稍后再试')
        }
      }
    }

  } catch (error) {
    ElMessage.error('未知错误,请稍后再试')
  }
}

const searchForm = async () => {
  try {
    dialogVisible.value = false
    loading.value = true
    await new Promise(resolve => setTimeout(resolve, 100));
    const data = await getOrder({ account: searchData.account, orderType: searchData.orderType });
    loading.value = false
    result.value = data;
  } catch (error) {
    ElMessage.error('未知错误，请稍后再试')
    console.log(error);
  }
}
searchForm()

const paginationData: paginationOrderType = reactive({
  currentPage: 1,
  pageSize: 15
})

const CurrentChange = () => {
  if (tableTop.value) {
    tableTop.value.setScrollTop(0);
  }
}

const paginatedData: ComputedRef<resultOrderClassroomType[]> = computed(() => {
  const startIndex = (paginationData.currentPage - 1) * paginationData.pageSize;
  const endIndex = startIndex + paginationData.pageSize;
  return result.value.slice(startIndex, endIndex);
});
</script>

<style lang="less" scoped>
.reserve {
  &-main {
    &-table {
      height: calc(100vh - 180px);

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
}
</style>
