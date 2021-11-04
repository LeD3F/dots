#!/bin/bash
# remove hugepages
echo 0 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
