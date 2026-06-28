# device.mk - Infinix Hot 60 Pro Plus (X6886)

LOCAL_PATH := device/infinix/x6886

# Inherit from vendor tree
$(call inherit-product, vendor/infinix/X6886/vendor.mk)

# Device identifier
PRODUCT_DEVICE := x6886
PRODUCT_NAME := x6886
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix Hot 60 Pro Plus
PRODUCT_MANUFACTURER := Infinix Mobility Limited

# Screen
PRODUCT_CHARACTERISTICS := phone
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Common Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Init Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.x6886.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.x6886.rc \
    $(LOCAL_PATH)/rootdir/etc/init.mt6789.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mt6789.rc \
    $(LOCAL_PATH)/rootdir/etc/init.mt6789.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mt6789.usb.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.mt6789.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
    $(LOCAL_PATH)/rootdir/fstab.mt6789:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mt6789

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.xml

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.xml

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bt_vendor.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_vendor.conf

# System properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.com.android.dataroaming=false \
    persist.vendor.radio.apm_sim_not_pwdn=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.product.device=x6886 \
    ro.build.display.id=XOS.15.1.0 \
    ro.build.version.sdk=34 \
    ro.build.version.release=15 \
    ro.build.version.security_patch=2024-05-01 \
    ro.product.board=mt6789 \
    ro.hardware=mt6789

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="Infinix_Hot_60_Pro_Plus-v15-2024-07-01"
BUILD_FINGERPRINT := Infinix/Infinix_Hot_60_Pro_Plus/X6886:15/UP1A.231005.007/1719849270:user/release-keys
