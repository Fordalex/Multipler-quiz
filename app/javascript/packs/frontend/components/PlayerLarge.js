window.app.component('player', {
  props: {
    name: {
      type: String,
      required: true
    }
  },
  template:
  /*html*/`
  <div class="player-container">
    <div class="player-iconContainer">
      <span class="player-position" style="background-color: red;"></span>
    </div>
    <p id="playerName" class="player-name" style="background-color: red">{{ name }}</p>
    <p class="player-score" ></p>
  </div>
  `
});
