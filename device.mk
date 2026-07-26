# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# API levels
PRODUCT_SHIPPING_API_LEVEL := 31

# Allow userspace reboots
$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
$(call soong_config_set,android_hardware_audio,run_64bit,true)
$(call soong_config_set_bool,android_hardware_audio,skip_speaker_layout_channel_mask_field,true)
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl:64 \
    android.hardware.audio.effect@7.0-impl:64 \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl:64 \
    android.hardware.soundtrigger@2.3-impl:64

PRODUCT_PACKAGES += \
    audio.primary.default:64 \
    audio.bluetooth.default:64 \
    audio.r_submix.default:64 \
    audio.usb.default:64

PRODUCT_PACKAGES += \
    audio_policy.stub:64 \
    libopus.vendor:64 \
    audioclient-types-aidl-cpp.vendor:64 \
    libaudioroute.vendor:64 \
    libaudiofoundation.vendor:64 \
    libbundlewrapper:64 \
    libbluetooth_audio_session:64 \
    libaudiopreprocessing:64 \
    libalsautils:64 \
    libdownmix:64 \
    libeffectproxy:64 \
    libnbaio_mono:64 \
    libtinycompress:64 \
    libdynproc:64 \
    libhapticgenerator:64 \
    libldnhncr:64 \
    libreverbwrapper:64 \
    libprocessgroup.vendor:64

PRODUCT_PACKAGES += \
    MtkInCallService

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_param/SpeechVol_AudioParam.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_param/SpeechVol_AudioParam.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth-service.mediatek

PRODUCT_PACKAGES +=

# Boot control HAL
PRODUCT_PACKAGES += \
    com.android.hardware.boot \
    android.hardware.boot-service.default_recovery

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.common@1.0.vendor \
    android.hardware.camera.device@3.6.vendor \
    android.hardware.camera.provider@2.6.vendor

PRODUCT_PACKAGES += \
    libdng_sdk.vendor \
    libexpat.vendor \
    libexif.vendor \
    libpiex \
    libpng.vendor

# Control groups/Task profiles
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Dalvik configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.3-service \
    android.hardware.memtrack-service.mediatek

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@4.0.vendor \
    android.hardware.graphics.mapper@4.0.vendor \
    libion.vendor \
    libui.vendor \
    libdrm.vendor 

PRODUCT_PACKAGES += \
    ANGLE

# DRM
PRODUCT_PACKAGES += \
    com.android.hardware.drm.clearkey

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# FastbootD
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1.vendor:64 \
    android.hardware.biometrics.fingerprint@2.3.vendor:64

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

PRODUCT_PACKAGES += \
    libgatekeeper.vendor

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss.measurement_corrections@1.1.vendor \
    android.hardware.gnss.visibility_control@1.0.vendor \
    android.hardware.gnss@1.1.vendor \
    android.hardware.gnss@2.1.vendor \
    android.hardware.gnss-V1-ndk.vendor

PRODUCT_PACKAGES += \
    libcurl.vendor 

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.mediatek \
    android.hardware.health-service.mediatek-recovery \
    charger_res_images_vendor

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.allocator@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.allocator@1.0.vendor \
    libhidltransport \
    libhidltransport.vendor \
    libhidlmemory.vendor \
    libhwbinder \
    libhwbinder.vendor

# Init files
PRODUCT_PACKAGES += \
    fstab.mt6789 \
    fstab.mt6789.vendor_ramdisk \
    init_connectivity.rc \
    init.connectivity.common.rc \
    init.connectivity.rc \
    init.insmod.sh \
    init.insmod.mt6789.cfg \
    init.modem.rc \
    init.mt6789.power.rc \
    init.mt6789.rc \
    init.mt6789.usb.rc \
    init.mtkgki.rc \
    init.nfc.X6886.rc \
    init.project.rc \
    init.recovery.usb.rc \
    init.sensor_2_0.rc \
    ueventd.mt6789.rc

# Inherit common MediaTek IMS
$(call inherit-product, vendor/mediatek/ims/ims.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/mtk-tpd.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/mtk-tpd.kl

# Keymaster
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml

PRODUCT_PACKAGES += \
    libnetutils.vendor

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V1-ndk.vendor:64 \
    android.hardware.security.secureclock-V1-ndk.vendor:64 \
    android.hardware.security.sharedsecret-V1-ndk.vendor:64 \
    android.hardware.security.rkp-V3-ndk.vendor:64 \
    libcppbor_external.vendor:64

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.transsion

# Lineage-Specific Overlays
PRODUCT_PACKAGES += \
	LineageApertureOverlayTarget \
    LineageDialerOverlayTarget \
    LineageSettingsOverlayTarget

# Linker config
PRODUCT_VENDOR_LINKER_CONFIG_FRAGMENTS += \
    $(LOCAL_PATH)/configs/linker.config.json
    
# Media
$(call soong_config_set_bool,android_hardware_mediatek_codec2,link_v33_libstagefright_foundation,true)
PRODUCT_PACKAGES += \
    libcodec2_vndk.vendor:64 \
    libeffects:64 \
    libeffectsconfig.vendor:64 \
    libavservices_minijail_vendor:64 \
    libstagefright_softomx_plugin.vendor:64 \
    libsfplugin_ccodec_utils.vendor:64 \
    libcodec2_soft_common.vendor:64 \
    libflatbuffers-cpp.vendor:64 \
    libminijail:64 \
    libminijail.vendor:64

PRODUCT_PACKAGES += \
    android.hardware.cas@1.2-service-lazy

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/media,$(TARGET_COPY_OUT_VENDOR)/etc)

# Neural networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.0.vendor \
    android.hardware.neuralnetworks@1.3.vendor \
    libtextclassifier_hash.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.nxp \
    com.android.nfc_extras \
    Tag

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *
PRODUCT_PACKAGES += \
    FrameworksResTarget \
    SettingsResTarget \
    SettingsProviderResTarget \
    SystemUIResTarget \
    TetheringConfigTarget \
    OpenDeltaOverlayMT6789 \
    WifiResTarget

# Gralloc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gralloc/mdp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gralloc/mdp.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.dynamic.head_tracker.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.dynamic.head_tracker.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnel_migration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnel_migration.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.pixel-libperfmgr

PRODUCT_PACKAGES += \
    vendor.mediatek.hardware.mtkpower@1.2-service.stub \
    vendor.mediatek.hardware.mtkpower@1.0.vendor \
    vendor.mediatek.hardware.mtkpower@1.1.vendor

PRODUCT_PACKAGES += \
    android.hardware.power@1.3.vendor

# Power | Dummy mtkperf lib
PRODUCT_PACKAGES += \
    libmtkperf_client_vendor \
    libmtkperf_client

# Power configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Properties
include $(LOCAL_PATH)/vendor_logtag.mk

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Radio
ENABLE_VENDOR_RIL_SERVICE := true
PRODUCT_PACKAGES += \
    android.hardware.radio.config@1.3.vendor \
    android.hardware.radio@1.6.vendor \
    mdota_symlink

# Secure Element
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2.vendor

# Sensors
PRODUCT_PACKAGES += \
    libsensorndkbridge:64 \
    android.hardware.sensors@1.0.vendor:64 \
    android.hardware.sensors@2.1.vendor:64 \
    android.frameworks.sensorservice@1.0:64 \
    android.frameworks.sensorservice@1.0.vendor:64 \
    android.hardware.sensors-service.multihal \
    android.hardware.sensors@2.0-subhal-impl-1.0 \
    android.hardware.sensors@2.0-ScopedWakelock.vendor:64

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Shims
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-convert-shared.vendor \
    libpower.vendor \
    liblz4.vendor \
    libmemunreachable.vendor \
    libhidlbase_shim \
    libjsoncpp.vendor \
    libziparchive.vendor \
    libsqlite.vendor \
    libdumpstateutil.vendor

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/mediatek \
    hardware/mediatek/libmtkperf_client \
    hardware/mediatek/wlan/wifi_hal \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/transsion

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal-service.mediatek

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# Thermal policy configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_00.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_00.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_01.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_01.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_02.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_02.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_03.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_03.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_04.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_04.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_05.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_05.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_06.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_06.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_07.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_07.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_08.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_08.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_09.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_09.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_10.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_10.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_11.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_11.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_12.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_12.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_13.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_13.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_policy_14.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_policy_14.conf

# NFC configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-tms.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-tms.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-tms_RF.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-tms_RF.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-tms_RF_EC2.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-tms_RF_EC2.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-tms_RF_GB1.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-tms_RF_GB1.conf \
    $(LOCAL_PATH)/configs/nfc/libese-tms.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libese-tms.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-slm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-slm.conf

# WiFi configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

# GNSS configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gnss/agps_profiles_conf2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/agps_profiles_conf2.xml

# USB
$(call soong_config_set_bool,android_hardware_mediatek_usb,audio_accessory_supported,true)

PRODUCT_PACKAGES += \
    android.hardware.usb-service.mediatek \
    android.hardware.usb.gadget-service.mediatek

# ViPER4Android
#$(call inherit-product, packages/apps/ViPER4AndroidFX/config.mk)
    
# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.mediatek

# VNDK
PRODUCT_PACKAGES += \
    libbase_shim \
    libprocessgroup_shim \
    libcamera_metadata_shim \
    libstagefright_foundation-v33 \
    libtinyxml2-v34 \
    libutils-v34 \
    libhidlbase-v34

PRODUCT_PACKAGES += \
    libutils-v31 \
    libhidlbase-v31 \
    libbinder-v31 \
    libbinder-v32 \
    libalsautils-v31 \
    libbinder-v33 \
    libhidlbase-v33 \
    libbinder-v34 \
    libunwindstack.vendor \
    libutilscallstack.vendor

# Userdata
PRODUCT_FS_COMPRESSION := 1

# vndservice
PRODUCT_PACKAGES += \
    vndservicemanager \
    vndservice
    
# Wi-Fi
$(call soong_config_set,wpa_supplicant_8,board_wlan_mediatek_stability,true)

PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    wpa_supplicant \
    hostapd


# Stock vendor permission files not provided by AOSP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.biometrics.face.xml \
    $(LOCAL_PATH)/configs/permissions/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    $(LOCAL_PATH)/configs/permissions/android.hardware.hardware_keystore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.hardware_keystore.xml \
    $(LOCAL_PATH)/configs/permissions/android.hardware.microphone.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.microphone.xml \
    $(LOCAL_PATH)/configs/permissions/com.mediatek.hardware.vow_dsp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.mediatek.hardware.vow_dsp.xml \
    $(LOCAL_PATH)/configs/permissions/com.mediatek.hardware.vow.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.mediatek.hardware.vow.xml \
    $(LOCAL_PATH)/configs/permissions/com.nxp.ls.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.ls.xml \
    $(LOCAL_PATH)/configs/permissions/com.nxp.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.nfc.xml \
    $(LOCAL_PATH)/configs/permissions/com.transsion.tranfacsdk.permission.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.transsion.tranfacsdk.permission.xml

# ECC list and virtual SPN configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ecc_list.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ecc_list.xml \
    $(LOCAL_PATH)/configs/ecc_list_OP01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ecc_list_OP01.xml \
    $(LOCAL_PATH)/configs/ecc_list_OP02.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ecc_list_OP02.xml \
    $(LOCAL_PATH)/configs/ecc_list_OP09.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ecc_list_OP09.xml \
    $(LOCAL_PATH)/configs/ecc_list_OP12.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ecc_list_OP12.xml \
    $(LOCAL_PATH)/configs/ecc_list_OP17.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ecc_list_OP17.xml \
    $(LOCAL_PATH)/configs/ecc_list_OP18.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ecc_list_OP18.xml \
    $(LOCAL_PATH)/configs/ecc_list_OP20.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ecc_list_OP20.xml \
    $(LOCAL_PATH)/configs/ecc_list_OP236.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ecc_list_OP236.xml \
    $(LOCAL_PATH)/configs/ecc_list_preference.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ecc_list_preference.xml \
    $(LOCAL_PATH)/configs/ecc_list_tran2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ecc_list_tran2.xml \
    $(LOCAL_PATH)/configs/virtual-spn-conf-by-efgid1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/virtual-spn-conf-by-efgid1.xml \
    $(LOCAL_PATH)/configs/virtual-spn-conf-by-efpnn.xml:$(TARGET_COPY_OUT_VENDOR)/etc/virtual-spn-conf-by-efpnn.xml \
    $(LOCAL_PATH)/configs/virtual-spn-conf-by-efspn.xml:$(TARGET_COPY_OUT_VENDOR)/etc/virtual-spn-conf-by-efspn.xml \
    $(LOCAL_PATH)/configs/virtual-spn-conf-by-imsi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/virtual-spn-conf-by-imsi.xml

# IPsec configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ipsec/ipsec.conf:$(TARGET_COPY_OUT_VENDOR)/etc/ipsec.conf \
    $(LOCAL_PATH)/configs/ipsec/strongswan.conf:$(TARGET_COPY_OUT_VENDOR)/etc/strongswan.conf

# Inherit the proprietary files
$(call inherit-product, vendor/infinix/x6886/x6886-vendor.mk)


# GNSS carrier profiles
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gnss/carrier/agps_profiles_conf2_carrier_ATnT_Mexico.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/carrier/agps_profiles_conf2_carrier_ATnT_Mexico.xml \
    $(LOCAL_PATH)/configs/gnss/carrier/agps_profiles_conf2_carrier_ATnT_US.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/carrier/agps_profiles_conf2_carrier_ATnT_US.xml \
    $(LOCAL_PATH)/configs/gnss/carrier/agps_profiles_conf2_carrier_CT.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/carrier/agps_profiles_conf2_carrier_CT.xml \
    $(LOCAL_PATH)/configs/gnss/carrier/agps_profiles_conf2_carrier_Claro_Peru.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/carrier/agps_profiles_conf2_carrier_Claro_Peru.xml \
    $(LOCAL_PATH)/configs/gnss/carrier/agps_profiles_conf2_carrier_Entel_Peru.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/carrier/agps_profiles_conf2_carrier_Entel_Peru.xml \
    $(LOCAL_PATH)/configs/gnss/carrier/agps_profiles_conf2_carrier_KDDI.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/carrier/agps_profiles_conf2_carrier_KDDI.xml \
    $(LOCAL_PATH)/configs/gnss/carrier/agps_profiles_conf2_carrier_SK_Telecom.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/carrier/agps_profiles_conf2_carrier_SK_Telecom.xml \
    $(LOCAL_PATH)/configs/gnss/carrier/agps_profiles_conf2_carrier_SoftBank.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/carrier/agps_profiles_conf2_carrier_SoftBank.xml \
    $(LOCAL_PATH)/configs/gnss/carrier/agps_profiles_conf2_carrier_Sprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/carrier/agps_profiles_conf2_carrier_Sprint.xml \
    $(LOCAL_PATH)/configs/gnss/carrier/agps_profiles_conf2_carrier_T-Mobile_US.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/carrier/agps_profiles_conf2_carrier_T-Mobile_US.xml \
    $(LOCAL_PATH)/configs/gnss/carrier/agps_profiles_conf2_carrier_Test_SIM1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/carrier/agps_profiles_conf2_carrier_Test_SIM1.xml \
    $(LOCAL_PATH)/configs/gnss/carrier/agps_profiles_conf2_carrier_Test_SIM2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/carrier/agps_profiles_conf2_carrier_Test_SIM2.xml \
    $(LOCAL_PATH)/configs/gnss/carrier/agps_profiles_conf2_carrier_Verizon_Wireless.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/carrier/agps_profiles_conf2_carrier_Verizon_Wireless.xml

# AISupporter configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/aisupporter/default_predshellThermal_lr.json:$(TARGET_COPY_OUT_VENDOR)/etc/aisupporter/default_predshellThermal_lr.json

# APDB configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/apdb/APDB_MT6789___W2452:$(TARGET_COPY_OUT_VENDOR)/etc/apdb/APDB_MT6789___W2452 \
    $(LOCAL_PATH)/configs/apdb/APDB_MT6789___W2452_ENUM:$(TARGET_COPY_OUT_VENDOR)/etc/apdb/APDB_MT6789___W2452_ENUM

# DAR thermal core
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/dar_thermal_core/thermal_core_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/dar_thermal_core/thermal_core_config.json

# EsportsPro configs (11 files)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/esportspro/GameBalanceCloseMode.xml:$(TARGET_COPY_OUT_VENDOR)/etc/esportspro/GameBalanceCloseMode.xml \
    $(LOCAL_PATH)/configs/esportspro/GameBalanceOpenMode.xml:$(TARGET_COPY_OUT_VENDOR)/etc/esportspro/GameBalanceOpenMode.xml \
    $(LOCAL_PATH)/configs/esportspro/GameConserveMode.xml:$(TARGET_COPY_OUT_VENDOR)/etc/esportspro/GameConserveMode.xml \
    $(LOCAL_PATH)/configs/esportspro/GameGPUMaster.xml:$(TARGET_COPY_OUT_VENDOR)/etc/esportspro/GameGPUMaster.xml \
    $(LOCAL_PATH)/configs/esportspro/GamePerformanceMode.xml:$(TARGET_COPY_OUT_VENDOR)/etc/esportspro/GamePerformanceMode.xml \
    $(LOCAL_PATH)/configs/esportspro/GameSpaceList.json:$(TARGET_COPY_OUT_VENDOR)/etc/esportspro/GameSpaceList.json \
    $(LOCAL_PATH)/configs/esportspro/SceneGameBalanceCloseMode.xml:$(TARGET_COPY_OUT_VENDOR)/etc/esportspro/SceneGameBalanceCloseMode.xml \
    $(LOCAL_PATH)/configs/esportspro/SceneGameBalanceOpenMode.xml:$(TARGET_COPY_OUT_VENDOR)/etc/esportspro/SceneGameBalanceOpenMode.xml \
    $(LOCAL_PATH)/configs/esportspro/SceneGameConserveMode.xml:$(TARGET_COPY_OUT_VENDOR)/etc/esportspro/SceneGameConserveMode.xml \
    $(LOCAL_PATH)/configs/esportspro/SceneGamePerformanceMode.xml:$(TARGET_COPY_OUT_VENDOR)/etc/esportspro/SceneGamePerformanceMode.xml \
    $(LOCAL_PATH)/configs/esportspro/thermaloption.json:$(TARGET_COPY_OUT_VENDOR)/etc/esportspro/thermaloption.json

# MemFusion2 configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/memfusion2/fstab.enableswap:$(TARGET_COPY_OUT_VENDOR)/etc/memfusion2/fstab.enableswap \
    $(LOCAL_PATH)/configs/memfusion2/fstab.enableswap_wb:$(TARGET_COPY_OUT_VENDOR)/etc/memfusion2/fstab.enableswap_wb

# Performance configs (21 files)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/performance/blacklist.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/blacklist.json \
    $(LOCAL_PATH)/configs/performance/block_start_list.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/block_start_list.json \
    $(LOCAL_PATH)/configs/performance/keep_alive_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/keep_alive_config.json \
    $(LOCAL_PATH)/configs/performance/memfusion_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/memfusion_config.json \
    $(LOCAL_PATH)/configs/performance/policy_config_2g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/policy_config_2g_ram.json \
    $(LOCAL_PATH)/configs/performance/policy_config_3g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/policy_config_3g_ram.json \
    $(LOCAL_PATH)/configs/performance/policy_config_4g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/policy_config_4g_ram.json \
    $(LOCAL_PATH)/configs/performance/policy_config_6g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/policy_config_6g_ram.json \
    $(LOCAL_PATH)/configs/performance/policy_config_8g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/policy_config_8g_ram.json \
    $(LOCAL_PATH)/configs/performance/policy_config_12g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/policy_config_12g_ram.json \
    $(LOCAL_PATH)/configs/performance/policy_config_apm_2g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/policy_config_apm_2g_ram.json \
    $(LOCAL_PATH)/configs/performance/policy_config_apm_3g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/policy_config_apm_3g_ram.json \
    $(LOCAL_PATH)/configs/performance/policy_config_apm_4g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/policy_config_apm_4g_ram.json \
    $(LOCAL_PATH)/configs/performance/policy_config_apm_6g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/policy_config_apm_6g_ram.json \
    $(LOCAL_PATH)/configs/performance/policy_config_apm_8g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/policy_config_apm_8g_ram.json \
    $(LOCAL_PATH)/configs/performance/policy_config_apm_12g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/policy_config_apm_12g_ram.json \
    $(LOCAL_PATH)/configs/performance/whitelist_2g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/whitelist_2g_ram.json \
    $(LOCAL_PATH)/configs/performance/whitelist_3g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/whitelist_3g_ram.json \
    $(LOCAL_PATH)/configs/performance/whitelist_4g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/whitelist_4g_ram.json \
    $(LOCAL_PATH)/configs/performance/whitelist_6g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/whitelist_6g_ram.json \
    $(LOCAL_PATH)/configs/performance/whitelist_8g_ram.json:$(TARGET_COPY_OUT_VENDOR)/etc/performance/whitelist_8g_ram.json

# Predictor configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/predictor/predictor.json:$(TARGET_COPY_OUT_VENDOR)/etc/predictor/predictor.json

# SmartPA configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/smartpa_param/AW_DSP.bin:$(TARGET_COPY_OUT_VENDOR)/etc/smartpa_param/AW_DSP.bin \
    $(LOCAL_PATH)/configs/smartpa_param/AW_VMAX_LEFT.bin:$(TARGET_COPY_OUT_VENDOR)/etc/smartpa_param/AW_VMAX_LEFT.bin \
    $(LOCAL_PATH)/configs/smartpa_param/AW_VMAX_RIGHT.bin:$(TARGET_COPY_OUT_VENDOR)/etc/smartpa_param/AW_VMAX_RIGHT.bin

# ThermalEngine configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermalEngine/GameThermalEngineTypeList.xml:$(TARGET_COPY_OUT_VENDOR)/etc/thermalEngine/GameThermalEngineTypeList.xml \
    $(LOCAL_PATH)/configs/thermalEngine/GameThermalEngineWhiteList.xml:$(TARGET_COPY_OUT_VENDOR)/etc/thermalEngine/GameThermalEngineWhiteList.xml


# GVoice model files
# mkdir handled by PRODUCT_COPY_FILES
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gvoice/model/c_model.bin:$(TARGET_COPY_OUT_VENDOR)/etc/gvoice/model/c_model.bin \
    $(LOCAL_PATH)/configs/gvoice/model/dse_model.bin:$(TARGET_COPY_OUT_VENDOR)/etc/gvoice/model/dse_model.bin \
    $(LOCAL_PATH)/configs/gvoice/model/g_model.bin:$(TARGET_COPY_OUT_VENDOR)/etc/gvoice/model/g_model.bin \
    $(LOCAL_PATH)/configs/gvoice/model/spkEmb.bin:$(TARGET_COPY_OUT_VENDOR)/etc/gvoice/model/spkEmb.bin

# Audio DTS configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/dts/beq44:$(TARGET_COPY_OUT_VENDOR)/etc/dts/beq44 \
    $(LOCAL_PATH)/configs/dts/beq48:$(TARGET_COPY_OUT_VENDOR)/etc/dts/beq48 \
    $(LOCAL_PATH)/configs/dts/current_bluetooth44k:$(TARGET_COPY_OUT_VENDOR)/etc/dts/current_bluetooth44k \
    $(LOCAL_PATH)/configs/dts/current_bluetooth48k:$(TARGET_COPY_OUT_VENDOR)/etc/dts/current_bluetooth48k \
    $(LOCAL_PATH)/configs/dts/current_lineout48k:$(TARGET_COPY_OUT_VENDOR)/etc/dts/current_lineout48k \
    $(LOCAL_PATH)/configs/dts/current_speaker48k:$(TARGET_COPY_OUT_VENDOR)/etc/dts/current_speaker48k \
    $(LOCAL_PATH)/configs/dts/current_usb44k:$(TARGET_COPY_OUT_VENDOR)/etc/dts/current_usb44k \
    $(LOCAL_PATH)/configs/dts/current_usb48k:$(TARGET_COPY_OUT_VENDOR)/etc/dts/current_usb48k \
    $(LOCAL_PATH)/configs/dts/customer.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/dts/customer.cfg \
    $(LOCAL_PATH)/configs/dts/ctc:$(TARGET_COPY_OUT_VENDOR)/etc/dts/ctc \
    $(LOCAL_PATH)/configs/dts/dts-eagle.lic:$(TARGET_COPY_OUT_VENDOR)/etc/dts/dts-eagle.lic \
    $(LOCAL_PATH)/configs/dts/dts_audio_settings:$(TARGET_COPY_OUT_VENDOR)/etc/dts/dts_audio_settings \
    $(LOCAL_PATH)/configs/dts/games_accessory44:$(TARGET_COPY_OUT_VENDOR)/etc/dts/games_accessory44 \
    $(LOCAL_PATH)/configs/dts/games_accessory48:$(TARGET_COPY_OUT_VENDOR)/etc/dts/games_accessory48 \
    $(LOCAL_PATH)/configs/dts/games_speaker48:$(TARGET_COPY_OUT_VENDOR)/etc/dts/games_speaker48 \
    $(LOCAL_PATH)/configs/dts/movie_accessory44:$(TARGET_COPY_OUT_VENDOR)/etc/dts/movie_accessory44 \
    $(LOCAL_PATH)/configs/dts/movie_accessory48:$(TARGET_COPY_OUT_VENDOR)/etc/dts/movie_accessory48 \
    $(LOCAL_PATH)/configs/dts/movie_speaker48:$(TARGET_COPY_OUT_VENDOR)/etc/dts/movie_speaker48 \
    $(LOCAL_PATH)/configs/dts/music_accessory44:$(TARGET_COPY_OUT_VENDOR)/etc/dts/music_accessory44 \
    $(LOCAL_PATH)/configs/dts/music_accessory48:$(TARGET_COPY_OUT_VENDOR)/etc/dts/music_accessory48 \
    $(LOCAL_PATH)/configs/dts/music_speaker48:$(TARGET_COPY_OUT_VENDOR)/etc/dts/music_speaker48 \
    $(LOCAL_PATH)/configs/dts/off_speaker48:$(TARGET_COPY_OUT_VENDOR)/etc/dts/off_speaker48

# TranFac (Transsion Face Unlock) configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/tranfac/common/CommonParams.json:$(TARGET_COPY_OUT_VENDOR)/etc/tranfac/common/CommonParams.json \
    $(LOCAL_PATH)/configs/tranfac/feature/FeatureAuto.json:$(TARGET_COPY_OUT_VENDOR)/etc/tranfac/feature/FeatureAuto.json \
    $(LOCAL_PATH)/configs/tranfac/aidl/default/NvBlock.json:$(TARGET_COPY_OUT_VENDOR)/etc/tranfac/aidl/default/NvBlock.json \
    $(LOCAL_PATH)/configs/tranfac/aidl/default/SensorNv.json:$(TARGET_COPY_OUT_VENDOR)/etc/tranfac/aidl/default/SensorNv.json \
    $(LOCAL_PATH)/configs/tranfac/sign/Signature.json:$(TARGET_COPY_OUT_VENDOR)/etc/tranfac/sign/Signature.json

# Vendor overlay prebuilt APKs
PRODUCT_PACKAGES += \
    GoogleTetheringResOverlay \
    InProcessTetheringResOverlay \
    NetworkStackGoogleResOverlay \
    NetworkStackInProcessResOverlay \
    NetworkStackResOverlay \
    TetheringResOverlay \
    ConnectivityResOverlay \
    FrameworkResOverlay \
    FrameworkResOverlayExt \
    MtkSettingsResOverlay \
    MtkTelephonyServiceResOverlay \
    SettingsProviderResOverlay \
    WifiResMainlineOverlay \
    WifiResOverlay
