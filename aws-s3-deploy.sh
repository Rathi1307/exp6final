#!/usr/bin/env bash
set -e

BUCKET_NAME=${1:-"$AWS_S3_BUCKET"}
DISTRIBUTION_ID=${2:-"$AWS_CLOUDFRONT_DISTRIBUTION_ID"}

if [ -z "$BUCKET_NAME" ]; then
  echo "❌ Error: Please specify the S3 bucket name."
  echo "Usage: ./aws-s3-deploy.sh <your-s3-bucket-name> [cloudfront-distribution-id]"
  exit 1
fi

echo "📦 Building React production bundle..."
npm run build

echo "🚀 Uploading to AWS S3: s3://$BUCKET_NAME ..."
aws s3 sync dist/ s3://"$BUCKET_NAME" --delete

if [ -n "$DISTRIBUTION_ID" ]; then
  echo "🔄 Invalidating CloudFront cache for distribution: $DISTRIBUTION_ID ..."
  aws cloudfront create-invalidation --distribution-id "$DISTRIBUTION_ID" --paths "/*"
fi

echo "✅ AWS Deployment completed successfully!"
