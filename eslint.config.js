import babelParser from '@babel/eslint-parser';
import js from '@eslint/js';
import globals from 'globals';
import eslintPluginPrettierRecommended from 'eslint-plugin-prettier/recommended';

export default [
  js.configs.recommended,
  eslintPluginPrettierRecommended,
  {
    files: ['**/*.js'],
    linterOptions: {
      noInlineConfig: true,
    },
    languageOptions: {
      ecmaVersion: 'latest',
      sourceType: 'module',
      parser: babelParser,
      parserOptions: {
        requireConfigFile: false,
        babelOptions: {
          babelrc: false,
          configFile: false,
          presets: ['@babel/preset-env'],
        },
      },
      globals: {
        ...globals.browser,
      },
    },
    rules: {
      curly: ['error', 'all'],
      'no-console': 'error',
      'no-template-curly-in-string': 'error',
      'no-var': 'error',
    },
  },
  {
    ignores: ['.coverage/*', '.tmp/*', '.vendor/*'],
  },
];
