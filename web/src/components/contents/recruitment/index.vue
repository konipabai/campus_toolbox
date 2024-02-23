<template>
  <div class="recruitment">
    <el-card shadow="hover">
      <el-form :inline="true" :model="searchData" ref="recruitmentRef" class="recruitment-head">
        <el-form-item label="职位" prop="job" class="recruitment-head-job">
          <el-input v-model="searchData.job" placeholder="请输入职位名称" />
        </el-form-item>
        <el-form-item label="薪资范围" prop="range" class="recruitment-head-range">
          <el-input-number v-model="searchData.bottom" :min="0" :step="100" controls-position="right" @change="" />
          &nbsp; - &nbsp;
          <el-input-number v-model="searchData.top" :min="0" :step="100" controls-position="right" @change="" />
        </el-form-item>
        <el-form-item class="recruitment-head-button">
          <el-button type="primary" @click="searchForm()">查询</el-button>
          <el-button @click="resetForm(recruitmentRef)">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>
    <el-card shadow="hover" class="recruitment-main">
      <el-table :data="paginatedData" class="recruitment-main-table" ref="tableTop" v-loading="loading">
        <template #empty>
          <div class="tableEmpty">
            <span class="tableEmptyIcon"></span>
            <span>暂无数据</span>
          </div>
        </template>
        <el-table-column prop="name" label="公司名" min-width="3" :show-overflow-tooltip=true />
        <el-table-column prop="job" label="职位" min-width="2" :show-overflow-tooltip=true />
        <el-table-column prop="salary" label="薪资" min-width="1" :show-overflow-tooltip=true />
        <el-table-column prop="location" label="工作地点" min-width="5" :show-overflow-tooltip=true />
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
          class="recruitment-main-pagination" />
      </el-config-provider>
    </el-card>
    <el-drawer v-model="drawer" title="岗位信息" @close="closeDrawer()">
      <el-scrollbar ref="topRef">
        <el-descriptions :column="1" border direction="vertical" class="recruitment-drawer">
          <el-descriptions-item>
            <template #label>公司名</template>
            {{ showData.name }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>公司简介</template>
            {{ showData.description }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>职位</template>
            {{ showData.job }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>薪资</template>
            {{ showData.salary }}元/月
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>工作地点</template>
            {{ showData.location }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>联系方式</template>
            <el-tag>{{ showData.hr }}</el-tag> {{ showData.contact }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>岗位要求</template>
            <div v-for="(item, index) in showData.requirements">
              {{ index + 1 }}: {{ item }}
            </div>
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>公司福利</template>
            {{ showData.benefits }}
          </el-descriptions-item>
        </el-descriptions>
      </el-scrollbar>
    </el-drawer>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, Ref, ComputedRef, computed } from "vue";
import zhCn from "element-plus/lib/locale/lang/zh-cn";
import { getRecruitment } from "../../../server";
import { ElMessage, ElScrollbar, ElTable, FormInstance } from "element-plus";
import type { findRecruitmentType, getRecruitmentType, paginationRecruitmentType } from "../../../types/recruitment"

const loading: Ref<boolean> = ref(false)
const locale = zhCn;
const drawer: Ref<boolean> = ref(false);
const result: Ref<findRecruitmentType[]> = ref([])
const recruitmentRef: Ref<FormInstance | undefined> = ref()
const tableTop: Ref<typeof ElTable | undefined> = ref();
const topRef: Ref<typeof ElScrollbar | undefined> = ref();
const searchData: getRecruitmentType = reactive({
  job: "",
  bottom: 0,
  top: 0
});
const showData: Ref<findRecruitmentType> = ref({
  name: '',
  hr: '',
  job: '',
  description: '',
  salary: 0,
  requirements: [],
  benefits: '',
  contact: '',
  location: ''
})

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

const searchForm = async () => {
  try {
    loading.value = true
    await new Promise(resolve => setTimeout(resolve, 500));
    const data = await getRecruitment(searchData);
    loading.value = false
    if (data.length != 0) {
      result.value = data;
    } else {
      ElMessage({
        message: '未找到对应数据，请选择其他职位或薪资范围',
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
  searchData.bottom = 0
  searchData.top = 0
}

const paginationData: paginationRecruitmentType = reactive({
  currentPage: 1,
  pageSize: 15
})

const CurrentChange = () => {
  if (tableTop.value) {
    tableTop.value.setScrollTop(0);
  }
}

const paginatedData: ComputedRef<findRecruitmentType[]> = computed(() => {
  const startIndex = (paginationData.currentPage - 1) * paginationData.pageSize;
  const endIndex = startIndex + paginationData.pageSize;
  return result.value.slice(startIndex, endIndex);
});
</script>

<style lang="less" scoped>
.recruitment {
  &-head {
    align-items: center;
    margin-bottom: -20px;
    display: flex;

    &-job {
      box-sizing: border-box;
      padding: 0px 30px;
      width: 30%;
      margin-left: auto;
      margin-right: auto;
    }

    &-range {
      box-sizing: border-box;
      padding: 0px 30px;
      width: 40%;
      margin-left: auto;
      margin-right: auto;

      :deep(.el-input-number) {
        width: 40%;
      }
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
