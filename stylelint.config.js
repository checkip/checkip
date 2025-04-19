export default {
  ignoreDisables: true,
  extends: ['stylelint-config-standard'],
  plugins: ['stylelint-prettier'],
  rules: {
    'at-rule-no-unknown': [
      true,
      {
        ignoreAtRules: ['theme'],
      },
    ],
    'prettier/prettier': true,
    'import-notation': 'string',
    'no-empty-source': null,
  },
};
