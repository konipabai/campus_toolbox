<template>
  <div class="lostFound" ref="chartContainer">
  </div>
</template>

<script setup lang='ts'>
import { ref, onMounted, onBeforeUnmount, Ref } from 'vue'
import * as echarts from 'echarts'
import elementResizeDetectorMaker from 'element-resize-detector'
import type { getLostFoundType } from '../../../../types/lostFound'

const erd: elementResizeDetectorMaker.Erd = elementResizeDetectorMaker();
const chartContainer: Ref<HTMLDivElement | null> = ref(null);
var myChart: echarts.ECharts | null = null;
const data: getLostFoundType[] = [
  {
    name: '(拾)手机',
    value: 100,
    brand: "华为",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(寻)手表',
    value: 100,
    brand: "小米",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(寻)电脑',
    value: 100,
    brand: "华硕",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(拾)ipad',
    value: 100,
    brand: "苹果",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(拾)手机',
    value: 100,
    brand: "红米",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(寻)书包',
    value: 100,
    brand: "无/暂不清楚",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(寻)水杯',
    value: 100,
    brand: "无/暂不清楚",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(拾)耳机',
    value: 100,
    brand: "apple",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(拾)鼠标',
    value: 100,
    brand: "罗技",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(寻)充电宝',
    value: 100,
    brand: "紫米",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(拾)包包',
    value: 100,
    brand: "无/暂不清楚",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(寻)高等数学',
    value: 100,
    brand: "人民出版社",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(拾)眼镜',
    value: 100,
    brand: "无/暂不清楚",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(拾)学生证',
    value: 100,
    brand: "无/暂不清楚",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(拾)USB充电线',
    value: 100,
    brand: "无/暂不清楚",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(寻)身份证',
    value: 100,
    brand: "无/暂不清楚",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(寻)头戴式耳机',
    value: 100,
    brand: "铁三角",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(拾)无线键盘',
    value: 100,
    brand: "无/暂不清楚",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(拾)充电头',
    value: 100,
    brand: "无/暂不清楚",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(拾)钥匙',
    value: 100,
    brand: "无/暂不清楚",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }, {
    name: '(拾)书包',
    value: 100,
    brand: "无/暂不清楚",
    location: "操场",
    description: "屏幕左上角破损",
    contact: "12345678910"
  }
]

onMounted(() => {
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
.lostFound {
  width: 100%;
  height: 100%;
}
</style>