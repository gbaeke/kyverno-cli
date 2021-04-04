# kyverno-cli

GitHub Action to run the kyverno cli. See https://kyverno.io/ for more information.

Example use:

```
on: [push]

jobs:
  kyverno-job:
    runs-on: ubuntu-latest
    name: Run kyverno
    steps:
      - name: Checkout
        uses: actions/checkout@v2
        - name: Validate policy
          uses: gbaeke/kyverno-cli@v1
          with:
            command: |
              kyverno apply ./policies --resource=./deploy/deployment.yaml
```