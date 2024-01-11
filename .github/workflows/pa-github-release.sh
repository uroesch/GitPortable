# -----------------------------------------------------------------------------
# Build and upload a new release
# Author: Urs Roesch https://github.com/uroesch
# Version: 0.2.0
# -----------------------------------------------------------------------------
name: pa-github-release

on:
  push:
    tags:
    - "v[0-9].*-uroesch"
  workflow_dispatch:

jobs:
  up-release:
    if: endsWith(github.repository, 'Portable')
    timeout-minutes: 30
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false

    steps:
    - name: Checkout repository
      uses: actions/checkout@v4

    - name: Git repo setup
      run: |2+
        git config user.name "Urs Roesch"
        git config user.email github@bun.ch
        git fetch --all
        git checkout master || git checkout main

    - name: Download build-scripts
      shell: bash
      run: |2+
        mkdir ../scripts &&
        cd ../scripts &&
        curl --silent -JLO https://raw.githubusercontent.com/uroesch/PortableApps/master/scripts/docker-build.sh &&
        curl --silent -JLO https://raw.githubusercontent.com/uroesch/PortableApps/master/scripts/pa-github-release.sh

    - name: Run build via docker
      shell: bash
      run: bash ../scripts/docker-build.sh
      timeout-minutes: 25

    - name: Upload release
      shell: bash
      run: |2+
        printf -v message "Release %s\n\nSummary:\n  * Upstream release v%s\n"
        bash ../scripts/pa-github-release.sh -m "${message}" 
      timeout-minutes: 25


