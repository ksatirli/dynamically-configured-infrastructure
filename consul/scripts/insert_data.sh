#!/bin/sh

# use this script to insert KV pairs for consumption via Terraform

# AKS cluster configuration
consul kv put "cluster-configuration/agents_count" "3"

# generic thresholds
consul kv put "datadog/thresholds" "{ \"critical\": \"0.75\", \"warning\": \"0.66\", \"recover\": \"0\" }"

# environment-specific thresholds
consul kv put "datadog/envs/testing/thresholds" "{ \"env\": \"testing\", \"critical\": \"0.70\", \"warning\": \"0.50\", \"recover\": \"0\" }"
consul kv put "datadog/envs/production/thresholds" "{ \"env\": \"production\", \"critical\": \"0.70\", \"warning\": \"0.50\", \"recover\": \"0\" }"
