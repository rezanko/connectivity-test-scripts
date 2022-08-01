
#!/bin/bash
output_folder=/tmp
output_file=$(TZ='Asia/Jakarta' date +%Y%m%d%H%M%S)-conn-test-result.txt
s3_bucket=$(echo -e -n $(aws ssm get-parameter --name /conntest/bucketname | jq -r .Parameter.Value))
s3_path=$(echo -e -n $(aws ssm get-parameter --name /conntest/bucketpath | jq -r .Parameter.Value))

./test-conn.sh | tee $output_folder/$output_file
aws s3 cp $output_folder/$output_file s3://$s3_bucket/$s3_path
