# Inherit from common configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device
$(call inherit-product, device/infinix/x6886/device.mk)

# Inherit from LineageOS
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device configuration
PRODUCT_DEVICE := x6886
PRODUCT_NAME := lineage_x6886
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix Hot 60 Pro Plus
PRODUCT_MANUFACTURER := Infinix Mobility Limited
PRODUCT_RELEASE_NAME := Infinix Hot 60 Pro Plus

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="Infinix_Hot_60_Pro_Plus-v15-2024-07-01"

BUILD_FINGERPRINT := Infinix/Infinix_Hot_60_Pro_Plus/X6886:15/UP1A.231005.007/1719849270:user/release-keys
