# Procedure to test your performances

Fork the project and create your test folder in `results` folder.
Name it, as you feel appropriate.

## README

Create a README.md file to help other get a sense of your setup, you can take a look at other folders.

## Hardware

First to help other, we need to know which kind of hardware you use:

```
hwinfo --disk > ./hw
```

## Network performance

Evaluate the network performance between pods and ceph cluster.
We'll use iperf for that.

```
iperf -s
iperf -c $IP -i1 -t 10 > net
```

## RAW disk performance

From the host:

```
docker run -it --device /dev/nvme0:/test pierreozoux/fio > raw
```

## CEPH volume performance

From a pod:

```
docker run -it --device /dev/nvme0:/test pierreozoux/fio > ceph
```

## PR

You can now PR, and compare to others.
