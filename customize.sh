# replace files for /system/*
REPLACE="
"
# create the odm/etc directory and the audio_policy_configuration.xml file
mkdir /data/adb/odm_etc
touch /data/adb/odm_etc/audio_policy_configuration.xml

# create the Magisk init script to replace
echo "mount -o bind /data/adb/odm_etc/audio_policy_configuration.xml /odm/etc/audio/sku_kalama_qssi/audio_policy_configuration.xml" \
      > /data/adb/post-fs-data.d/make_odm_etc_writable
chmod 0755 /data/adb/post-fs-data.d/make_odm_etc_writable
