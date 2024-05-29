#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work

# apply zram settings
echo lz4 > /sys/block/zram0/comp_algorithm

# if Magisk change its mount point in the future
MODDIR=${0%/*}

# no longer assume $MAGISKTMP=/sbin/.magisk if Android 11 or later
# MAGISKTMP=/sbin/.magisk
MAGISKPATH=$(magisk --path)
MAGISKTMP=$MAGISKPATH/.magisk

# This script will be executed in post-fs-data mode
ODM_DIR=/data/adb/odm_etc
AUDIO_POLICY_CONF=$ODM_DIR/audio_policy_configuration.xml
AUDIO_POLICY_ENGINE_DEFAULT=$ODM_DIR/audio_policy_engine_default_stream_volumes.xml
AUDIO_POLICY_ENGINE_VENDOR=$ODM_DIR/audio_policy_engine_stream_volumes.xml

# audio quality settings
DRC_enabled=false
sRateUsb="44100 48000 64000 88200 96000 128000 176400 192000 352800 384000"
sRate="44100 48000 88200 96000 192000"
aFormat=AUDIO_FORMAT_PCM_32_BIT
aWidth=32

# apply audio policy configuration
sed -e "s/%DRC_ENABLED%/$DRC_enabled/" \
    -e "s/%SAMPLING_RATE_USB%/$sRateUsb/g" \
    -e "s/%SAMPLING_RATE%/$sRate/g" \
    -e "s/%AUDIO_FORMAT%/$aFormat/g" \
    $MODDIR/template/audio_policy_configuration.xml > \
    $AUDIO_POLICY_CONF

# apply audio policy configuration
sed -e "s/%DRC_ENABLED%/$DRC_enabled/" \
    -e "s/%SAMPLING_RATE_USB%/$sRateUsb/g" \
    -e "s/%SAMPLING_RATE%/$sRate/g" \
    -e "s/%AUDIO_FORMAT%/$aFormat/g" \
    $MODDIR/template/audio_policy_configuration.xml > \
    $MODDIR/system/vendor/etc/audio/sku_kalama_qssi/audio_policy_configuration.xml

# apply audio policy engine stream volumes
cat $MODDIR/template/audio_policy_engine_default_stream_volumes.xml > \
    $AUDIO_POLICY_ENGINE_DEFAULT
cat $MODDIR/template/audio_policy_engine_stream_volumes.xml > \
    $AUDIO_POLICY_ENGINE_VENDOR

# End of script