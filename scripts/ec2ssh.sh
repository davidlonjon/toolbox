#!/bin/bash
# SSH into an EC2 instance by name
# Author: tokudu@github.com (SoThree.com).
 
set -e
if [ $# -lt 1 ]
then
  #echo "Usage: `basename $0` instance_name"
  echo "Listing all the instances..."
  ec2-describe-instances | grep TAG | awk '{print $5}'
  exit 1
fi
 
# get instance id
instance_name=$1

# get the instance address so that we can SSH into it
echo "Obtaining the instance address..."
instance_address=`ec2-describe-instances  --filter "tag:Name=${instance_name}" | grep INSTANCE | awk '{print $4}'`
echo "Done. Instance address: ${instance_address}"
 
ssh -i $HOME/.ssh/soompi.pem ubuntu@${instance_address}
