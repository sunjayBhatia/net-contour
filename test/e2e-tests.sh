#!/usr/bin/env bash

# Copyright 2020 The Knative Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

source $(dirname $0)/e2e-common.sh


# Script entry point.
initialize $@  --skip-istio-addon

go_test_e2e -timeout=60m \
	    ./test/conformance \
	    --enable-beta --enable-alpha \
	    --skip-tests host-rewrite \
	    --ingressClass=contour.ingress.networking.knative.dev || fail_test

success
