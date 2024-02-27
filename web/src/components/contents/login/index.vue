<template>
  <div class="login">
    <div class="login-left">
      <img src="../../../assets/image/left.png" draggable="false" class="login-left-img" />
      <img src="../../../assets/image/hi.gif" draggable="false" class="login-left-gif" />
      <div class="login-left-title">
        <img src="../../../assets/icon/logo.svg" class="login-left-title-svg" />
        <div class="login-left-title-text">校园百宝箱</div>
      </div>
    </div>
    <div class="login-right">
      <div class="login-right-card" v-loading="loading">
        <div class="login-right-card-title">登录</div>
        <el-form ref="loginRef" :model="postData" :rules="rules">
          <el-form-item prop="account" class="login-right-card-item">
            <el-input size="large" v-model="postData.account" placeholder="请输入账号" />
          </el-form-item>
          <el-form-item prop="password" class="login-right-card-item">
            <el-input size="large" type="password" v-model="postData.password" placeholder="请输入密码" />
          </el-form-item>
        </el-form>
        <el-button type="primary" @click="searchForm(loginRef)">登录</el-button>
        <el-button @click="resetForm(loginRef)">重置</el-button>
      </div>
    </div>
  </div>
</template>

<script setup lang='ts'>
import { ref, Ref, reactive } from 'vue'
import { FormRules, FormInstance, ElMessage } from 'element-plus'
import { getLoginType } from '../../../types/login'
import { getLogin } from '../../../server'
import router from '../../../router';
import { accountStore } from "../../../store/accountStore";
import axios from 'axios'

const loginRef: Ref<FormInstance | undefined> = ref()
const loading: Ref<boolean> = ref(false)
const postData: getLoginType = reactive({
  account: '',
  password: ''
})

const rules: FormRules = reactive({
  account: [
    { required: true, message: '请输入账号', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' }
  ]
})

const resetForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.resetFields()
}

const searchForm = async (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate(async (valid: boolean) => {
    try {
      if (valid) {
        loading.value = true
        await new Promise(resolve => setTimeout(resolve, 200));
        const data = await getLogin(postData);
        loading.value = false
        if (data.findUserData.account != '' && data.findUserData.name != '' && data.findUserData.class != '' && data.findUserData.administrator != '') {
          localStorage.setItem('userData', JSON.stringify(data.findUserData));
          localStorage.setItem('token', JSON.stringify(data.token));
          accountStore().resetState();
          axios.defaults.headers.common['token'] = JSON.parse(localStorage.getItem('token') || '{}')
          ElMessage({
            message: '欢迎你，' + data.findUserData.name,
            type: 'success'
          })
          router.push('/classroom')
          resetForm(loginRef.value)
        } else {
          ElMessage.error('账号或密码错误')
          postData.password = ''
        }
      }
    } catch (error) {
      ElMessage.error('未知错误，请稍后再试')
      console.log(error);
    }
  })
}
</script>

<style lang="less" scoped>
.login {
  width: var(--element-width-full);
  height: var(--element-height-full);
  background-image: url('../../../assets/image/loginBG.png');
  background-repeat: no-repeat;
  background-size: cover;
  display: flex;

  &-left {
    width: 50%;
    height: var(--element-height-full);
    display: flex;
    position: relative;

    &-img {
      position: absolute;
      width: var(--element-width-full);
      height: var(--element-height-full);
    }

    &-gif {
      width: 380px;
      height: 230px;
      position: absolute;
      left: 18%;
      bottom: 15%;
    }

    &-title {
      position: absolute;
      left: 24%;
      top: 28%;
      display: flex;
      align-items: center;

      &-svg {
        width: 50px;
        height: 50px;
        margin-right: 10px;
      }

      &-text {
        margin: 0 0 6px 10px;
        font-size: 45px !important;
        color: var(--w-text-color) !important;
      }
    }
  }

  &-right {
    width: 50%;
    height: var(--element-height-full);
    display: flex;

    &-card {
      width: 450px;
      height: 330px;
      margin: auto;
      text-align: center;
      box-sizing: border-box;
      padding: 20px 40px;
      border-radius: 20px;
      background-color: rgba(255, 255, 255, 0.656);
      box-shadow: 2px 2px 5px #a8a8a8;

      &-title {
        font-size: 30px !important;
        font-weight: bold;
        margin-bottom: 40px;
      }

      &-item {
        margin: 30px 0;
      }

      .el-button {
        margin-top: 20px;
        width: calc(50% - 6px);
      }
    }

  }
}
</style>