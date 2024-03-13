# delete odm/etc directory
ODM_DIR=/data/adb/odm_etc
[ -d ${ODM_DIR} ] && rm -rf $ODM_DIR
POST_FILE=/data/adb/post-fs-data.d/odm_writable.sh
[ -f ${POST_FILE} ] && rm -rf $POST_FILE
