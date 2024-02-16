# delete odm/etc directory
ODM_ETC_DIR="/data/adb/odm_etc"
if [ -d "$ODM_ETC_DIR" ]; then
    rm -rf "$ODM_ETC_DIR"
fi
