<template>
  <div class="sports">
    <div ref="canvaRef" class="sports-canvas"></div>
    <div class="sports-form" v-loading="loading">
      <el-form :model="searchData" label-width="80px" ref="sportsRef">
        <el-form-item label="场地类型" prop="type" class="sports-form-search">
          <el-select v-model="searchData.type" placeholder="请选择类型" @change="select">
            <template #prefix>
              <el-icon>
                <Place />
              </el-icon>
            </template>
            <el-option v-for="(item, index) in typeData" :key="index" :value="item" />
          </el-select>
        </el-form-item>
        <el-form-item label="日期" prop="date" class="sports-form-search">
          <el-config-provider :locale="locale">
            <el-date-picker v-model="searchData.date" type="date" placeholder="请选择日期" :clearable="false" />
          </el-config-provider>
        </el-form-item>
        <el-form-item label="时间范围" prop="time" class="sports-form-search">
          <el-config-provider :locale="locale">
            <el-time-picker v-model="searchData.time" is-range range-separator="—" start-placeholder="开始时间"
              end-placeholder="结束时间" format="HH:mm" :clearable="false" />
          </el-config-provider>
        </el-form-item>
        <el-form-item class="sports-form-button">
          <el-button type="primary" @click="searchForm()">查询</el-button>
          <el-button @click="resetForm(sportsRef)">重置</el-button>
        </el-form-item>
      </el-form>
      <el-divider />
      <el-scrollbar ref="topRef">
        <div class="sports-form-show">
          <div v-for="item in result" class="sports-form-show-div" @click="changeDialog(item)">{{ item.sportsType +
            item.sportsCourt }}</div>
        </div>
      </el-scrollbar>
    </div>
    <el-dialog v-model="dialogVisible" title="预约" width="480px" draggable center>
      <el-form label-width="85px" :model="reserveData">
        <el-form-item label="预约场地">
          <el-input v-model="reserveData.typeAndCourt" disabled />
        </el-form-item>
        <el-form-item label="时间日期">
          <el-input v-model="reserveData.dateAndTime" disabled />
        </el-form-item>
        <el-form-item label="已被预约">
          <el-scrollbar max-height="105px">
            <el-button v-if="reserveData.reserveOrder.length == 0">暂无预定</el-button>
            <el-button v-else v-for="(item, index) in reserveData.reserveOrder" :key="index"
              :class="reserveData.reserveOrder.length == 1 ? '' : 'sports-dialog-button'">{{ item[0] + ' ' + item[1][0] +
                '-' + item[1][1] + ' ' + item[2] + '人' }}</el-button>
          </el-scrollbar>
        </el-form-item>
        <el-form-item label="选择时间">
          <el-config-provider :locale="locale">
            <el-time-picker v-model="reserveData.reserveTime" is-range range-separator="—" start-placeholder="开始时间"
              end-placeholder="结束时间" format="HH:mm" :clearable="false" :disabled-hours="disabledHours" />
          </el-config-provider>
        </el-form-item>
        <el-form-item label="半场/全场">
          <el-select v-model="reserveData.location" placeholder="请选择半场/全场" clearable>
            <el-option v-for="(item, index) in ['全场', 'a半场', 'b半场']" :key="index" :value="item" />
          </el-select>
        </el-form-item>
        <el-form-item label="允许加入">
          <el-select v-model="reserveData.collaborative" placeholder="是否允许陌生人加入" clearable>
            <el-option v-for="(item, index) in ['是', '否']" :key="index" :value="item" />
          </el-select>
        </el-form-item>
        <el-form-item label="当前人数" v-if="reserveData.collaborative == '是'">
          <el-slider v-model="reserveData.number" :min="1" :max="10" :step="1" show-stops show-input placement="bottom" />
        </el-form-item>
      </el-form>
      <template #footer>
        <span>
          <el-button type="primary" @click="submitForm">
            确认
          </el-button>
          <el-button @click="dialogVisible = false">取消</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, Ref, watch, reactive } from "vue"
import * as THREE from "three"
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls.js"
import { GLTFLoader } from "three/examples/jsm/loaders/GLTFLoader.js"
import { DRACOLoader } from "three/examples/jsm/loaders/DRACOLoader.js"
import { RGBELoader } from "three/examples/jsm/loaders/RGBELoader.js"
import gsap from 'gsap'

import zhCn from "element-plus/lib/locale/lang/zh-cn";
import { Place } from "@element-plus/icons-vue";
import { reserveSportsType, getSportsType, resultSportsType } from "../../../types/sports"

import { getSports } from "../../../server"
import moment from "moment";
import { ElMessage, ElScrollbar, FormInstance } from "element-plus"

const canvaRef = ref() as Ref<HTMLElement>
const sportsRef: Ref<FormInstance | undefined> = ref()
const topRef: Ref<typeof ElScrollbar | undefined> = ref();

const scene: THREE.Scene = new THREE.Scene()
const gltfLoader: GLTFLoader = new GLTFLoader()
const dracoLoader: DRACOLoader = new DRACOLoader()
let model: THREE.Group<THREE.Object3DEventMap>
dracoLoader.setDecoderPath("/src/assets/draco")
gltfLoader.setDRACOLoader(dracoLoader)
gltfLoader.load("/src/assets/model/basketballCourt/scene.gltf", (gltf) => {
  model = gltf.scene
  model.scale.set(0.6, 0.6, 0.6)
  model.position.set(45, 2.3, 0)
  model.rotation.y = Math.PI / 2
  model.rotateX(-Math.PI / 6)
  scene.add(model)
});
gltfLoader.load("/src/assets/model/tennisCourt/scene.gltf", (gltf) => {
  model = gltf.scene
  model.scale.set(2, 2, 2)
  model.position.set(0, 5, 45)
  model.rotation.y = Math.PI / 2
  model.rotateZ(-Math.PI / 6)
  scene.add(model)
});
gltfLoader.load("/src/assets/model/pingpongTable/scene.gltf", (gltf) => {
  model = gltf.scene
  model.scale.set(5, 5, 5)
  model.position.set(-45, 5, 0)
  model.rotateZ(-Math.PI / 6)
  scene.add(model)
});
gltfLoader.load("/src/assets/model/footballCourt/scene.gltf", (gltf) => {
  model = gltf.scene
  model.scale.set(0.8, 0.8, 0.8)
  model.position.set(0, 5, -45)
  model.rotateX(Math.PI / 6)
  scene.add(model)
});

const rgbeLoader: RGBELoader = new RGBELoader()
rgbeLoader.load('/src/assets/hdr/highDynamicRange.hdr', (envMap) => {
  envMap.mapping = THREE.EquirectangularReflectionMapping
  scene.environment = envMap
})

scene.background = new THREE.CubeTextureLoader().load([
  '/src/assets/image/bgR.jpg',
  '/src/assets/image/bgL.jpg',
  '/src/assets/image/bgU.jpg',
  '/src/assets/image/bgD.jpg',
  '/src/assets/image/bgF.jpg',
  '/src/assets/image/bgB.jpg',
]);

const renderer: THREE.WebGLRenderer = new THREE.WebGLRenderer()

let camera: THREE.PerspectiveCamera
let controls: OrbitControls
let target: THREE.Vector3

const animate = () => {
  renderer.render(scene, camera)
  controls.update();
  requestAnimationFrame(animate)
};

onMounted(() => {
  camera = new THREE.PerspectiveCamera(45, canvaRef.value.clientWidth / canvaRef.value.clientHeight, 0.1, 1000)
  camera.position.set(0, 10, -10)
  camera.filmOffset = 10

  canvaRef.value.appendChild(renderer.domElement)
  renderer.setSize(canvaRef.value.clientWidth, canvaRef.value.clientHeight)

  controls = new OrbitControls(camera, renderer.domElement)
  target = new THREE.Vector3(0, 5, -45)
  controls.target = target
  controls.enablePan = false;
  controls.maxAzimuthAngle = Math.PI / 4
  controls.minAzimuthAngle = -Math.PI / 4
  controls.maxPolarAngle = Math.PI / 2
  controls.minPolarAngle = Math.PI / 6
  controls.maxDistance = 38
  controls.minDistance = 15
  controls.enableDamping = true
  controls.dampingFactor = 0.02

  animate();
});

watch(canvaRef, () => {
  resizeObserver.observe(canvaRef.value)
});

let resizeTimeout: number = 0
const resizeObserver: ResizeObserver = new ResizeObserver((entries) => {
  if (entries[0].target === canvaRef.value) {
    if (resizeTimeout) {
      cancelAnimationFrame(resizeTimeout)
    }
    resizeTimeout = requestAnimationFrame(() => {
      renderer.setSize(canvaRef.value.clientWidth, canvaRef.value.clientHeight)
      camera.updateProjectionMatrix()
      renderer.render(scene, camera)
    });
  }
});


const locale = zhCn;

const tweenCamera: gsap.core.Timeline = gsap.timeline()
const tweenView: gsap.core.Timeline = gsap.timeline()
const viewTo = (position: any, target: any, max: number, min: number) => {
  tweenCamera.to(camera.position, {
    x: position.x,
    y: position.y,
    z: position.z,
    duration: 1,
    ease: 'power2.inOut',
    onComplete: () => {
      controls.maxAzimuthAngle = max
      controls.minAzimuthAngle = min
    }
  })
  tweenView.to(controls.target, {
    x: target.x,
    y: target.y,
    z: target.z,
    duration: 1,
    ease: 'power2.inOut'
  })
}
const select = (v: string) => {
  controls.maxAzimuthAngle = Infinity
  controls.minAzimuthAngle = -Infinity
  if (v === '足球场') {
    viewTo(new THREE.Vector3(0, 10, -10), new THREE.Vector3(0, 5, -45), Math.PI / 4, -Math.PI / 4)
  } else if (v === '篮球场') {
    viewTo(new THREE.Vector3(18, 10, 0), new THREE.Vector3(45, 2.3, 0), -Math.PI / 4, -Math.PI / 4 * 3)
  } else if (v === '网球场') {
    viewTo(new THREE.Vector3(0, 10, 18), new THREE.Vector3(0, 5, 45), -Math.PI / 4 * 3, Math.PI / 4 * 3)
  } else {
    viewTo(new THREE.Vector3(-18, 10, 0), new THREE.Vector3(-45, 5, 0), Math.PI / 4 * 3, Math.PI / 4)
  }
}

const searchData: getSportsType = reactive({
  type: "足球场",
  date: new Date(),
  time: [new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 0, 0, 0, 0), new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 23, 59, 59, 999)]
})
const typeData: string[] = ["足球场", "篮球场", "网球场", "乒乓球场"];
const dialogVisible: Ref<boolean> = ref(false)
const loading: Ref<boolean> = ref(false)
const result: Ref<resultSportsType[]> = ref([])
const reserveData: reserveSportsType = reactive({
  typeAndCourt: "",
  dateAndTime: "",
  reserveOrder: [],
  reserveTime: [new Date(), new Date()],
  location: "",
  collaborative: "否",
  number: 1
})
const makeRange = (start: number, end: number) => {
  const result: number[] = []
  for (let i = start; i <= end; i++) {
    result.push(i)
  }
  return result
}
var disabledHours = () => {
  return makeRange(0, new Date(searchData.time[0]).getHours() - 1).concat(makeRange(new Date(searchData.time[1]).getHours() + 1, 23))
}
const changeDialog = (item: resultSportsType) => {
  dialogVisible.value = true
  reserveData.typeAndCourt = item.sportsType + item.sportsCourt
  reserveData.dateAndTime = item.date + "   " + moment(item.reserveTime[0]).format('HH:mm') + " - " + moment(item.reserveTime[1]).format('HH:mm')
  reserveData.reserveOrder = item.location.map((loc, index) => [loc, item.time[index].map(date => moment(date).format('HH:mm')), item.number[index]])
  reserveData.reserveTime = item.reserveTime
  disabledHours = () => {
    return makeRange(0, new Date(searchData.time[0]).getHours() - 1).concat(makeRange(new Date(searchData.time[1]).getHours() + 1, 23))
  }
}
const searchForm = async () => {
  try {
    if (searchData.date) {
      searchData.date = moment(searchData.date).format("YYYY-MM-DD")
    } else {
      searchData.date = moment().format('YYYY-MM-DD');
    }
    loading.value = true
    await new Promise(resolve => setTimeout(resolve, 500));
    const tempDate = new Date(searchData.date)
    const time0Hours = new Date(searchData.time[0]).getHours()
    const time0Minutes = new Date(searchData.time[0]).getMinutes()
    const time1Hours = new Date(searchData.time[1]).getHours()
    const time1Minutes = new Date(searchData.time[1]).getMinutes()
    searchData.time[0] = new Date(new Date(tempDate.setHours(time0Hours)).setMinutes(time0Minutes)).toISOString();
    searchData.time[1] = new Date(new Date(tempDate.setHours(time1Hours)).setMinutes(time1Minutes)).toISOString();
    if (topRef.value) {
      topRef.value.setScrollTop(0);
    }
    const data: resultSportsType[] = await getSports(searchData);
    loading.value = false
    if (data.length != 0) {
      result.value = data;
    } else {
      ElMessage({
        message: '未找到对应数据，请选择其他时间或日期',
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
  controls.maxAzimuthAngle = Infinity
  controls.minAzimuthAngle = -Infinity
  viewTo(new THREE.Vector3(0, 10, -10), new THREE.Vector3(0, 5, -45), Math.PI / 4, -Math.PI / 4)
  searchData.type = "足球场"
  searchForm()
}
const submitForm = async () => {
  console.log(reserveData, 1111);
}
</script>

<style lang="less" scoped>
.sports {
  width: 100%;
  height: 100%;
  position: relative;

  &-canvas {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
  }

  &-form {
    width: 35%;
    height: 96%;
    position: absolute;
    top: 50%;
    right: 0;
    transform: translate(-12px, -50%);
    z-index: 99;
    background-color: rgba(43, 87, 154, 0.7);
    box-sizing: border-box;
    padding: 30px 10px 10px 10px;
    border-radius: 10px;
    display: flex;
    flex-direction: column;

    .el-select,
    :deep(.el-date-editor.el-date-editor--date) {
      width: 100%;
    }

    &-search {
      width: 90%;
      margin-left: auto;
      margin-right: auto;

      :deep(.el-form-item__label) {
        color: #ebebeb !important;
      }
    }

    &-button {
      margin-bottom: -5px;
      margin-right: 24px;
      float: right;
    }

    &-show {
      display: flex;
      flex-wrap: wrap;
      flex: 1;
      overflow: auto;

      &-div {
        width: 42%;
        height: 80px;
        margin: 10px 4%;
        border-radius: 10px;
        background-color: #3967AB;
        color: #ebebeb !important;
        display: flex;
        align-items: center;
        justify-content: center;
      }
    }
  }

  &-dialog {
    &-button {
      width: calc(50% - 4px);
      margin: 4px 2px;
    }
  }
}

:deep(.el-overlay-dialog) {
  overflow: hidden;
}
</style>
