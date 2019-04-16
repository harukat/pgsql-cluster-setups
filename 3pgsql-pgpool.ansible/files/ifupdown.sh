#!/bin/bash

CMD=$1
ADDR=$2
MSK=$3
ENI=$4
DEV=$5
RGN=$6

if [ "x$CMD" = "xup" ]
then 
  /usr/bin/aws --region $RGN ec2 assign-private-ip-addresses \
    --network-interface-id $ENI --private-ip-addresses $ADDR
  /sbin/ip addr add ${ADDR}/${MSK} dev $DEV
elif [ "x$CMD" = "xdown" ]
then 
  /sbin/ip addr del ${ADDR}/${MSK} dev $DEV
  /usr/bin/aws --region $RGN ec2 unassign-private-ip-addresses \
    --network-interface-id $ENI --private-ip-addresses $ADDR
fi

