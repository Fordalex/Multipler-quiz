// Define feature flags
window.__VUE_OPTIONS_API__ = true;
window.__VUE_PROD_DEVTOOLS__ = false;

import { createApp, ref } from 'vue/dist/vue.esm-bundler.js'
import player from './components/Player.vue'

let players = ref([]);

document.addEventListener('DOMContentLoaded', () => {
  let appContainer = document.getElementById('app')
  if (appContainer) {
    const app = createApp({
      data() {
        return {
          players: players
        }
      }
    })
    app.component('player', player)
    app.mount(appContainer)
  }
});

export default players;
