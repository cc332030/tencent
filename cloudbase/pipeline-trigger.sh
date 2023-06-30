#!/bin/sh

echo 'pipeline-trigger'

set -e

echo "
OWNER: ${OWNER}
REPOSITORY_NAME: ${REPOSITORY_NAME}
BRANCH: ${BRANCH}
"

curl -u ${USERNAME}:${PASSWORD} \
   -v -X POST "${URL}" \
   -H 'Content-Type: application/json' \
   -d "
    {
    \"ref\": \"master\",
    \"envs\": [
        {
            \"name\": \"TCR_REGISTRY_CREDENTIAL\",
            \"value\": \"${TCR_REGISTRY_CREDENTIAL}\",
            \"sensitive\": 0
        },
        {
            \"name\": \"TCR_REGISTRY_HOSTNAME\",
            \"value\": \"ccr.ccs.tencentyun.com\",
            \"sensitive\": 0
        },
        {
            \"name\": \"TCR_NAMESPACE_NAME\",
            \"value\": \"${TCR_NAMESPACE_NAME}\",
            \"sensitive\": 0
        },
        {
            \"name\": \"OWNER\",
            \"value\": \"${OWNER}\",
            \"sensitive\": 0
        },
        {
            \"name\": \"REPOSITORY_NAME\",
            \"value\": \"${REPOSITORY_NAME}\",
            \"sensitive\": 0
        },
        {
            \"name\": \"BRANCH\",
            \"value\": \"${BRANCH}\",
            \"sensitive\": 0
        }
    ]
}"
