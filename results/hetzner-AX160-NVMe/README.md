# Setup

This is with machines given from hetzner for the purpose of this test.
Thanks again to them to kindly give it for free during the test.

 - master: CX21 in FSN
 - worker: AX160 with 1 ssd for system and 2 NVMe for ceph

Here a link to view the server tested:
https://www.hetzner.de/dedicated-rootserver/ax160/konfigurator

# Raw Results

## Write

IOPS=43155.537996
LAT_50=716usec
LAT_999=2256usec

## READ

IOPS=44446.252967
LAT_50=700usec
LAT_999=836usec

# Ceph results

## Write

IOPS=8811.659417
LAT_50=3216usec
LAT_999=17792usec

## Read

IOPS=125362.970331
LAT_50=149usec
LAT_999=2768usec

Note:
the IOPS were ~22k for the first 30s, and then ~220k.
I think 22k is a more realistic number, but I can't figure out why it is reading so fast the second half of the test.

# Conclusion

We'll compare to https://blog.rook.io/run-your-own-high-performance-ebs-wherever-kubernetes-runs-798a136bd808

We are in the configuration B, but they get ~12k IOPS write and almost 32k in read.
We are somehow 30% bellow those results.
I'd guess that it is coming from the disk performance, but as I don't know the perf from i3.4xlarge, it is difficult to say.
(Maybe I'm also missing some basic tuning, or some beginners errors)
The CPU perf can also have an impact, I have no idea of the perf of i3 instances compared to AMD Epyc.
During the test, I saw that during writes, the cpu ~360%/OSD and the freq was ~2.7MHz.

