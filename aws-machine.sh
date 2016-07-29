# Set up docker machine for AWS SHO Zemi Dockerized ODK

# See here for docs:
# https://docs.docker.com/machine/drivers/aws/

# This doesn't appear to work by itself
AWS_PROFILE=default

# You can get these with the following, but I don't want to parse JSON!
# aws --profile $AWS_PROFILE ec2 describe-vpcs
AWS_VPC_ID=vpc-fcde9a99

# Apparently my account simply didn't have a subnet pre-configured in zone a
# You can check *that* by noting the last letter of "AvailabilityZone"s here:
# aws --profile SHOzemi ec2 describe-subnets
AWS_ZONE=b

# Nor does this (with 0.6.0, this is expected) by itself
AWS_ACCESS_KEY_ID=$(aws --profile $AWS_PROFILE configure get aws_access_key_id)
AWS_SECRET_ACCESS_KEY=$(aws --profile $AWS_PROFILE configure get aws_secret_access_key)
AWS_DEFAULT_REGION=$(aws --profile $AWS_PROFILE configure get region)

# This checked out fine
# echo $AWS_PROFILE
# echo $AWS_ACCESS_KEY_ID
# echo $AWS_SECRET_ACCESS_KEY
# echo $REGION

# With 0.6.0, keys are used, but region is ignored
docker-machine create -d amazonec2 \
    --amazonec2-access-key $AWS_ACCESS_KEY_ID \
    --amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
    --amazonec2-region $AWS_DEFAULT_REGION \
    --amazonec2-vpc-id $AWS_VPC_ID \
    --amazonec2-zone $AWS_ZONE \
    sz-tokyo
