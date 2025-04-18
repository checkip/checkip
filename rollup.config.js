import resolve from '@rollup/plugin-node-resolve';
import babel from '@rollup/plugin-babel';
import terser from '@rollup/plugin-terser';

const production = process.env.NODE_ENV === 'development';

export default {
  input: 'frontend/packs/application.js',
  output: {
    file: 'app/assets/builds/application.js',
    format: 'es',
    inlineDynamicImports: true,
    sourcemap: !production,
  },
  plugins: [
    resolve({
      moduleDirectories: ['frontend', 'node_modules'],
      extensions: ['.js'],
    }),
    babel({
      presets: [['@babel/preset-env', { targets: 'defaults' }]],
      babelHelpers: 'bundled',
      exclude: 'node_modules/**',
    }),
    terser({
      output: {
        comments: false,
      },
    }),
  ],
};
