while read ip; 
do 
   echo $ip
   ssh-copy-id root@$ip; 
done < $1
