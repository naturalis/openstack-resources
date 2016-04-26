#!/bin/bash
#
# Simple script which creates a CSV with project quota summary for all projects. 
# Author: Hugo van Duijn
#

FILES=../projects/*.yaml
echo name,group,cores,instances,ram\(MB\),disk\(GB\),floatingip
for f in $FILES
do
  name=`cat $f | grep name | awk '{ print $2 }'`
  group=`cat $f | grep adsync | awk '{ print $4 " " $5 }'`
  group=${group/\"/}
  cores=`cat $f | grep cores | awk '{ print $2 }'`
  instances=`cat $f | grep instances | awk '{ print $2 }'`
  ram=`cat $f | grep ram | awk '{ print $2 }'`
  disk=`cat $f | grep gigabytes | awk '{ print $2 }'`
  floatingip=`cat $f | grep floatingip | awk '{ print $2 }'`
  echo $name,$group ,$cores,$instances,$ram,$disk,$floatingip
done