# connectivity-test-scripts
## Prerequisites:
1. Install jq (Example: `sudo yum -y install jq`)
2. Create following parameters in SSM Parameter Store:

| Parameter Name | Descriptions |
| ------ | ------ |
| /conntest/iplist | for storing the list of IPs |
| /conntest/portlist | for storing the list of Ports to be tested |
| /conntest/bucketname | the name of s3 bucket that will be used to store the results |
| /conntest/bucketpath | the path inside the bucket where the results will be stored. Example: `app-name/dev-env/` |
