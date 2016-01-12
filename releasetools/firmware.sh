#!/sbin/sh

set -e

# Detect the exact model from the LTALabel partition
# This looks something like:
# 1291-1739_5-elabel-d2203-row.html
mkdir -p /lta-label
mount -r -t ext4 /dev/block/platform/msm_sdcc.1/by-name/LTALabel /lta-label
variant=`ls /lta-label/*.html | sed s/.*-elabel-// | sed s/-row.html// | tr -d '\n\r'`
umount /lta-label

mount -t ext4 /dev/block/platform/msm_sdcc.1/by-name/system /system
# Symlink the correct modem blobs
if [ $variant == "d2202" ] || [ $variant == "d2212" ]; then
basedir="/system/blobs/3G/"
cd $basedir
find . -type f | while read file; do ln -s $basedir$file /system/etc/firmware/$file ; done
else
basedir="/system/blobs/4G/"
cd $basedir
find . -type f | while read file; do ln -s $basedir$file /system/etc/firmware/$file ; done
fi;

exit 0
