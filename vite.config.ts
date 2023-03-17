// vite.config.ts
import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'

export default defineConfig({
  plugins: [
    RubyPlugin(),
  ],
  build: {
    outDir: 'public/assets',
    rollupOptions: {
      input: {
        // application: 'app/javascript/entrypoints/application.js',
        styles: 'app/assets/stylesheets/home.css'
      }
    }
  }
})
