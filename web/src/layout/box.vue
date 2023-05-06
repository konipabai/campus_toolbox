<template>
    <div class="box">
      <el-container class="box-main">
        <el-aside width="230px">Aside</el-aside>
        <el-container>
          <el-header height="50px">Header</el-header>
          <el-main>Main</el-main>
        </el-container>
      </el-container>
    </div>
  </template>

<script setup lang='ts'>

</script>

<style scoped lang="less">
.box {
  height: 100%;
  &-main {
    height:100%
  }
}
</style>