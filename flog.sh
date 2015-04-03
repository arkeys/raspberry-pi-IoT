#!/bin/bash
tout=`TZ='America/Los_Angeles' date +"%Y-%m-%d %H:%M"`

xout=`sudo ~/DHT22 2302 4 | grep Temp`
until [ $? -eq "0" ]
do
  xout=`sudo ~/DHT22 2302 4 | grep Temp`
done

f=`echo $xout | awk '{print "scale=2;((9/5) * " $3 ") + 32"}' | bc`
h=`echo $xout | awk {'print $7'}`
echo $tout " " $f " F " $h "%"
