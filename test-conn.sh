#!/bin/bash

iplist=$(echo -e -n $(aws ssm get-parameter --name /conntest/iplist | jq -r .Parameter.Value))

portlist=$(echo -e -n $(aws ssm get-parameter --name /conntest/portlist | jq -r .Parameter.Value))

TZ="Asia/Jakarta"

int1=0
int2=0

for ip in $iplist
 do
         int1=$(( $int1+1 ))
         for port in $portlist
         do
                 int2=$(( $int2+1 ))
                 if [ $int1 -eq $int2 ]
                 then
                        nmap -Pn --traceroute -n -p $port $ip
                        echo "---------------------------------------------------------------------------------------------------------------"
                 fi
         done
         int2=0
 done

echo "***************************************************************************************************************"
echo "Connection Test Execution Completed at $(TZ='Asia/Jakarta' date +'%Y-%m-%d %H:%M:%S')"
