const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        p: ['Proxima Nova', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        blue1: '#3778c2',
        blue2: '#2c619d',
        green: '#5fb523',
        darker: '#434b54',
        dark: '#555e67',
        medium: '#878a8f',
        light: '#989da3',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
