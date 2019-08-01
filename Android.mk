LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), x80power)
include $(call all-makefiles-under, $(LOCAL_PATH))
endif
