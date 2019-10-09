#!/bin/sh

set -e

# Set Aws cli configuration
aws configure set aws_access_key_id ${AWS_ACCESS_KEY} 
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}

# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
export KUBECONFIG=/tmp/config
echo ${GITHUB_WORKSPACE}
ls -lth ${GITHUB_WORKSPACE}

sh -c "kubectl $*"
