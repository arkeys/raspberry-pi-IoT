#!/bin/bash

xout=`sudo ~/DHT22 2302 4 | grep Temp`
until [ $? -eq "0" ]
do
  xout=`sudo ~/DHT22 2302 4 | grep Temp`
done

f=`echo $xout | awk '{print "scale=2;((9/5) * " $3 ") + 32"}' | bc`
h=`echo $xout | awk {'print $7'}`

curl -X GET 'http://data.sparkfun.com/input/<pubkey>?private_key=<privatekey>&temp='$f'&humidity='$h
