# PharoTestsAction

This project is to test pharo code. The actions will remove packages of pharo and then will load and execute the tests.

### Usage example

Create a `.github/workflows/main.yml` with this content:

```yml
on: [push]

jobs:
  ActionJob:
    runs-on: ubuntu-latest
    name: CI for the action
    steps:
      - name: Cancel Previous Runs
        uses: styfle/cancel-workflow-action@0.12.1
        with:
          access_token: ${{ github.token }}
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - name: Run pharo Tests
        id: tests
        uses: akevalion/PharoTestsAction@v1
        with:
          removes-repo: 'Roassal, Numeric' # Comma-separated strings; all packages that begin with each string will be removed from system
          baseline: 'PharoTestsAction'
          group: 'default'
          tests: 'PharoTestsAction-Tests'
```
