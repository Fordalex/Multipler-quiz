// vite.config.ts
import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import Vue from '@vitejs/plugin-vue'
import dns from 'dns'

dns.setDefaultResultOrder('verbatim')

export default defineConfig({
  plugins: [
    Vue(),
    // looks like RubyPlugin is preventing the network from running.
    RubyPlugin(),
  ],
  server: {
    host: true,
  },
})
