<template>
  <p class="text-center">Round {{ current }} / {{ total }}</p>
</template>

<script setup>
  import { defineProps } from 'vue/dist/vue.esm-bundler.js'

  defineProps({
    current: {
      type: Number,
      required: true
    },
    total: {
      type: Number,
      required: true
    }
  })
</script>
