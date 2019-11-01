module.exports = {
  extends: [ 'wesbos' ],
  rules: {
    'prettier/prettier': [
      'error',
      { trailingComma: 'es5', singleQuote: true, printWidth: 80, bracketSpacing: true }
    ],
    'object-curly-spacing': [ 2, 'always' ],
  },
  overrides: [
    {
      files: [ '**/*.test.js' ],
      env: { jest: true },
      plugins: [ 'jest' ],
    }
  ]
}
