<template>
  <div ref="canvaRef" class="canvaRef"></div>
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
scene.fog = new THREE.Fog(0x999999, 0.1, 50)
scene.background = new THREE.Color(0xffffff)
const gltfLoader: GLTFLoader = new GLTFLoader()
const dracoLoader: DRACOLoader = new DRACOLoader()
dracoLoader.setDecoderPath("/src/assets/draco")
gltfLoader.setDRACOLoader(dracoLoader)
gltfLoader.load("/src/assets/model/basketballCourt/scene.gltf", (gltf) => {
  const model = gltf.scene
  model.scale.set(0.6, 0.6, 0.6)
  model.rotation.y = Math.PI / 2
  model.position.set(0, -2.7, 0)
  scene.add(model)
});
gltfLoader.load("/src/assets/model/tennisCourt/scene.gltf", (gltf) => {
  const model = gltf.scene
  model.scale.set(2, 2, 2)
  model.position.set(0, 0, -20)
  scene.add(model)
});
gltfLoader.load("/src/assets/model/pingpongTable/scene.gltf", (gltf) => {
  const model = gltf.scene
  model.scale.set(5, 5, 5)
  model.position.set(0, 0, -40)
  scene.add(model)
});
let rgbeLoader = new RGBELoader()
rgbeLoader.load('/src/assets/hdr/Alex_Hart-Nature_Lab_Bones_2k.hdr', (envMap) => {
  envMap.mapping = THREE.EquirectangularReflectionMapping
  scene.environment = envMap
})
// const axseHelper: THREE.AxesHelper = new THREE.AxesHelper(5)
// scene.add(axseHelper)

const camers: THREE.PerspectiveCamera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 1000)
camers.position.z = 10
camers.position.x = 18
camers.position.y = 18
camers.lookAt(0, 0, 0)

const renderer: THREE.WebGLRenderer = new THREE.WebGLRenderer()

let controls: OrbitControls = new OrbitControls(camers, renderer.domElement)

const animate = () => {
  renderer.render(scene, camers)
  controls.update();
  requestAnimationFrame(animate)
};

onMounted(() => {
  canvaRef.value.appendChild(renderer.domElement)
  controls.enableDamping = true
  controls.dampingFactor = 0.02
  renderer.setSize(canvaRef.value.clientWidth, canvaRef.value.clientHeight)
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
      camers.updateProjectionMatrix()
      renderer.render(scene, camers)
    });
  }
});
</script>

<style lang="less" scoped>
.canvaRef {
  width: 100%;
  height: 100%;
}
</style>
