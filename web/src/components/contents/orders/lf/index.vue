<template>
  <div class="lf">
    <el-card shadow="hover" class="lf-main">
      <el-table :data="paginatedData" class="lf-main-table" ref="tableTop" v-loading="loading">
        <template #empty>
          <div class="tableEmpty">
            <span class="tableEmptyIcon"></span>
            <span>暂无数据</span>
          </div>
        </template>
        <el-table-column prop="date" label="申请日期" min-width="10" :show-overflow-tooltip=true />
        <el-table-column prop="location" label="地点" min-width="10" :show-overflow-tooltip=true />
        <el-table-column prop="state" label="状态" min-width="5" :show-overflow-tooltip=true />
        <el-table-column prop="item" label="物品" min-width="8" :show-overflow-tooltip=true />
        <el-table-column prop="brand" label="品牌" min-width="8" :show-overflow-tooltip=true />
        <el-table-column prop="name" label="发起人" min-width="8" :show-overflow-tooltip=true />
        <el-table-column prop="class" label="发起人班级" min-width="14" :show-overflow-tooltip=true />
        <el-table-column prop="contact" label="联系方式" min-width="14" :show-overflow-tooltip=true />
        <el-table-column label="公开" min-width="6" :show-overflow-tooltip=true>
          <template #default="props">
            {{ props.row.switch == 'on' ? '公开' : '隐藏' }}
          </template>
        </el-table-column>
        <el-table-column prop="description" label="描述" min-width="16" :show-overflow-tooltip=true />
        <el-table-column min-width="11" label="操作" :show-overflow-tooltip=true>
          <template #default="scope">
            <el-button type="primary" @click="updateForm(scope.row, 'true')">令其过期</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-config-provider :locale="locale">
        <el-pagination :model="paginationData" layout="prev, pager, next, jumper"
          v-model:page-size="paginationData.pageSize" :total="result.length" :pager-count="5" background small
          v-model:current-page="paginationData.currentPage" @current-change="CurrentChange" class="lf-main-pagination" />
      </el-config-provider>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, Ref, ComputedRef, computed } from "vue";
import zhCn from "element-plus/lib/locale/lang/zh-cn";
import { getOrder, updateOrder } from "../../../../server";
import { ElMessage, ElTable } from "element-plus";
import type { updateOrderLFType, resultOrderLFType, paginationOrderType } from "../../../../types/order"
import { accountStore } from "../../../../store/accountStore";

const loading: Ref<boolean> = ref(false)
const locale = zhCn;
const result: Ref<resultOrderLFType[]> = ref([])
const tableTop: Ref<typeof ElTable | undefined> = ref();
const searchData: updateOrderLFType = reactive({
  account: accountStore().account,
  id: 0,
  overdue: '',
  orderType: '失物招领'
});

const updateForm = async (item: any, overdue: string) => {
  try {
    let result: boolean = false
    searchData.id = item.id
    searchData.overdue = overdue
    result = await updateOrder(searchData)
    if (result) {
      searchForm()
      ElMessage({
        message: '操作成功',
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

const paginatedData: ComputedRef<resultOrderLFType[]> = computed(() => {
  const startIndex = (paginationData.currentPage - 1) * paginationData.pageSize;
  const endIndex = startIndex + paginationData.pageSize;
  return result.value.slice(startIndex, endIndex);
});
</script>

<style lang="less" scoped>
.lf {
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
