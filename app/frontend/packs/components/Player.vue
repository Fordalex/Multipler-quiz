<template>
  <div class="player-container">
    <div class="player-iconContainer">
      <span data-testid="playerPosition" class="player-position" v-if="player.position" :style="{ backgroundColor: player.colour }">{{ player.position }}</span>
    </div>
    <p data-testid="playerName" id="playerName" class="player-name" :style="{ backgroundColor: player.colour }">{{ player.name }}</p>
    <p data-testid="playerScore" class="player-score" v-if="player.score">{{ player.score }}</p>
  </div>
</template>

<script>
export default {
  props: {
    player: {
      type: Object,
      required: true
    }
  }
}
</script>
