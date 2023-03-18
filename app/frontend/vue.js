// Define feature flags

window.__VUE_OPTIONS_API__ = true;
window.__VUE_PROD_DEVTOOLS__ = false;

import { createApp, ref } from 'vue/dist/vue.esm-bundler.js'
import Player from './packs/components/Player.vue'
import RoundCounter from './packs/components/RoundCounter.vue'

window.players = ref([]);
window.currentRound = ref(1);

document.addEventListener('DOMContentLoaded', () => {
  let appContainer = document.getElementById('app')
  if (appContainer) {
    const app = createApp({
      data() {
        return {
          players: window.players,
          currentRound: window.currentRound
        }
      }
    })
    app.component('player', Player)
    app.component('round-counter', RoundCounter)
    app.mount(appContainer)
  }
});

