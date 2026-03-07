/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        graphite: '#1B1B1B', // Dark charcoal background
        parchment: '#FDFBF7', // Off-white text 
        cherry: '#D32F2F', // Accent color
        // Light mode variants
        light: {
          bg: '#FDFBF7',
          text: '#1B1B1B'
        }
      },
      fontFamily: {
        syne: ['var(--font-syne)'],
        inter: ['var(--font-inter)'],
        space: ['var(--font-space-mono)'],
      },
    },
  },
  plugins: [],
}
