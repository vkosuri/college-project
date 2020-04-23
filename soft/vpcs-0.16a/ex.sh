#!/bin/sh
#-----------------------------------------------------------------
# topology:
# 
# 20000     30000                             30002       20002
# PC1 - s0/0 -*                                  *- s0/0 - PC3
#             |              2000                |
#       2001 R1 - s1/0:s0/0 - R0 - s0/1:s1/0 - R2 2002
#             |   21000  21001    21002  21003   |
# PC2 - s0/1 -*                                  *- s0/1 - PC4
# 20001      30001                            30003       20003
#
#-----------------------------------------------------------------
C=`pwd`/dynamips
B=`pwd`/c7200-adventerprisek9-mz.124-22.T.bin.unzip
mkdir -p r1
cd r1
$C -i R1 -T 2001 -P 7200 -t npe-400  -X --sparse-mem -r 192 -c 0x2102 \
  --idle-pc=0x60646da8 -p 0:C7200-IO-2FE -p 1:PA-2FE-TX \
  -s 0:0:udp:30000:127.0.0.1:20000 \
  -s 0:1:udp:30001:127.0.0.1:20001 \
  -s 1:0:udp:21000:127.0.0.1:21001 \
  $B &
cd -

mkdir -p r2
cd r2
$C -i R2 -T 2002 -P 7200 -t npe-400 -X --sparse-mem -r 192 -c 0x2102 \
  --idle-pc=0x60646da8 -p 0:C7200-IO-2FE -p 1:PA-2FE-TX \
  -s 0:0:udp:30002:127.0.0.1:20002 \
  -s 0:1:udp:30003:127.0.0.1:20003 \
  -s 1:0:udp:21003:127.0.0.1:21002 \
  $B &
cd -
mkdir -p r0
cd r0
$C -i R0  -T 2000 -P 7200 -t npe-400 -X --sparse-mem -r 192 -c 0x2102 \
  --idle-pc=0x601bde04 -p 0:C7200-IO-2FE -p 1:PA-2FE-TX \
  -s 0:0:udp:21001:127.0.0.1:21000 \
  -s 0:1:udp:21002:127.0.0.1:21003 \
  $B &


#-----------------------------------------------------------------
#
# the configuration of routers
#
# R1
#-------------------------------------
# conf t
# ip dhcp pool global
#    network 192.168.100.0 255.255.255.0
#    default-router 192.168.100.1
# ipv6 unicast-routing
# ipv6 router rip cisco
# interface FastEthernet0/0
#   ip address 172.16.1.10 255.255.255.0
#   duplex auto
#   speed auto
#   ipv6 address 2001:1::1/64
#   ipv6 address 2001:1::/64 eui-64
#   ipv6 enable
#   ipv6 rip cisco enable
# interface FastEthernet0/1
#   ip address 192.168.100.1 255.255.255.0
#   duplex auto
#   speed auto
#   interface FastEthernet1/0
#   ip address 10.0.0.11 255.255.255.0
#   duplex auto
#   speed auto
#   ipv6 address 2001:2::1/64
#   ipv6 address 2001:2::/64 eui-64
#   ipv6 enable
#   ipv6 rip cisco enable
# router rip
#   network 10.0.0.0
#   network 172.16.0.0
#   network 192.168.100.0
# hostname R1
# exit
# wr
# sh run
#-------------------------------------
# R0
#-------------------------------------
# conf t
# ipv6 unicast-routing
# ipv6 router rip cisco
# interface FastEthernet0/0
#   ip address 10.0.0.10 255.255.255.0
#   duplex auto
#   speed auto
#   ipv6 address 2001:2::2/64
#   ipv6 address 2001:2::/64 eui-64
#   ipv6 enable
#   ipv6 rip cisco enable
# interface FastEthernet0/1
#   ip address 10.0.2.10 255.255.255.0
#   duplex auto
#   speed auto
#   ipv6 address 2001:3::2/64
#   ipv6 enable
#   ipv6 rip cisco enable
# router rip
#   network 10.0.0.0
# hostname R0
# exit
# wr
# sh run
#-------------------------------------
# R2
#-------------------------------------
# conf t
# ipv6 unicast-routing
# ipv6 router rip cisco
# interface FastEthernet0/1
#   ip address 192.168.4.10 255.255.255.0
#   duplex auto
#   speed auto
#   ipv6 address 2001:4::1/64
#   ipv6 enable
#   ipv6 rip cisco enable
# interface FastEthernet1/0
#   ip address 10.0.2.20 255.255.255.0
#   duplex auto
#   speed auto
#   ipv6 address 2001:3::1/64
#   ipv6 enable
#   ipv6 rip cisco enable
# router rip
#   network 10.0.0.0
#   network 192.168.4.0
# hostname R2
# exit
# wr
# sh run
