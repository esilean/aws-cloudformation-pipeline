aws cloudformation deploy --template-file cloudformation/template.yml --stack-name aws-twitter-pipeline-demo --parameter-overrides CodeCommitRepo=cf-study CodeCommitBranch=main --capabilities CAPABILITY_IAM

# Get output values from stack
aws cloudformation describe-stacks --stack-name aws-twitter-pipeline-demo --query 
"Stacks[0].Outputs[?OutputKey==`PipelineBucket` || OutputKey==`TwitterBucket`]"

# Remove files from S3
aws s3 rm s3://twittercodepipelinebucketreact --recursive
aws s3 rm s3://twittercodepipelinedeploybucketreact --recursive

# Delete Stack
aws cloudformation delete-stack --stack-name aws-twitter-pipeline-demo