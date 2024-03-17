# delete odm/etc directory
ODM_DIR=/data/adb/odm_etc
[ -d ${ODM_DIR} ] && rm -rf $ODM_DIR
POST_FILE=/data/adb/post-fs-data.d/odm_writable.sh
[ -f ${POST_FILE} ] && rm -rf $POST_FILE

# sleep 20 secs needed for settings commans to be effective in an orphan process
(((sleep 20; settings delete system volume_steps_music) 0<&- &>"/dev/null" &) &)