export default {
  extends: ['stylelint-config-standard', 'stylelint-config-standard-scss'],
  plugins: ['stylelint-prettier'],
  rules: {
    'prettier/prettier': true,
    'import-notation': 'string',
    'no-empty-source': null,
  },
};
