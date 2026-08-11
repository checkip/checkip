const production = process.env.NODE_ENV === 'production' || process.env.RAILS_ENV === 'production';

export default {
  plugins: {
    '@tailwindcss/postcss': { optimize: production },
  },
  map: !production && {
    inline: false,
    annotation: true,
  },
};
