# connectivity-test-scripts
## Description
This is a script to test list of IPs and Ports connectivity/reachability from an EC2 instance perspective. The test result can be used to determine if the route from the EC2 instance (that is used for testing) to the destination IPs are already established (success in the traceroute) and also to check the destination IPs & Ports are already opened in firewall (the status will be shown as `Open` or `Closed`) or still blocked by the firewall (the status will be shown as `Filtered`)

## Prerequisites:
1. EC2 instance with Linux Operating System

2. Install jq package inside the instance (Example: `sudo yum -y install jq`)

3. Install nmap package inside the instance (Example: `sudo yum -y install nmap`)

4. Install AWS CLI inside the instance (Refer to: `https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html`)

5. Create following parameters in AWS SSM Parameter Store:

| Parameter Name | Descriptions |
| ------ | ------ |
| /conntest/iplist | for storing the list of IPs (one row per-IP) |
| /conntest/portlist | for storing the list of Ports to be tested (one row represents port/s that will be tested on the IP of the same row number in "/conntest/iplist" parameter) |
| /conntest/bucketname | the name of s3 bucket that will be used to store the connectivity test results |
| /conntest/bucketpath | the path/prefix inside the bucket where the results will be stored. Example: `app-name/dev-env/` |

6. Create EC2 instance profile with AmazonSSMManagedInstanceCore policy attached, and also permission to retrieve values from AWS SSM Parameter Store & push an object to an S3 Bucket where the test results will be stored

7. Assign the EC2 with Instance Profile created in step 6


## How to Run the Script:
1. Install Git CLI Tool (Example: `sudo yum -y install git`)

2. Clone this repository

3. There are 2 .sh scripts that can be used:

a. If the purpose is just to test, then execute the `test-conn.sh`

b. If You want to test and store the result to S3 Bucket (specified in the "/conntest/bucketname" & "/conntest/bucketpath"), then execute the `test-conn-and-put-to-s3.sh`
