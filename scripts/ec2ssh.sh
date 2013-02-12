#!/bin/bash
# SSH into an EC2 instance by name
# Author: tokudu@github.com (SoThree.com).

set -e
if [ $# -lt 1 ]
then
  echo "Listing all the instances..."
  ec2-describe-instances | grep TAG | grep -e '\sName' | awk '{print $5}'
  exit 1
fi

# get instance id
instance_name=$1

# get the instance address so that we can SSH into it
echo "Obtaining the instance address..."
instance_address=`ec2-describe-instances  --filter "tag:Name=${instance_name}" | grep INSTANCE | awk '{print $4}'`
echo "Done. Instance address: ${instance_address}"

pem_key=''
echo "Instance Name: ${instance_name}"
# get the PEM key
case "${instance_name}" in
    *ima*) pem_key="${HOME}/.ssh/enswersAmerica.pem" ;;
    *soo*) pem_key="${HOME}/.ssh/soompi.pem" ;;
    *) echo "Error: A pem key could not be found."; exit 1;;
esac
ssh -i ${pem_key} ubuntu@${instance_address}
