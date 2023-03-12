<template>
  <div class="player-container">
    <div class="player-iconContainer">
      <span class="player-position" v-if="!!player.position" :style="{ backgroundColor: player.colour }">{{ player.colour }}</span>
    </div>
    <p id="playerName" class="player-name" :style="{ backgroundColor: player.colour }">{{ player.name }}</p>
    <p class="player-score" v-if="!!player.score">{{ player.score }}</p>
  </div>
</template>

<script setup>
  import { defineProps } from 'vue/dist/vue.esm-bundler.js'

  defineProps({
    player: {
      type: Object,
      required: true
    }
  })
</script>
