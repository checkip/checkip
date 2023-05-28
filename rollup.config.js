import nodeResolve from '@rollup/plugin-node-resolve';
import babel from '@rollup/plugin-babel';
import postcss from 'rollup-plugin-postcss';
import terser from '@rollup/plugin-terser';
import path from 'node:path';

export default {
  input: 'frontend/packs/application.js',
  output: {
    file: 'app/assets/builds/application.js',
    format: 'iife',
    inlineDynamicImports: true,
    sourcemap: true,
  },
  plugins: [
    nodeResolve({
      moduleDirectories: ['frontend', 'node_modules'],
      extensions: ['.js', '.scss', '.css'],
    }),
    babel({
      presets: [['@babel/preset-env', { targets: 'defaults' }]],
      babelHelpers: 'bundled',
      exclude: 'node_modules/**',
    }),
    postcss({
      extract: path.resolve(__dirname, 'app/assets/builds/application.css'),
      inject: false,
      sourceMap: true,
      minimize: true,
      use: {
        sass: {
          includePaths: [
            path.resolve(__dirname, 'node_modules'),
            path.resolve(__dirname, 'frontend'),
          ],
        },
      },
    }),
    terser(),
  ],
};
