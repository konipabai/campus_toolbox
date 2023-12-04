<template>
  <div class="sports">
    <div ref="canvaRef" class="sports-canvas"></div>
    <div shadow="hover" class="sports-form">123</div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, Ref, watch } from "vue"
import * as THREE from "three"
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls.js"
import { GLTFLoader } from "three/examples/jsm/loaders/GLTFLoader.js"
import { DRACOLoader } from "three/examples/jsm/loaders/DRACOLoader.js"
import { RGBELoader } from "three/examples/jsm/loaders/RGBELoader.js"

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
  model.position.set(45, -2.7, 0)
  model.rotation.y = Math.PI / 2
  model.rotateX(-Math.PI / 6)
  scene.add(model)
});
gltfLoader.load("/src/assets/model/tennisCourt/scene.gltf", (gltf) => {
  model = gltf.scene
  model.scale.set(2, 2, 2)
  model.position.set(0, 0, 45)
  model.rotation.y = Math.PI / 2
  model.rotateZ(-Math.PI / 6)
  scene.add(model)
});
gltfLoader.load("/src/assets/model/pingpongTable/scene.gltf", (gltf) => {
  model = gltf.scene
  model.scale.set(5, 5, 5)
  model.position.set(-45, 0, 0)
  model.rotateZ(-Math.PI / 6)
  scene.add(model)
});
gltfLoader.load("/src/assets/model/footballCourt/scene.gltf", (gltf) => {
  model = gltf.scene
  model.scale.set(0.8, 0.8, 0.8)
  model.position.set(0, 0, -45)
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
// const axseHelper: THREE.AxesHelper = new THREE.AxesHelper(100)
// scene.add(axseHelper)

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
  target = new THREE.Vector3(0, 0, -47)
  controls.target = target
  controls.enablePan = false;
  controls.maxAzimuthAngle = Math.PI / 3
  controls.minAzimuthAngle = -Math.PI / 6
  controls.maxPolarAngle = Math.PI / 2
  controls.minPolarAngle = Math.PI / 6
  controls.maxDistance = 43
  controls.minDistance = 5
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
    padding: 10px;
    border-radius: 10px;
  }
}
</style>
