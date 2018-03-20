#!/bin/sh

lttng create basic-kernel-analysis
lttng enable-channel -k chan1 --subbuf-size=8M

lttng enable-event -s my-test-trace -k sched_switch,sched_wakeup,sched_waking,block_rq_complete,block_rq_issue,block_bio_remap,block_bio_backmerge,netif_receive_skb,net_dev_xmit,sched_process_fork,sched_process_exec,lttng_statedump_process_state,lttng_statedump_file_descriptor,lttng_statedump_block_device,mm_vmscan_wakeup_kswapd,mm_page_free,mm_page_alloc,block_dirty_buffer,irq_handler_entry,irq_handler_exit,softirq_entry,softirq_exit,softirq_raise,irq_softirq_entry,irq_softirq_exit,irq_softirq_raise,kmem_mm_page_alloc,kmem_mm_page_free -c chan1
lttng enable-event -s my-test-trace -k writeback_pages_written -c chan1
lttng enable-event -s my-test-trace -k lttng_logger -c chan1
lttng enable-event -s my-test-trace -k -c chan1 --syscall -a

lttng start

echo "Send 2 ping request to google.com" > /proc/lttng-logger
ping -c 2 google.com

echo "Create a temporary directory" > /proc/lttng-logger
WORKDIR="$(mktemp -d)"

echo "Enter temporary directory" > /proc/lttng-logger
cd "$WORKDIR" || exit 1

echo "Download the lttng.org front-page" > /proc/lttng-logger
wget http://lttng.org -O "./index.html"

echo "Grep for 'linux' in the downloaded html file"
grep -i linux "./index.html"

echo "Sleep for 2 seconds" > /proc/lttng-logger
sleep 2

echo "Create a 2MB random file" > /proc/lttng-logger
dd if=/dev/urandom of="./random" bs=1024k count=2

echo "Compress the random file with gzip" > /proc/lttng-logger
gzip -9 "./random"

echo "Download the 'tree' source tarball" > /proc/lttng-logger
wget http://mama.indstate.edu/users/ice/tree/src/tree-1.7.0.tgz

echo "Extract the tarball" > /proc/lttng-logger
tar xf tree-1.7.0.tgz

echo "Enter the source directory" > /proc/lttng-logger
cd tree-1.7.0

echo "Build with 'make -j4'" > /proc/lttng-logger
make -j4

echo "Delete the temporary directory" > /proc/lttng-logger
rm -rf "$WORKDIR"

lttng destroy

# EOF
