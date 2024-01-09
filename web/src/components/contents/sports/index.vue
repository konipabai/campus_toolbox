<template>
  <div class="sports">
    <div ref="canvaRef" class="sports-canvas"></div>
    <div class="sports-form">
      <el-form :model="searchData" label-width="80px" ref="sportsRef">
        <el-form-item label="场地类型" prop="type" class="sports-form-search">
          <el-select v-model="searchData.type" placeholder="请选择类型" @change="select">
            <template #prefix>
              <el-icon>
                <Place />
              </el-icon>
            </template>
            <el-option v-for="item in typeData" :key="item" :value="item" />
          </el-select>
        </el-form-item>
        <el-form-item label="日期" prop="date" class="sports-form-search">
          <el-config-provider :locale="locale">
            <el-date-picker v-model="searchData.date" type="date" placeholder="请选择日期" />
          </el-config-provider>
        </el-form-item>
        <el-form-item label="预约时间" prop="time" class="sports-form-search">
          <el-config-provider :locale="locale">
            <el-time-picker v-model="searchData.time" is-range range-separator="—" start-placeholder="开始时间"
              end-placeholder="结束时间" format="HH:mm" :clearable="false" />
          </el-config-provider>
        </el-form-item>
      </el-form>
      <el-divider />
      <el-scrollbar>
        <div class="sports-form-show">
          <div v-for="item in 15" class="sports-form-show-div">篮球场A</div>
        </div>
      </el-scrollbar>
    </div>
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
import { searchSportsType } from "../../../types/sports"

const canvaRef = ref() as Ref<HTMLElement>

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


const searchData: searchSportsType = reactive({
  type: "足球场",
  date: "",
  time: [new Date(2023, 1, 1, 0, 0), new Date(2023, 1, 1, 23, 59)] as [Date, Date]
})
const typeData: string[] = ["足球场", "篮球场", "网球场", "乒乓球场"];
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
}
</style>
