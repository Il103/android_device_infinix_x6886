#
# Copyright (C) 2024-2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/infinix/x6886
KERNEL_PATH := kernel/infinix/x6886
CONFIGS_PATH := $(DEVICE_PATH)/configs

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76

ZYGOTE_FORCE_64 := true
IGNORE_PREFER32_ON_DEVICE := true
TARGET_DYNAMIC_64_32_MEDIASERVER := true
TARGET_DYNAMIC_64_32_DRMSERVER := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_BOARD_PLATFORM := mt6789
TARGET_NO_BOOTLOADER := true
BOARD_HAS_MTK_HARDWARE := true

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_SOURCE := $(KERNEL_PATH)
TARGET_KERNEL_CONFIG := gki_defconfig mgk.config entry_level.config
TARGET_KERNEL_CLANG_VERSION := r416183b
TARGET_KERNEL_CLANG_PATH := $(abspath .)/prebuilts/clang/kernel/$(HOST_PREBUILT_TAG)/clang-$(TARGET_KERNEL_CLANG_VERSION)

BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_RAMDISK_USE_LZ4 := true
TARGET_USES_VULKAN := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_KERNEL_BASE := 0x40078000
BOARD_RAMDISK_OFFSET := 0x11b00000
BOARD_TAGS_OFFSET := 0x07c80000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE += bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# Kernel modules
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/ramdisk/modules.load))
BOARD_VENDOR_RAMDISK_BLOCK_LIST_FILE := $(KERNEL_PATH)/ramdisk/modules.blocklist
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_PATH)/ramdisk/, $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/ramdisk/modules.load.recovery))
RECOVERY_MODULES := $(addprefix $(KERNEL_PATH)/ramdisk/, $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(sort $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES) $(RECOVERY_MODULES))

BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/vendor_dlkm/modules.load))
BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(KERNEL_PATH)/vendor_dlkm/*.ko)

# Recovery
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.mt6789
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_F2FS := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMAGE_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := infinix_dynamic_partitions
BOARD_INFINIX_DYNAMIC_PARTITIONS_SIZE := 9126805504
BOARD_INFINIX_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product system_ext vendor_dlkm odm_dlkm

BOARD_USES_METADATA_PARTITION := true
BOARD_USES_VENDOR_DLKMIMAGE := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# EROFS hints
BOARD_EROFS_COMPRESS_HINTS := $(CONFIGS_PATH)/erofs_compress_hints.txt
BOARD_SYSTEMIMAGE_EROFS_COMPRESS_HINTS := $(CONFIGS_PATH)/erofs_compress_hints.txt
BOARD_VENDORIMAGE_EROFS_COMPRESS_HINTS := $(CONFIGS_PATH)/erofs_compress_hints.txt

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_ODM_DLKM_PROP += $(DEVICE_PATH)/odm_dlkm.prop
TARGET_VENDOR_DLKM_PROP += $(DEVICE_PATH)/vendor_dlkm.prop

# SEPolicy
include device/mediatek/sepolicy_vndr/SEPolicy.mk
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
include device/lineage/sepolicy/common/sepolicy.mk
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA2048
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048
BOARD_AVB_BOOT_ROLLBACK_INDEX := 1
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_VBMETA_SYSTEM := product system system_ext vendor
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 1
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# VINTF
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(CONFIGS_PATH)/vintf/framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE := $(CONFIGS_PATH)/vintf/manifest.xml
DEVICE_MANIFEST_FILE += \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/android.hardware.biometrics.fingerprint@2.1-service-mediatek.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/android.hardware.boot@1.2.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/android.hardware.cas@1.2-service-lazy.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/android.hardware.health@2.1.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/android.hardware.neuralnetworks-shim-service-mtk.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/android.hardware.security.keymint-service.trustonic.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/android.hardware.security.secureclock-service.trustonic.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/android.hardware.security.sharedsecret-service.trustonic.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/android.hardware.usb@1.2-service-mediatekv2.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/android.hardware.wifi.hostapd.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/android.hardware.wifi.supplicant.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/android.hardware.wifi@1.0-service.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/gnss-default.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/gnss@2.1-service.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/lbs_hidl_service@1.0.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/lights-mtk-default.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/manifest.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/manifest_android.hardware.drm@1.4-service.clearkey.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/manifest_android.hardware.drm@1.4-service.widevine.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/manifest_apuware_apusys.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/manifest_apuware_hmp.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/manifest_apuware_utils.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/manifest_cameraprovider.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/manifest_face_default.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/manifest_fingerprint.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/manifest_hwcomposer.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/manifest_media_c2_V1_1_default.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/manifest_storage.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/manifest_tneengine.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/memtrack-mediatek.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/power-default.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/vendor.hardware.trancharge-service.example.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/vendor.hardware.trantp-service.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/vendor.mediatek.hardware.paytrigger@1.0-service.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/vendor.mediatek.hardware.tranHwInfo@1.0.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/vendor.tms.hardware.nfc.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/vendor.transsion.hardware.security.deviceauthen@2.0.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/vendor.transsion.hardware.security.hap@1.0.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/vendor.transsion.hardware.security.rpmbservice@1.0-service.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/vendor.transsion.hardware.security.trancriticalparavfy@1.0-service.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/vendor.transsion.hardware.trancam.trancamserver@1.0.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/vendor.transsion.hardware.tranfacaidl-service.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/vendor.transsion.hardware.tranradionet.xml \
    vendor/infinix/x6886/proprietary/vendor/etc/vintf/manifest/vibrator-mtk-default.xml
ODM_MANIFEST_FILES := \
    vendor/infinix/x6886/proprietary/odm/etc/vintf/manifest_dsds.xml \
    vendor/infinix/x6886/proprietary/odm/etc/vintf/manifest_qsqs.xml \
    vendor/infinix/x6886/proprietary/odm/etc/vintf/manifest_ss.xml \
    vendor/infinix/x6886/proprietary/odm/etc/vintf/manifest_tsts.xml
DEVICE_MATRIX_FILE := $(CONFIGS_PATH)/vintf/compatibility_matrix.xml

# VNDK
BOARD_VNDK_VERSION := current

# Wi-Fi
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := $(BOARD_WPA_SUPPLICANT_DRIVER)
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := "STA"
WIFI_DRIVER_FW_PATH_AP := "AP"
WIFI_DRIVER_FW_PATH_P2P := "P2P"
WIFI_DRIVER_STATE_CTRL_PARAM := $(WIFI_DRIVER_FW_PATH_PARAM)
WIFI_DRIVER_STATE_ON := "1"
WIFI_DRIVER_STATE_OFF := "0"
WIFI_HAL_INTERFACE_COMBINATIONS := {{{STA}, 2}}
WIFI_HAL_INTERFACE_COMBINATIONS += ,{{{AP_BRIDGED}, 1},}
WIFI_HAL_INTERFACE_COMBINATIONS += ,{{{STA}, 1}, {{AP}, 1}}
WIFI_HAL_INTERFACE_COMBINATIONS += ,{{{STA}, 1}, {{P2P}, 1}}
WIFI_HAL_INTERFACE_COMBINATIONS += ,{{{STA}, 1}, {{NAN}, 1}}
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

# OTA assert
TARGET_OTA_ASSERT_DEVICE := X6886,Infinix-X6886

# Security patch
VENDOR_SECURITY_PATCH := 2026-02-01

# Broken rules
BUILD_BROKEN_DUP_RULES := true

# Screen density
TARGET_SCREEN_DENSITY := 392

# Inherit vendor BoardConfig
include vendor/infinix/x6886/BoardConfigVendor.mk

# Disable dex_preopt check for prebuilt AOSP modules
DISABLE_DEXPREOPT_CHECK := true
