#!/bin/sh -l

# Copyright (c) 2019-present Sonatype, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -euox pipefail

download_url=$(curl -sL https://api.github.com/repos/sonatype-nexus-community/nancy/releases/latest | jq -r '.assets[] | select(.name | contains("'"$(uname | tr '[:upper:]' '[:lower:]')"'.amd64")) | select(.name | contains("tar.gz") | not) | .browser_download_url')

curl -L -o /usr/local/nancy "$download_url"
chmod +x /usr/local/nancy

/usr/local/nancy "$GITHUB_WORKSPACE"/"$1"
