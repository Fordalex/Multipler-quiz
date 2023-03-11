import { createApp, ref } from 'vue/dist/vue.esm-bundler.js'
import Player from './components/player.vue'

let players = ref([]);

document.addEventListener('DOMContentLoaded', () => {
  console.log('connected to vue.js')

  let appContainer = document.getElementById('app')
  if (appContainer) {
    const app = createApp({
      data() {
        return {
          players: players
        }
      }
    })
    app.component('player', Player)
    app.mount(appContainer)
  }
});

export default players;
