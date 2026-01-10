#!/usr/bin/env bash
set -euo pipefail

ENV=$1
DIST_DIR="dist"
PARAM_PATH="/frontend/$ENV"

echo "🚀 Deploying to $ENV"

aws ssm get-parameters-by-path \
  --path "$PARAM_PATH" \
  --with-decryption \
  --query "Parameters[*].{Name:Name,Value:Value}" \
  --output json > params.json

echo "window.APP_CONFIG = {" > $DIST_DIR/env.js
jq -r '.[] | "\"\(.Name | split("/")[-1])\": \"\(.Value)\"," ' params.json >> $DIST_DIR/env.js
echo "};" >> $DIST_DIR/env.js

aws s3 sync "$DIST_DIR/" "s3://$S3_BUCKET/" --delete

aws cloudfront create-invalidation \
  --distribution-id "$CLOUDFRONT_DIST_ID" \
  --paths "/*"

echo "✅ Deployment completed"

