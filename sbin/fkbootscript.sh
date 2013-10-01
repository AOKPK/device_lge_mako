#!/system/bin/sh
# malaroth, osm0sis, joaquinf, The Gingerbread Man, pkgnex, Khrushy, shreddintyres

# disable debugging
echo "0" > /sys/module/wakelock/parameters/debug_mask;
echo "0" > /sys/module/userwakelock/parameters/debug_mask;
echo "0" > /sys/module/earlysuspend/parameters/debug_mask;
echo "0" > /sys/module/alarm/parameters/debug_mask;
echo "0" > /sys/module/alarm_dev/parameters/debug_mask;
echo "0" > /sys/module/binder/parameters/debug_mask;

# general queue tweaks
for i in /sys/block/*/queue; do
  echo 512 > $i/nr_requests;
  echo 512 > $i/read_ahead_kb;
  echo 2 > $i/rq_affinity;
  echo 0 > $i/nomerges;
  echo 0 > $i/add_random;
  echo 0 > $i/rotational;
done;

# lmk whitelist for common launchers
list="com.android.launcher org.adw.launcher org.adwfreak.launcher com.anddoes.launcher com.gau.go.launcherex com.mobint.hololauncher com.mobint.hololauncher.hd com.teslacoilsw.launcher com.cyanogenmod.trebuchet org.zeam";
sleep 60;
for class in $list; do
  pid=`pidof $class`;
  if [ $pid != "" ]; then
    echo "-17" > /proc/$pid/oom_adj;
    chmod 100 /proc/$pid/oom_adj;
  fi;
done;
