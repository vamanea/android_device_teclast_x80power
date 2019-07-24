# linux-firmware (from https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/linux/mrvl/pcie8897_uapsta.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mrvl/pcie8897_uapsta.bin:mrvl

# Intel Microcode (from https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/microcode/license:$(TARGET_COPY_OUT_VENDOR)/firmware/LICENSE.intel-ucode:intel

