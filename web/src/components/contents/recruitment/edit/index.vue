<template>
  <div class="recruitment" ref="innerRef">
    <el-scrollbar ref="bottomRef">
      <el-card shadow="hover" class="recruitment-card" body-style="width: 100%;height: 100%;box-sizing: border-box;">
        <el-form class="recruitment-card-main" :model="postData" label-width="100px" :inline="true" label-position="top"
          ref="recruitmentRef" :rules="rules">
          <el-form-item label="公司名" prop="name" class="recruitment-card-main-item">
            <el-input v-model="postData.name" placeholder="请输入公司名" size="large" />
          </el-form-item>
          <el-form-item label="职位" prop="job" class="recruitment-card-main-item">
            <el-input v-model="postData.job" placeholder="请输入职位" size="large" />
          </el-form-item>
          <el-form-item label="薪资(元/月)" prop="salary" class="recruitment-card-main-item">
            <el-input v-model="postData.salary" placeholder="请输入薪资(元/月)" size="large" type="number" min="0" />
          </el-form-item>
          <el-form-item label="工作地点" prop="location" class="recruitment-card-main-item">
            <el-input v-model="postData.location" placeholder="请输入工作地点" size="large" />
          </el-form-item>
          <el-form-item label="联系人" prop="hr" class="recruitment-card-main-item">
            <el-input v-model="postData.hr" placeholder="请输入联系人" size="large" />
          </el-form-item>
          <el-form-item label="联系方式" prop="contact" class="recruitment-card-main-item">
            <el-input v-model="postData.contact" placeholder="请输入联系方式 (1-20字)" size="large" maxlength="20" />
          </el-form-item>
          <el-form-item label="公司简介" prop="description" class="recruitment-card-main-textarea">
            <el-input v-model="postData.description" placeholder="请输入公司简介" :rows="3" type="textarea" />
          </el-form-item>
          <el-form-item label="公司福利" prop="benefits" class="recruitment-card-main-textarea">
            <el-input v-model="postData.benefits" placeholder="请输入公司福利" :rows="3" type="textarea" />
          </el-form-item>
          <el-form-item label="岗位要求" prop="requirements" class="recruitment-card-main-textarea">
            <template v-for="(item, index) in postData.requirements">
              <el-input v-model="postData.requirements[index]" class="recruitment-card-main-array" size="large"
                placeholder="请输入岗位要求">
                <template #prepend>{{ index + 1 }}</template>
              </el-input>
            </template>
          </el-form-item>
          <div class="recruitment-card-button">
            <div class="recruitment-card-button-left">
              <el-button type="primary" @click="addDomain" :disabled="postData.requirements.length > 8">增加要求</el-button>
              <el-button @click="delDomain" :disabled="postData.requirements.length < 2">删除要求</el-button>
            </div>
            <div class="recruitment-card-button-right">
              <el-button type="primary" @click="submitForm(recruitmentRef)">确认</el-button>
              <el-button @click="resetForm(recruitmentRef)">重置</el-button>
            </div>
          </div>
        </el-form>
      </el-card>
    </el-scrollbar>
  </div>
</template>

<script setup lang='ts'>
import { ref, reactive, Ref, nextTick } from 'vue'
import { findRecruitmentType } from '../../../../types/recruitment';
import { ElMessage, FormRules, type ElScrollbar, type FormInstance } from 'element-plus'
import { postRecruitment } from "../../../../server";

const bottomRef: Ref<typeof ElScrollbar | undefined> = ref();
const innerRef: Ref<HTMLElement | undefined> = ref<HTMLElement>();
const recruitmentRef: Ref<FormInstance | undefined> = ref()
const postData: findRecruitmentType = reactive({
  name: '',
  hr: '',
  job: '',
  description: '',
  salary: 0,
  requirements: [''],
  benefits: '',
  contact: '',
  location: ''
})
const rules: FormRules = reactive({
  name: [
    { required: true, message: '请输入公司名', trigger: 'blur' }
  ],
  job: [
    { required: true, message: '请输入职位', trigger: 'blur' }
  ],
  salary: [
    { required: true, message: '请输入薪资', trigger: 'blur' },
    { min: 1, message: '薪资不能为0', trigger: 'blur' },
  ],
  location: [
    { required: true, message: '请输入工作地点', trigger: 'blur' }
  ],
  hr: [
    { required: true, message: '请输入联系人', trigger: 'blur' }
  ],
  contact: [
    { required: true, message: '请输入联系方式', trigger: 'blur' }
  ]
})

const addDomain = async () => {
  postData.requirements.push('')
  await nextTick()
  const max = innerRef.value!.clientHeight
  bottomRef.value!.setScrollTop(max)
}

const delDomain = async () => {
  postData.requirements.pop()
  await nextTick()
  const max = innerRef.value!.clientHeight
  bottomRef.value!.setScrollTop(max)
}

const resetForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.resetFields()
}
const submitForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  if (postData.requirements.includes('')) {
    ElMessage({
      message: '请不要留空岗位要求',
      type: 'warning'
    })
  } else {
    formEl.validate(async (valid: boolean) => {
      try {
        if (valid) {
          const result: boolean = await postRecruitment(postData)
          if (result) {
            ElMessage({
              message: '发布成功',
              type: 'success'
            })
            resetForm(recruitmentRef.value)
          } else {
            ElMessage.error('未知错误,请稍后再试')
          }
        }
      }
      catch (error) {
        ElMessage.error('未知错误,请稍后再试')
        console.log(error);
      }
    })
  }
}
</script>

<style lang="less" scoped>
.recruitment {
  width: 100%;
  height: 100%;

  &-card {
    width: 100%;
    min-height: 90vh;
    height: auto;
    box-sizing: border-box;
    overflow: auto;

    &-main {
      width: 100%;
      height: 100%;

      &-item {
        width: 30%;
        margin: 20px;
      }

      &-textarea {
        width: 100%;
        margin: 20px;
      }

      &-array {
        width: 100%;
        margin: 10px 0;
      }
    }

    &-button {
      display: flex;
      margin: 0 20px;
      width: 100%;

      &-right {
        margin-left: auto;
      }
    }
  }
}
</style>