<template>
  <div class="lostFound">
    <el-card shadow="hover" class="lostFound-post">
      <div class="lostFound-post-title">
        <img src="../../../../assets/icon/sign.svg" class="lostFound-post-title-icon" />
        <div class="lostFound-post-title-text">发布失物招领</div>
      </div>
      <el-divider />
      <div>
        <el-form ref="lostFoundRef" :model="postData" label-width="130px" :rules="rules">
          <el-form-item label="物品" prop="item">
            <el-input v-model="postData.item" class="lostFound-post-item" placeholder="请输入物品类型 (1-15字)" maxlength="15" />
          </el-form-item>
          <el-form-item label="状态" prop="state">
            <el-select v-model="postData.state" class="lostFound-post-item" placeholder="请选择物品状态">
              <el-option label="拾取" value="拾" />
              <el-option label="遗失" value="寻" />
            </el-select>
          </el-form-item>
          <el-form-item label="品牌" prop="brand">
            <el-input v-model="postData.brand" class="lostFound-post-item" placeholder="请输入物品品牌 (0-15字)" maxlength="15" />
          </el-form-item>
          <el-form-item label="联系方式" prop="contact">
            <el-input v-model="postData.contact" class="lostFound-post-item" placeholder="请输入联系方式 (1-20字)"
              maxlength="20" />
          </el-form-item>
          <el-form-item label="拾取/遗失时间" prop="time">
            <el-config-provider :locale="locale">
              <el-date-picker v-model="postData.time" class="lostFound-post-item" type="date" placeholder="请选择拾取/遗失时间" />
            </el-config-provider>
          </el-form-item>
          <el-form-item label="拾取/遗失地点" prop="location">
            <el-input v-model="postData.location" class="lostFound-post-item" placeholder="请输入地点 (1-20字)"
              maxlength="20" />
          </el-form-item>
          <el-form-item label="描述" prop="description">
            <el-input v-model="postData.description" type="textarea" class="lostFound-post-item"
              placeholder="请描述物品特征 (0-50字)" :autosize="{ minRows: 5 }" maxlength="50" />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm(lostFoundRef)">确认</el-button>
            <el-button @click="resetForm(lostFoundRef)">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-card>
    <el-card shadow="hover" class="lostFound-history">
      <div class="lostFound-history-title">
        <img src="../../../../assets/icon/sign.svg" class="lostFound-history-title-icon" />
        <div class="lostFound-history-title-text">历史记录</div>
      </div>
      <el-divider />
      <el-table :data="paginatedData" class="lostFound-history-table" ref="tableTop" :flexible=true>
        <template #empty>
          <div class="tableEmpty">
            <span class="tableEmptyIcon"></span>
            <span>暂无数据</span>
          </div>
        </template>
        <el-table-column prop="item" label="物品" min-width="5" />
        <el-table-column prop="state" label="状态" min-width="4" />
        <el-table-column prop="brand" label="品牌" min-width="7" />
        <el-table-column prop="time" label="时间" min-width="7" />
        <el-table-column prop="location" label="地点" min-width="6" />
        <el-table-column prop="description" label="描述" min-width="7" />
        <el-table-column label="操作" min-width="5">
          <template #default="scope">
            <el-button type="primary" @click="">修改</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-config-provider :locale="locale">
        <el-pagination :model="paginationData" layout="prev, pager, next, jumper"
          v-model:page-size="paginationData.pageSize" :total="resultData.length" :pager-count="5" background small
          v-model:current-page="paginationData.currentPage" @current-change="CurrentChange"
          class="lostFound-history-pagination" />
      </el-config-provider>
    </el-card>
  </div>
</template>

<script setup lang='ts'>
import { ref, Ref, reactive, computed } from 'vue'
import { ElMessage, FormInstance, FormRules, ElTable } from 'element-plus'
import type { getLostFoundType, postLostFoundType, getAccountLostFoundType } from '../../../../types/lostFound'
import { getLostFound, postLostFound } from '../../../../server'
import zhCn from 'element-plus/lib/locale/lang/zh-cn'

const locale = zhCn
const lostFoundRef: Ref<FormInstance | undefined> = ref()
const postData: postLostFoundType = reactive({
  account: '22215150514',
  name: '卡拉米',
  item: '',
  state: '',
  brand: '',
  contact: '',
  time: '',
  location: '',
  description: '',
})

const submitForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate(async (valid: boolean) => {
    try {
      if (valid) {
        const result = await postLostFound(postData)
        if (result == true) {
          ElMessage({
            message: '发布成功',
            type: 'success'
          })
          getFormData()
        } else {
          ElMessage.error('未知错误，请稍后再试')
        }
        formEl.resetFields()
      }
    } catch (error) {
      ElMessage.error('未知错误，请稍后再试')
      console.log(error);
    }
  })
}

const resetForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.resetFields()
}

const rules: FormRules = reactive({
  item: [
    { required: true, message: '请输入物品类型', trigger: 'blur' }
  ],
  state: [
    {
      required: true,
      message: '请选择物品状态',
      trigger: 'change',
    }
  ],
  time: [
    { required: true, message: '请选择拾取/遗失时间', trigger: 'blur' }
  ],
  contact: [
    { required: true, message: '请输入联系方式', trigger: 'blur' }
  ],
  location: [
    { required: true, message: '请输入地点', trigger: 'blur' }
  ]
})



const tableTop: Ref<typeof ElTable | undefined> = ref();
const resultData: Ref<getLostFoundType[]> = ref([])

const paginationData = reactive({
  currentPage: 1,
  pageSize: 15
})

const CurrentChange = () => {
  if (tableTop.value) {
    tableTop.value.setScrollTop(0);
  }
}

const paginatedData = computed(() => {
  const startIndex = (paginationData.currentPage - 1) * paginationData.pageSize;
  const endIndex = startIndex + paginationData.pageSize;
  return resultData.value.slice(startIndex, endIndex);
});

const getFormData = async () => {
  try {
    const lostFoundData: getLostFoundType[] = await getLostFound({ account: postData.account })
    if (lostFoundData.length != 0) {
      resultData.value = lostFoundData
    } else {
      ElMessage.error('未知错误,请稍后再试')
    }
  } catch (error) {
    ElMessage.error('未知错误,请稍后再试')
  }
}
getFormData()
</script>

<style lang="less" scoped>
.lostFound {
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
      width: 100%;
      margin-right: 30px
    }

    &-item {
      width: var(--element-width-full);
      margin-right: 30px;

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

    &-table {
      height: calc(100vh - 212px);
      margin-top: -22px;
    }

    &-pagination {
      margin-top: 15px;
      display: flex;
      justify-content: flex-end;
    }
  }
}
</style>