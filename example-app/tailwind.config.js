export default {
  content: [
    "./resources/**/*.blade.php",
    "./resources/**/*.js",
    "./resources/**/*.vue",
    "node_modules/preline/dist/*.js",
  ],
  theme: {
    extend: {},
  },
  darkMode:'class',
  plugins: [
    require('@tailwindcss/forms'),
    require('preline/plugin'),
  ],
}