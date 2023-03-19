// vite.config.ts
import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import Vue from '@vitejs/plugin-vue'
import dns from 'dns'

dns.setDefaultResultOrder('verbatim')

export default defineConfig({
  plugins: [
    Vue(),
    RubyPlugin(),
  ],
  server: {
    host: true,
  },
})
