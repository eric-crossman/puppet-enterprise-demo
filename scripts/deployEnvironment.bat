aws cloudformation deploy --template packaged-template.json --stack-name PuppetEnterpriseDemo \
--parameter-overrides HostedZoneName=puppet.ericcrossman.com \
InstanceType=m4.large KeyPairName=UdemyCourseworkNorthVirginia_public \
MasterHostName=puppet PuppetMasterDNSName=master PuppetMasterIP=192.168.1.10 RemoteAdminCIDR=128.227.189.47/32 \
SubnetCIDR=192.168.1.0/24 VPCCIDR=192.168.0.0/22 \
--tags ProjectId=PuppetEnterpriseEval PEVersion=2017.3.5 --capabilities CAPABILITY_IAM
