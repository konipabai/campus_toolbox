<template>
  <div class="fault">
    <el-card shadow="hover" class="fault-main">
      <el-table :data="paginatedData" class="fault-main-table" ref="tableTop" v-loading="loading">
        <template #empty>
          <div class="tableEmpty">
            <span class="tableEmptyIcon"></span>
            <span>暂无数据</span>
          </div>
        </template>
        <el-table-column prop="date" label="申请日期" min-width="5" :show-overflow-tooltip=true />
        <el-table-column prop="location" label="地点" min-width="5" :show-overflow-tooltip=true />
        <el-table-column prop="number" label="房间号" min-width="3" :show-overflow-tooltip=true />
        <el-table-column prop="item" label="物品" min-width="3" :show-overflow-tooltip=true />
        <el-table-column prop="name" label="申请人" min-width="3" :show-overflow-tooltip=true />
        <el-table-column prop="class" label="申请人班级" min-width="5" :show-overflow-tooltip=true />
        <el-table-column prop="contact" label="联系方式" min-width="5" :show-overflow-tooltip=true />
        <el-table-column prop="description" label="问题描述" min-width="8" :show-overflow-tooltip=true />
        <el-table-column min-width="4" label="操作" :show-overflow-tooltip=true>
          <template #default="scope">
            <el-button type="primary" @click="updateForm(scope.row, 'true')">完成订单</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-config-provider :locale="locale">
        <el-pagination :model="paginationData" layout="prev, pager, next, jumper"
          v-model:page-size="paginationData.pageSize" :total="result.length" :pager-count="5" background small
          v-model:current-page="paginationData.currentPage" @current-change="CurrentChange"
          class="fault-main-pagination" />
      </el-config-provider>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, Ref, ComputedRef, computed } from "vue";
import zhCn from "element-plus/lib/locale/lang/zh-cn";
import { getOrder, updateOrder } from "../../../../server";
import { ElMessage, ElTable } from "element-plus";
import type { updateOrderFaultType, resultOrderFaultType, paginationOrderType } from "../../../../types/order"
import { accountStore } from "../../../../store/accountStore";

const loading: Ref<boolean> = ref(false)
const locale = zhCn;
const result: Ref<resultOrderFaultType[]> = ref([])
const tableTop: Ref<typeof ElTable | undefined> = ref();
const searchData: updateOrderFaultType = reactive({
  account: accountStore().account,
  id: 0,
  state: '',
  orderType: '报修'
});

const updateForm = async (item: any, state: string) => {
  try {
    let result: boolean = false
    searchData.id = item.id
    searchData.state = state
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
  } catch (error) {
    ElMessage.error('未知错误,请稍后再试')
  }
}

const searchForm = async () => {
  try {
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

const paginatedData: ComputedRef<resultOrderFaultType[]> = computed(() => {
  const startIndex = (paginationData.currentPage - 1) * paginationData.pageSize;
  const endIndex = startIndex + paginationData.pageSize;
  return result.value.slice(startIndex, endIndex);
});
</script>

<style lang="less" scoped>
.fault {
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
