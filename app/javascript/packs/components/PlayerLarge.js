window.app.component('player', {
  props: {
    player: {
      type: Object,
      required: true
    }
  },
  template:
  /*html*/`
  <div class="player-container">
    <div class="player-iconContainer">
      <span class="player-position" :style="{ backgroundColor: player.colour }">{{ player.colour }}</span>
    </div>
    <p id="playerName" class="player-name" :style="{ backgroundColor: player.colour }">{{ player.name }}</p>
    <p class="player-score" >{{ player.score }}</p>
  </div>
  `
});
