# connectivity-test-scripts
Prerequisites:
1. install jq (yum -y install jq)
2. create following parameters in SSM Parameter Store:
	a. /conntest/iplist (for storing the list of IPs)
        b. /conntest/portlist (for storing the list of Ports to be tested)
        c. /conntest/bucketname (the s3 bucket that will be used to store the results)
        d. /conntest/bucketpath (the path inside the bucket where the results will be stored)
