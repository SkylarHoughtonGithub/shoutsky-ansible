#! /bin/bash

#Sanitize the output file
echo " " > [[home directory of running user]]/hostnames.csv/hostnames.csv

hostlist=$(grep -E '^\[' [[Ansible Master Inventory File]] | sed 's/\[//' | sed 's/\]//')

for i in $hostlist
do
  ansible_hostname=$(ansible $i -i [[Ansible Master Inventory File]] -a 'hostname')
  echo " $i,$ansible_hostname" >> [[home directory of running user]]/hostnames.csv
done

exit
