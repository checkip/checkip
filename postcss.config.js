const production = process.env.NODE_ENV === 'production';

export default {
  plugins: {
    '@tailwindcss/postcss': {},
  },
  map: !production && {
    inline: false,
    annotation: true,
  },
};
