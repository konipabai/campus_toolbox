<template>
  <div class="fault">
    <el-card shadow="hover" class="fault-post">
      <div class="fault-post-title">
        <img src="../../../assets/icon/sign.svg" class="fault-post-title-icon" />
        <div class="fault-post-title-text" v-if="!updateState && !orderState">发布故障报修</div>
        <div class="fault-post-title-text" v-else-if="updateState && !orderState">修改信息</div>
        <div class="fault-post-title-text" v-else>查看信息(已处理完不可更改)</div>
      </div>
      <el-divider />
      <div>
        <el-form ref="faultRef" :model="postData" label-width="100px" :rules="rules">
          <el-form-item label="物品" prop="item">
            <el-input v-model="postData.item" class="fault-post-item" placeholder="请输入物品名称 (1-15字)" maxlength="15" />
          </el-form-item>
          <el-form-item label="地点" prop="location">
            <el-input v-model="postData.location" class="fault-post-item" placeholder="请输入地点 (1-15字)" maxlength="15" />
          </el-form-item>
          <el-form-item label="房间号" prop="number">
            <el-input v-model="postData.number" class="fault-post-item" placeholder="请输入房间号 (1-15字)" maxlength="15" />
          </el-form-item>
          <el-form-item label="联系方式" prop="contact">
            <el-input v-model="postData.contact" class="fault-post-item" placeholder="请输入联系方式 (1-20字)" maxlength="20" />
          </el-form-item>
          <el-form-item label="描述" prop="description">
            <el-input v-model="postData.description" type="textarea" class="fault-post-item"
              placeholder="请描述问题详情 (0-100字)" :autosize="{ minRows: 7 }" maxlength="100" />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm(faultRef)" v-if="!orderState && !updateState">确认</el-button>
            <el-button type="primary" @click="submitForm(faultRef)" v-else-if="!orderState && updateState">更新</el-button>
            <el-button color="#FF9D9D" v-else disabled>更新</el-button>
            <el-button @click="resetForm(faultRef)" v-if="!updateState">重置</el-button>
            <template v-else>
              <el-button @click="returnForm()">返回</el-button>
              <el-popconfirm width="220" confirm-button-text="确定" cancel-button-text="取消" title="确定删除吗?"
                @confirm="deleteForm()">
                <template #reference>
                  <el-button type="danger">删除</el-button>
                </template>
              </el-popconfirm>
            </template>
          </el-form-item>
        </el-form>
      </div>
    </el-card>
    <el-card shadow="hover" class="fault-history">
      <div class="fault-history-title">
        <img src="../../../assets/icon/sign.svg" class="fault-history-title-icon" />
        <div class="fault-history-title-text">历史记录</div>
        <div class="fault-history-title-color">
          <div class="fault-history-title-color-item">
            <div class="fault-history-title-color-off"></div>
            <div>待处理</div>
          </div>
          <div class="fault-history-title-color-item">
            <div class="fault-history-title-color-on"></div>
            <div>已完成</div>
          </div>
        </div>
      </div>
      <el-divider />
      <el-table :data="paginatedData" class="fault-history-table" ref="tableTop" :flexible=true v-loading="loading"
        :tooltip-options="{ placement: 'left' }">
        <template #empty>
          <div class="tableEmpty">
            <span class="tableEmptyIcon"></span>
            <span>暂无数据</span>
          </div>
        </template>
        <el-table-column prop="date" label="日期" min-width="4" :show-overflow-tooltip=true />
        <el-table-column prop="item" label="物品" min-width="4" :show-overflow-tooltip=true />
        <el-table-column prop="location" label="地点" min-width="4" :show-overflow-tooltip=true />
        <el-table-column prop="number" label="房间号" min-width="4" :show-overflow-tooltip=true />
        <el-table-column prop="contact" label="联系方式" min-width="5" :show-overflow-tooltip=true />
        <el-table-column label="操作" min-width="3" :show-overflow-tooltip=true>
          <template #default="scope">
            <el-button type="primary" v-if="scope.row.state == 'false'" @click="update(scope.row)">修改</el-button>
            <el-button color="#76ae81" v-else @click="update(scope.row)">完成</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-config-provider :locale="locale">
        <el-pagination :model="paginationData" layout="prev, pager, next, jumper"
          v-model:page-size="paginationData.pageSize" :total="resultData.length" :pager-count="5" background small
          v-model:current-page="paginationData.currentPage" @current-change="CurrentChange"
          class="fault-history-pagination" />
      </el-config-provider>
    </el-card>
  </div>
</template>

<script setup lang='ts'>
import { ref, Ref, reactive, computed } from 'vue'
import { ElMessage, FormInstance, FormRules, ElTable } from 'element-plus'
import type { getFaultType, postFaultType } from '../../../types/fault'
import { deleteFault, getFault, postFault, updateFault } from '../../../server'
import zhCn from 'element-plus/lib/locale/lang/zh-cn'
import { accountStore } from "../../../store/accountStore";

const locale = zhCn
const faultRef: Ref<FormInstance | undefined> = ref()
const tableTop: Ref<typeof ElTable | undefined> = ref()
const resultData: Ref<getFaultType[]> = ref([])
const updateState: Ref<boolean> = ref(false)
const orderState: Ref<boolean> = ref(false)
const loading: Ref<boolean> = ref(false)
const postData: postFaultType = reactive({
  id: 0,
  account: accountStore().account,
  item: '',
  location: '',
  number: '',
  contact: '',
  description: '',
})

const initData = () => {
  updateState.value = false
  orderState.value = false
  postData.id = 0
}

const initTableData = () => {
  getFormData()
  CurrentChange()
  paginationData.currentPage = 1
}

const paginationData = reactive({
  currentPage: 1,
  pageSize: 15
})

const CurrentChange = () => {
  if (tableTop.value) {
    tableTop.value.setScrollTop(0);
  }
}

const resetForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.resetFields()
}

const returnForm = () => {
  initData()
  resetForm(faultRef.value)
}

const deleteForm = async () => {
  try {
    const result: boolean = await deleteFault({ id: postData.id, account: postData.account })
    if (result) {
      ElMessage({
        message: '删除完成',
        type: 'success'
      })
      initData()
      resetForm(faultRef.value)
      initTableData()
    } else {
      ElMessage.error('未知错误,请稍后再试')
    }
  } catch (error) {
    ElMessage.error('未知错误,请稍后再试')
  }
}

const paginatedData = computed(() => {
  const startIndex = (paginationData.currentPage - 1) * paginationData.pageSize;
  const endIndex = startIndex + paginationData.pageSize;
  return resultData.value.slice(startIndex, endIndex);
});

const submitForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate(async (valid: boolean) => {
    try {
      if (valid) {
        const result: Ref<boolean | undefined> = ref()
        if (!(orderState.value) && !(updateState.value)) {
          result.value = await postFault(postData)
        } else if (!(orderState.value) && updateState.value) {
          result.value = await updateFault(postData)
        }
        if (result.value == true) {
          ElMessage({
            message: !updateState.value ? '发布成功' : '更新成功',
            type: 'success'
          })
          initData()
          initTableData()
        } else {
          ElMessage.error('未知错误，请稍后再试')
        }
        resetForm(faultRef.value)
      }
    } catch (error) {
      ElMessage.error('未知错误，请稍后再试')
      console.log(error);
    }
  })
}

const rules: FormRules = reactive({
  item: [
    { required: true, message: '请输入物品名称', trigger: 'blur' }
  ],
  location: [
    { required: true, message: '请输入地点', trigger: 'blur' }
  ],
  number: [
    { required: true, message: '请输入房间号', trigger: 'blur' }
  ],
  contact: [
    { required: true, message: '请输入联系方式', trigger: 'blur' }
  ]
})

const getFormData = async () => {
  try {
    const faultData: getFaultType[] = await getFault({ account: postData.account })
    loading.value = true
    await new Promise(resolve => setTimeout(resolve, 500));
    loading.value = false
    resultData.value = faultData
  } catch (error) {
    ElMessage.error('未知错误,请稍后再试')
  }
}
getFormData()

const update = (row: getFaultType) => {
  resetForm(faultRef.value)
  updateState.value = true
  orderState.value = JSON.parse(row.state)
  postData.id = row.id
  postData.item = row.item
  postData.location = row.location
  postData.number = row.number
  postData.contact = row.contact
  postData.description = row.description
}
</script>

<style lang="less" scoped>
.fault {
  width: var(--element-width-full);
  height: var(--element-height-full);
  display: flex;

  &-post {
    width: 32%;
    height: var(--element-height-full);
    margin-right: 1.5%;

    &-title {
      display: flex;
      margin-bottom: -10px;
      align-items: center;

      &-icon {
        width: 27px;
        height: 27px;
        margin-right: 3px;
      }

      &-text {
        font-weight: bold;
        font-size: 20px !important;
      }
    }

    &:deep(.el-input__prefix) {
      display: none !important;
    }

    &:deep(.el-date-editor) {
      width: var(--element-width-full);
      margin-right: 5%;
    }

    &-item {
      width: var(--element-width-full);
      margin-right: 5%;

      &:deep(.el-textarea__inner) {
        &::-webkit-scrollbar {
          width: 6px;
          height: 6px;
        }

        &::-webkit-scrollbar-thumb {
          border-radius: 3px;
          background-color: rgba(195, 195, 195, 0.7);
        }

        &::-webkit-scrollbar-track {
          background-color: transparent;
        }
      }
    }
  }

  &-history {
    width: 68%;
    height: var(--element-height-full);
    overflow: auto;
    flex: 1;
    overflow: hidden;

    &-title {
      display: flex;
      margin-bottom: -10px;
      align-items: center;
      justify-content: flex-end;

      &-icon {
        width: 27px;
        height: 27px;
        margin-right: 3px;
      }

      &-text {
        font-weight: bold;
        font-size: 20px !important;
      }

      &-color {
        display: flex;
        margin-left: auto;

        &-item {
          display: flex;
          align-items: center;
          margin: 0 10px;
        }

        &-on {
          width: 15px;
          height: 15px;
          background-color: var(--switch-on-color);
          margin-right: 5px;
          border-radius: 15px;
        }

        &-off {
          width: 15px;
          height: 15px;
          background-color: var(--bg-color);
          margin-right: 5px;
          border-radius: 15px;
        }
      }
    }

    &-table {
      height: calc(100vh - 212px);
      margin-top: -22px;

      :deep(.el-popper.is-dark) {
        color: var(--w-text-color) !important;
      }
    }

    &-pagination {
      margin-top: 15px;
      display: flex;
      justify-content: flex-end;
    }
  }
}
</style>