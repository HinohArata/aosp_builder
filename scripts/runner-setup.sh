# Copyright (C) 2024 Souhrud Reddy
# SPDX-License-Identifier: Apache-2.0

#!/bin/bash

#Zip download
rm -rf actions-runner || true

  echo "Installing Runner!" #Create folder and download zip
  echo "Downloading Zip"
  version=$(curl -s "https://api.github.com/repos/actions/runner/releases/latest" | grep -oP '"tag_name": "\K[^"]*' | sed 's/^v//')
  url=$(echo "$response" | grep -oP '"browser_download_url": "\K[^"]*' | grep 'linux-x64.tar.gz')
  
  if [[ -z "${version}" ]]; then
    echo "Failed to retrieve the version number"
    exit 1
  fi # Fetch version
  
  url=https://github.com/actions/runner/releases/download/v2.319.0/actions-runner-linux-x64-2.319.0.tar.gz # Fetch URL
  url=$(echo "$url" | xargs) # Remove leading/trailing whitespace
  if ! wget -O actions-runner-linux-x64.tar.gz "${url}"; then
    echo "Failed to download the runner package"
  exit 1
  fi
  
  echo "Extracting Zip"
    mkdir -p actions-runner
    echo "52b8f9c5abb1a47cc506185a1a20ecea19daf0d94bbf4ddde7e617e7be109b14  actions-runner-linux-x64.tar.gz" | shasum -a 256 -c
    tar -xvf actions-runner-linux-x64.tar.gz -C actions-runner
  echo "Removing Leftovers"
    rm -rf actions-runner-linux-x64.tar.gz # Extract package and remove leftovers
