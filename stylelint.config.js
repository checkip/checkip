export default {
  ignoreDisables: true,
  extends: ['stylelint-config-standard'],
  plugins: ['stylelint-prettier'],
  rules: {
    'prettier/prettier': true,
    'import-notation': 'string',
    'no-empty-source': null,
  },
};
