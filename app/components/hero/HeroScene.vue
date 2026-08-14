<script setup lang="ts">
import { useMouseInElement } from '@vueuse/core';

const containerRef = ref<HTMLElement | null>(null);
const { elementX, elementY, elementWidth, elementHeight } = useMouseInElement(containerRef);

// Normalized mouse position (-1 to 1)
const mouseX = computed(() => (elementX.value / (elementWidth.value || 1)) * 2 - 1);
const mouseY = computed(() => (elementY.value / (elementHeight.value || 1)) * 2 - 1);

// Time-based rotation
const time = ref(0);
let animFrame: number;

onMounted(() => {
  const animate = () => {
    time.value += 0.005;
    animFrame = requestAnimationFrame(animate);
  };
  animate();
});

onUnmounted(() => {
  if (animFrame) cancelAnimationFrame(animFrame);
});

const rotationX = computed(() => mouseY.value * 0.3 + time.value * 0.5);
const rotationY = computed(() => mouseX.value * 0.3 + time.value * 0.3);
const rotationZ = computed(() => time.value * 0.2);

const ring1RotX = computed(() => mouseX.value * 0.5 + time.value * 0.2);
const ring1RotY = computed(() => mouseY.value * 0.5 + time.value * 0.4);

const ring2RotX = computed(() => Math.PI / 3 + mouseX.value * 0.3 + time.value * 0.15);
const ring2RotY = computed(() => mouseY.value * 0.3 + time.value * 0.25);
</script>

<template>
  <div ref="containerRef" class="absolute inset-0 z-5">
    <TresCanvas
      :alpha="true"
      :antialias="true"
      power-preference="high-performance"
      window-size
    >
      <TresPerspectiveCamera :position="[0, 0, 5]" />

      <!-- Main wireframe icosahedron -->
      <TresMesh
        :rotation-x="rotationX"
        :rotation-y="rotationY"
        :rotation-z="rotationZ"
      >
        <TresIcosahedronGeometry :args="[1.5, 1]" />
        <TresMeshBasicMaterial
          :wireframe="true"
          color="#d97706"
          :opacity="0.3"
          :transparent="true"
        />
      </TresMesh>

      <!-- Outer ring -->
      <TresMesh
        :rotation-x="ring1RotX"
        :rotation-y="ring1RotY"
      >
        <TresTorusGeometry :args="[2.2, 0.01, 16, 100]" />
        <TresMeshBasicMaterial
          color="#f59e0b"
          :opacity="0.2"
          :transparent="true"
        />
      </TresMesh>

      <!-- Second ring -->
      <TresMesh
        :rotation-x="ring2RotX"
        :rotation-y="ring2RotY"
      >
        <TresTorusGeometry :args="[2.5, 0.005, 16, 100]" />
        <TresMeshBasicMaterial
          color="#38bdf8"
          :opacity="0.15"
          :transparent="true"
        />
      </TresMesh>

      <!-- Small floating particles (spheres) -->
      <TresMesh
        v-for="i in 20"
        :key="i"
        :position="[
          Math.sin(i * 1.2 + time * 0.5) * 3,
          Math.cos(i * 0.8 + time * 0.3) * 3,
          Math.sin(i * 0.5 + time * 0.4) * 2 - 1,
        ]"
      >
        <TresSphereGeometry :args="[0.02, 8, 8]" />
        <TresMeshBasicMaterial
          :color="i % 3 === 0 ? '#d97706' : i % 3 === 1 ? '#f59e0b' : '#38bdf8'"
          :opacity="0.6"
          :transparent="true"
        />
      </TresMesh>
    </TresCanvas>
  </div>
</template>
