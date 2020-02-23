$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults.mk)
$(call inherit-product,frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

PRODUCT_BRAND := teclast
PRODUCT_DEVICE := x80power

PRODUCT_MANUFACTURER := Teclast
PRODUCT_MODEL := X80 Power

PRODUCT_CHARACTERISTICS := tablet
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Tablet originally shipped with Android 4.4 KitKat
PRODUCT_SHIPPING_API_LEVEL := 19

# Soong Namespace to build all Blueprint modules in this repository
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

GAPPS_VARIANT := pico
GAPPS_EXCLUDED_PACKAGES := Hangouts GooglePackageInstaller TrichromeLibrary
GAPPS_PRODUCT_PACKAGES += Chrome

GAPPS_FORCE_PIXEL_LAUNCHER := true
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_WEBVIEW_OVERRIDES := true
# Overlays
PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Init
PRODUCT_PACKAGES += \
    fstab.x80power \
    init.x80power.rc \
    ueventd.x80power.rc \
    init.recovery.x80power.rc \
    kernel-modules.x80power.rc \
    su \
    powertop

# Health
# Note: android.hardware.health@2.0-service.override would be enough but it's
# completely broken: its init.rc file still references the binary without .override
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service \
    android.hardware.health@2.0-service.override

# Keymaster
# TODO: 4.0 causes issues with the lock screen
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-service \
    android.hardware.keymaster@3.0-impl

# USB
#PRODUCT_PACKAGES += \
#    android.hardware.usb@1.0-service.basic

# Graphics
PRODUCT_PACKAGES += \
    libdrm \
    libdrm_intel \
    gralloc.minigbm \
    libGLES_mesa \
    vulkan.anv \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-service.drmfb \
    android.hardware.graphics.mapper@2.0-impl

# Audio
PRODUCT_PACKAGES += \
    alsa_aplay \
    alsa_amixer \
    alsa_ctl \
    audio.a2dp.default \
    audio.r_submix.default \
    audio_policy_configuration.xml \
    audio.primary.x80power \
    asound.conf \
    android.hardware.audio@4.0-impl \
    android.hardware.audio.effect@4.0-impl \
    android.hardware.audio@2.0-service

PRODUCT_PACKAGES_DEBUG += \
    tinymix
PRODUCT_PACKAGES += \
    Terminal
# Light HAL
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.x80power

# Media
PRODUCT_PACKAGES += \
    media_codecs.xml \
    media_profiles_V1_0.xml \
    i965_drv_video \
    libffmpeg_omx \
    libffmpeg_extractor \
    libffmpeg_utils \
    libmfx_omx_core \
    libmfx_omx_components_hw \
    libmfxhw32
# libstagefrighthw is not selected, but the intel omx plugin can be used
# manually through the below property
PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.hwaccel=1 \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# power
PRODUCT_PACKAGES += \
    android.hardware.power@1.1-service.x80power

# Memtrack
PRODUCT_PACKAGES += memtrack.default \
    android.hardware.memtrack@1.0-service \
    android.hardware.memtrack@1.0-impl

# Sensors
PRODUCT_PACKAGES += \
    sensors.iio \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

# Thermal daemon
PRODUCT_PACKAGES += \
    thermald \
    thermal-conf.xml \

# WiFi
PRODUCT_PACKAGES += \
    wifi.x80power.rc \
    wpa_supplicant \
    wpa_supplicant.conf \
    hostapd

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service.vbt \
    libbt-vendor

# Camera
#PRODUCT_PACKAGES += \
#    camera.x80power

# Camera HAL
#PRODUCT_PACKAGES += \
#    camera.device@3.2-impl \
#    android.hardware.camera.provider@2.4-impl \
#    android.hardware.camera.provider@2.4-service


# Hardware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    $(if $(wildcard $(PRODUCT_DIR)/wifi/wpa_supplicant_overlay.conf),$(PRODUCT_DIR),$(LOCAL_PATH)/wifi/)wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(foreach f,$(wildcard $(LOCAL_PATH)/alsa/*),$(f):$(subst $(LOCAL_PATH),system/etc,$(f))) \
    $(foreach f,$(wildcard $(LOCAL_PATH)/init.d/*),$(f):$(subst $(LOCAL_PATH),system/etc/,$(f))) \
    $(foreach f,$(wildcard $(LOCAL_PATH)/keylayout/*),$(f):$(subst $(LOCAL_PATH),system/vendor/usr/,$(f)))

# Include well known keys for verification
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/recovery/lambdadroid \
    $(LOCAL_PATH)/recovery/lineage \
    $(LOCAL_PATH)/recovery/open_gapps

# See firmware/README.md
$(call inherit-product-if-exists, $(LOCAL_PATH)/firmware/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google/chromeos-x86/target/native_bridge_arm_on_x86.mk)

# Get the alsa files
$(call inherit-product-if-exists,hardware/libaudio/alsa.mk)

# Get the bluez files
$(call inherit-product-if-exists,external/bluetooth/blue/android/Android.mk)

$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)

$(call inherit-product-if-exists,$(LOCAL_PATH)/nativebridge/nativebridge.mk)
