LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := thermal-conf.xml
LOCAL_VENDOR_MODULE := true
LOCAL_SRC_FILES := thermal-conf-surfacepro3.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := thermald
include $(BUILD_PREBUILT)
