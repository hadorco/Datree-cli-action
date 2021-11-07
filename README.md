# Overview
The datree CLI provides a policy enforcement solution to run automatic checks for rule violations in Kuberenetes configuration files.<br/>
This action runs the Datree CLI against a given Kubernetes configuration file in your repository.<br/>
To learn more about datree, please visit the [datree website](https://www.datree.io/).

# Setup
To get started, follow these steps:
1. Obtain your datree account token by following the instructions described here: https://hub.datree.io/account-token
2. Set DATREE_TOKEN as a [secret](https://docs.github.com/en/actions/reference/encrypted-secrets) or [environment](https://docs.github.com/en/actions/reference/environment-variables) variable

# Usage
An example workflow that uses this action to run the CLI on a file and generate a report in simple text only, while using Kubernetes version 1.20.0:
```yaml
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
    
env:
  DATREE_TOKEN: ${{ secrets.DATREE_TOKEN }} 

jobs:
  k8s-policy-check:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v2
        
      - name: Run Datree's policy check
        uses: hadorco/Datree-cli-action@main
        with:
          file: 'somedirectory/somefile.yaml'
          options: '--output simple --schema-version 1.20.0'
```

## Datree CLI Options

| Flag        | Alias        | Values  | Description |
|:------------|:-------------|:--------|:------------|
| --help      | -h           | N/A     |Prints help, if you give it a command then it will print help for that command|
| --output    | -o           | json, yaml, xml |Output the policy check results in the requested format|
| --output    | -o           | simple  |Output the policy check results in simple text (without emoji or colors)|
|--schema-version| -s | e.g. "1.20.0" |Set Kubernetes version to validate against<br/>Defaults to 1.18.0 (default "1.18.0")|
|--ignore-missing-schemas| N/A | N/A |Skip files with missing schemas instead of failing the schema validation check|
|--policy | -p | e.g. staging | Specifying which policy to execute (by policy name)|
|--only-k8s-files| N/A | N/A | Skip all none K8s files<br/>Especially useful when scanning a dir with K8s and other config files:<br/>datree test *.yaml --only-k8s-files|
