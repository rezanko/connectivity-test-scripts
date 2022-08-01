
#!/bin/bash
output_folder=/tmp
output_file=$(TZ='Asia/Jakarta' date +%Y%m%d%H%M%S)-conn-test-result.txt
s3_bucket=blah
s3_path=anu

/root/test-conn.sh | tee $output_folder/$output_file
#aws s3 cp $output_folder/$output_file s3://$s3_bucket/$s3_path
