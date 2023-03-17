// vite.config.ts
import { resolve } from 'path'
import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import FullReload from 'vite-plugin-full-reload'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [
    vue(),
    RubyPlugin(),
    FullReload(['config/routes.rb', 'app/views/**/*'], { delay: 200 }),
  ],
  // build: {
  //   outDir: 'public/assets',
  //   manifest: true,
  //   rollupOptions: {
  //     input: 'app/frontend/entrypoints/application.js'
  //   }
  // }
})
