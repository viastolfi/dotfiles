#!/bin/bash

ssid=$1
iteration=0

echo "[$iteration/10] trying to find $ssid wifi network"
nmcli device wifi list | grep "$ssid" > /dev/null

while [ $? != 0 ];do
  sleep 1
  iteration=$(($iteration + 1))

  if [ $iteration -gt 10 ];then
    echo "can't find $ssid wifi network"
    echo "are you the ssid name is right ?"
    exit 1
  fi

  echo "[$iteration/10] trying to find $ssid wifi network"
  nmcli device wifi list | grep "$ssid" > /dev/null
done

echo "$ssid wifi network found, trying to connect"
nmcli device wifi connect "$ssid" > /dev/null

if [ $? != 0 ];then
  echo "can't connect to $ssid wifi network"
  echo "try again"
  exit 1
fi

echo "connection to $ssid wifi network successfull"
