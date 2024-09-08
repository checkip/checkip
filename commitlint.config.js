export default {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'scope-enum': [2, 'always', ['api', 'core', 'i18n', 'infra', 'package', 'ux']],
  },
};
