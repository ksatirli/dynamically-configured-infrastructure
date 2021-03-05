#!/bin/sh

# use this script to insert KV pairs for consumption via Terraform

# AKS cluster configuration
consul kv put "cluster-configuration/agents_count" 3

# generic thresholds
consul kv put "datadog/thresholds" "{ \"critical\": \"0.75\", \"warning\": \"0.66\", \"recover\": \"0\" }"
