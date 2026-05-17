/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./theme/templates/**/*.html",
    "./apps/**/templates/**/*.html",
  ],
  theme: {
    extend: {},
  },
  plugins: [require("daisyui")],
  daisyui: {
    themes: ["dark"],
    darkTheme: "dark",
  },
};
