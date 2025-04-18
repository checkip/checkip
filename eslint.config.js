import babelParser from '@babel/eslint-parser';
import globals from 'globals';
import js from '@eslint/js';
import prettier from 'eslint-plugin-prettier/recommended';

import { defineConfig, globalIgnores } from 'eslint/config';
import { includeIgnoreFile } from '@eslint/compat';
import { fileURLToPath } from 'node:url';

const gitignorePath = fileURLToPath(new URL('.gitignore', import.meta.url));

export default defineConfig([
  globalIgnores(['coverage/', 'tmp/', 'vendor/']),
  includeIgnoreFile(gitignorePath),
  js.configs.recommended,
  prettier,
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
        ...globals.node,
      },
    },
    rules: {
      curly: ['error', 'all'],
      'no-console': 'error',
      'no-template-curly-in-string': 'error',
      'no-var': 'error',
    },
  },
]);
