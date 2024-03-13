# create odm folder mount point
ODM_DIR=/data/adb/odm_etc
AUDIO_POLICY_CONF=$ODM_DIR/audio_policy_configuration.xml
AUDIO_POLICY_ENGINE=$ODM_DIR/audio_policy_engine_stream_volumes.xml

mkdir $ODM_DIR && {
  echo "odm_etc mount point created."
} || {
  [ -d $ODM_DIR ] && echo "odm_etc mount point already exists." || echo "odm_etc mount point failed." && abort exit
}
echo "dummy" > $AUDIO_POLICY_CONF && {
  echo "audio_policy_configuration.xml mount point created."
} || {
  echo "audio_policy_configuration.xml mount point failed."
  abort exit
}
echo "dummy" > $AUDIO_POLICY_ENGINE && {
  echo "audio_policy_engine_stream_volumes.xml mount point created."
} || {
  echo "audio_policy_engine_stream_volumes.xml mount point failed."
  abort exit
}

# create the Magisk init script to replace
POST_FILE="/data/adb/post-fs-data.d/make_odm_etc_writable"
cat << EOF > $POST_FILE
mount -o bind ${AUDIO_POLICY_CONF} /odm/etc/audio/sku_kalama_qssi/audio_policy_configuration.xml
mount -o bind ${AUDIO_POLICY_ENGINE} /odm/etc/audio_policy_engine_stream_volumes.xml
EOF

[ -s ${POST_FILE} ] && echo "make_odm_etc_writable created." || echo "make_odm_etc_writable failed." && abort exit
chmod +x $POST_FILE
