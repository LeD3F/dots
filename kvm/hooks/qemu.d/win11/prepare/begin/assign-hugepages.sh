#!/bin/bash
# drop cache and defrag ram
echo 3 > /proc/sys/vm/drop_caches
echo 1 > /proc/sys/vm/compact_memory

# assign hugepages
echo 6700 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
