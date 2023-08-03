<template>
  <div id="main" ref="chartContainer">

  </div>
</template>

<script setup lang='ts'>
import { ref, onMounted, onBeforeUnmount } from 'vue'
import * as echarts from 'echarts'
import elementResizeDetectorMaker from 'element-resize-detector'

const chartContainer = ref<HTMLDivElement | null>(null);
const erd = elementResizeDetectorMaker();
var myChart: echarts.ECharts | null = null;
var data = [
  {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }, {
    name: '手机',
    value: 100,
    msg: "手机,操场,屏幕左上角破损,12345678910"
  }
]

onMounted(() => {
  myChart = echarts.init(document.querySelector('#main') as HTMLElement);
  myChart.setOption({
    series: [{
      name: '全部物品',
      type: 'treemap',
      width: '100%',
      height: '100%',
      zoomToNodeRatio: 0.07,
      itemStyle: {
        borderRadius: 10,
        borderWidth: 5,
      },
      label: {
        fontSize: 20,
        color: "black"
      },
      data: data
    }]
  })
  myChart.on('click', (e: any) => {
    console.log(e);
  })
  erd.listenTo(chartContainer.value as HTMLElement, resizeChart);
})

onBeforeUnmount(() => {
  if (myChart) {
    myChart.dispose();
  }
  erd.removeListener(chartContainer.value as HTMLElement, resizeChart);
});

function resizeChart() {
  if (myChart) {
    myChart.resize();
  }
}
</script>

<style lang="less" scoped>
#main {
  width: 100%;
  height: 100%;
}
</style>