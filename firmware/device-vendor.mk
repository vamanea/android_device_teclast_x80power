# linux-firmware (from https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/linux/rtlwifi/rtl8723bs_nic.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/rtlwifi/rtl8723bs_nic.bin:rtlwifi \
    $(LOCAL_PATH)/linux/rtl_bt/rtl8723bs_fw.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl_bt/rtl8723bs_fw.bin:rtl_bt \
    $(LOCAL_PATH)/linux/rtl_bt/rtl8723bs_config-OBDA8723.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl_bt/rtl8723bs_config-OBDA8723.bin:rtl_bt

# Intel Microcode (from https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/microcode/license:$(TARGET_COPY_OUT_VENDOR)/firmware/LICENSE.intel-ucode:intel

