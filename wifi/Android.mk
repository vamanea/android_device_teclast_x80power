LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := wifi.x80power.rc
LOCAL_VENDOR_MODULE := true
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := init
include $(BUILD_PREBUILT)

# Create symlink for "rfkill" tool in toybox (used in wifi.x80power.rc)
$(call symlink-file,$(TARGET_OUT_VENDOR_EXECUTABLES)/toybox_vendor,toybox_vendor,$(TARGET_OUT_VENDOR_EXECUTABLES)/rfkill)
$(LOCAL_INSTALLED_MODULE): | $(TARGET_OUT_VENDOR_EXECUTABLES)/rfkill

WPA_SUPPL_DIR = external/wpa_supplicant_8

# Private driver command implementation
include $(CLEAR_VARS)
LOCAL_MODULE := lib_driver_cmd_mwifiex
LOCAL_C_INCLUDES := $(WPA_SUPPL_DIR)/src
LOCAL_SRC_FILES := driver_cmd_nl80211.c
include $(BUILD_STATIC_LIBRARY)

# wpa_supplicant.conf
include $(WPA_SUPPL_DIR)/wpa_supplicant/wpa_supplicant_conf.mk
