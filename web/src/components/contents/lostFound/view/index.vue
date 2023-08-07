<template>
  <div class="lostFound" ref="chartContainer">
    <div class="tableEmpty" v-if="emptyShow">
      <span class="tableEmptyIcon"></span>
      <span>暂无数据</span>
    </div>
  </div>
</template>

<script setup lang='ts'>
import { ref, onBeforeUnmount, Ref, watch } from 'vue'
import * as echarts from 'echarts'
import elementResizeDetectorMaker from 'element-resize-detector'
import type { getLostFoundType } from '../../../../types/lostFound'
import { getLostFound } from '../../../../server/index'
import { ElMessage } from 'element-plus';

const erd: elementResizeDetectorMaker.Erd = elementResizeDetectorMaker();
const chartContainer: Ref<HTMLDivElement | null> = ref(null);
var myChart: echarts.ECharts | null = null;
const chartData: Ref<getLostFoundType[]> = ref([])
const emptyShow: Ref<boolean> = ref(false)

watch(chartData, () => {
  myChart = echarts.init(document.querySelector('.lostFound') as HTMLElement);
  myChart.setOption({
    tooltip: {
      formatter: function (point: echarts.DefaultLabelFormatterCallbackParams) {
        if (point.dataIndex != 0) {
          var elementData = point.data as getLostFoundType
          var name = elementData.name
          var brand = elementData.brand
          var description = elementData.description
          var contact = elementData.contact
          var location = elementData.location
          return "<div>物品:  " + name +
            "</div><div>品牌:  " + brand +
            "</div><div>描述:  " + description +
            "</div><div>联系方式:  " + contact +
            "</div><div>拾取/遗失地点:  " + location + "</div>"
        }
      }
    },
    series: [{
      name: '全部物品',
      type: 'treemap',
      width: '100%',
      height: '100%',
      breadcrumb: {
        height: 26
      },
      zoomToNodeRatio: 0.07,
      squareRatio: 1,
      itemStyle: {
        borderRadius: 10,
        borderWidth: 15,
      },
      label: {
        fontSize: 20,
        color: "black"
      },
      data: chartData.value
    }]
  })
  erd.listenTo(chartContainer.value as HTMLElement, resizeChart);
})

onBeforeUnmount(() => {
  if (myChart) {
    myChart.dispose();
  }
  erd.removeListener(chartContainer.value as HTMLElement, resizeChart);
});

const resizeChart = () => {
  if (myChart) {
    myChart.resize();
  }
}

const getChartData = async () => {
  try {
    const lostFoundData: getLostFoundType[] = await getLostFound()
    if (lostFoundData.length != 0) {
      chartData.value = lostFoundData
    } else {
      emptyShow.value = true
      ElMessage.error('未知错误,请稍后再试')
    }
  } catch (error) {
    emptyShow.value = true
    ElMessage.error('未知错误,请稍后再试')
  }
}

getChartData()
</script>

<style lang="less" scoped>
.lostFound {
  width: 100%;
  height: 100%;
  position: relative;
}
</style>