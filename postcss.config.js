const production = process.env.NODE_ENV === 'production';

export default {
  plugins: {
    '@tailwindcss/postcss': {},
    cssnano: {
      preset: [
        'default',
        {
          discardComments: {
            removeAll: true,
          },
        },
      ],
    },
  },
  map: !production && {
    inline: false,
    annotation: true,
  },
};
