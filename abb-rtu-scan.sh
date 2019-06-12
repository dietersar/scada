#!/bin/bash

ipaddresses=`cat $1`

for i in $ipaddresses
do
statusLoad=`curl -o /dev/null --silent --head --write-out '%{http_code}\n' -u Load:Load http://$i/fs/ssi/mainConfig.htm`
statusControl=`curl -o /dev/null --silent --head --write-out '%{http_code}\n' -u Control:Control http://$i/VxWorks/PrioI/SystemInfo?FILTER=0`
statusOperator=`curl -o /dev/null --silent --head --write-out '%{http_code}\n' -u Operator:Operator http://$i/VxWorks/PrioI/SystemInfo?FILTER=0`
statusAdmin=`curl -o /dev/null --silent --head --write-out '%{http_code}\n' -u Admin:Admin http://$i/access-config/user/Select`

if [ $statusLoad -eq "501" ] ; then echo "default user Load discovered"
else echo "default user Load NOT discovered"
fi
if [ $statusControl -eq "501" ] ; then echo "default user Control discovered"
else echo "default user Control NOT discovered"
fi
if [ $statusOperator -eq "501" ] ; then echo "default user Operator discovered"
else echo "default user Operator NOT discovered"
fi
if [ $statusAdmin -eq "501" ] ; then echo "default user Admin discovered"
else echo "default user Admin NOT discovered"
fi

done
