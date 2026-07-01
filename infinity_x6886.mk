# infinity_x6886.mk - Project Infinity X for Infinix Hot 60 Pro Plus (X6886)
# Based on stock ROM dump

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, device/infinix/x6886/device.mk)

$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

PRODUCT_DEVICE := x6886
PRODUCT_NAME := infinity_x6886
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix Hot 60 Pro Plus
PRODUCT_MANUFACTURER := Infinix Mobility Limited
PRODUCT_RELEASE_NAME := Infinix Hot 60 Pro Plus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sys_tssi_64_armv82_infinix-user 15 AP3A.240905.015.A2 165004 release-keys"

BUILD_FINGERPRINT := Infinix/Infinix_Hot_60_Pro_Plus/X6886:15/AP3A.240905.015.A2/165004:user/release-keys
