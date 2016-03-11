# Set up docker machine for AWS SHO Zemi Dockerized ODK

# See here for docs:
# https://docs.docker.com/machine/drivers/aws/

# This doesn't appear to work by itself
AWS_PROFILE=SHOzemi

# Nor does this (with 0.6.0, this is expected) by itself
AWS_ACCESS_KEY_ID=$(aws --profile $AWS_PROFILE configure get aws_access_key_id)
AWS_SECRET_ACCESS_KEY=$(aws --profile $AWS_PROFILE configure get aws_secret_access_key)
REGION=$(aws --profile $AWS_PROFILE configure get region)

# This checked out fine
# echo $AWS_PROFILE
# echo $AWS_ACCESS_KEY_ID
# echo $AWS_SECRET_ACCESS_KEY
# echo $REGION

# With 0.6.0, keys are used, but region is ignored
docker-machine create -d amazonec2 \
    --amazonec2-access-key $AWS_ACCESS_KEY_ID \
    --amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
    --amazonec2-region $REGION \
    --amazonec2-vpc-id vpc-25582340 \
    sz-tokyo

