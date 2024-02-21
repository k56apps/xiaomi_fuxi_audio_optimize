# delete odm/etc directory
ODM_ETC_DIR="/data/adb/odm_etc"
POST_FILE="/data/adb/post-fs-data.d/make_odm_etc_writable"
if [ -d "$ODM_ETC_DIR" ]; then
    rm -rf "$ODM_ETC_DIR"
fi
if [ -d "$POST_FILE" ]; then
    rm -rf "$POST_FILE"
fi
