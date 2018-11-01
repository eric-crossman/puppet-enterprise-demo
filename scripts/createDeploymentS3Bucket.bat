REM - File: createDeploymentS3Bucket.bat
REM - Author: Eric Crossman
REM - Date: 11.01.2018
REM - Description - Utility script to create a S3 bucket for CloudFormation template storage.

set CF_DEPLOY_BUCKET=erc-cloudformation-puppet-demo

aws s3 mb s3://%CF_DEPLOY_BUCKET%
