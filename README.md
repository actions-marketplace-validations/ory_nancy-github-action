<p align="center">
    <img src="https://github.com/sonatype-nexus-community/nancy/blob/master/docs/images/nancy.png" width="350"/>
</p>

# Nancy for GitHub Actions

Run [Sonatype Nancy](https://github.com/sonatype-nexus-community/nancy) as part of your GitHub Actions workflow.

This fork always uses the latest nancy version

## Inputs

- `target` (optional): The path to the go.sum or Gopkg.lock file.

## Example Usage

```
name: Go Nancy

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1
    - name: Nancy
      uses: ory/nancy-github-action@v0
      # with:
      #   target: go.sum
```
