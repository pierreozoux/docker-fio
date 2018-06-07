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

Evaluate the network performance between pods and ceph cluster nodes.
We'll use iperf for that.

```
iperf -s
iperf -c $IP -i1 -t 10 > net
```

## RAW disk performance

From the host, format your disk, mount it on `/mnt/disk/` and run:

```
docker run -it -v /mnt/disk:/test pierreozoux/fio > raw
```

## CEPH volume performance

### Procedure to setup the cluster

Once you have deployed the rook operator as described in the [documentation](https://rook.github.io/docs/rook/master/quickstart.html), please proceed to deploy the same cluster:

```
kubectl create -f k8s/rook-cluster.yaml
kubectl create -f k8s/rook-storageclass.yaml
```

The important parameter here are:
 - hostNetwork to avoid testing overlay network
 - replica set to 2

### Test performances

Once your cluster is running and healthy:
```
kubectl create -f k8s/test.yaml
```

## PR

You can now PR, and compare to others.
