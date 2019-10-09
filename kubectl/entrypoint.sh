#!/bin/sh

set -e

# Set Aws cli configuration
aws configure set aws_access_key_id ${AWS_ACCESS_KEY} 
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}

# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
export KUBECONFIG=/tmp/config

#echo github_workspace: ${GITHUB_WORKSPACE}
#ls -lth ${GITHUB_WORKSPACE}
#
#echo runner_workspace: ${RUNNER_WORKSPACE}
#ls -lth ${RUNNER_WORKSPACE}
#
#echo pwd: ${PWD}
#
echo "searching"
#find / -name "hotrod*"
find / -name "kubernetes-deploy.yml"
#
#echo "ls -lth"
#ls -lth /home/runner/work/hotrod
#
#echo "change directory"
#cd /home/runner/work/hotrod
#
#ls -lth /home/runner/work

sh -c "kubectl $*"
